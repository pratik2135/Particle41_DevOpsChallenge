#Applicationloadbalancer
resource "aws_alb" "app" {
    name            = "simple-timeservice-alb"
    internal        = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.alb-sg.id]
    subnets         = module.vpc.public_subnets

    enable_deletion_protection = false

}
#Targetgroup
resource "aws_lb_target_group" "app_tg" {
    name     = "simple-timeservice-tg"
    port     = 8080
    protocol = "HTTP"
    vpc_id   = module.vpc.vpc_id

    health_check {
        path                = "/health"
        interval            = 30
        timeout             = 5
        healthy_threshold  = 2
        unhealthy_threshold = 2
    }
    target_type = "ip" # Use "ip" for Fargate tasks

}

#Listener
resource "aws_lb_listener" "app_listener" {
    load_balancer_arn = aws_alb.app.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.app_tg.arn
    }

}