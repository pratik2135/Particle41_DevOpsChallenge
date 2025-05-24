resource "aws_ecs_cluster" "name" {
    name = "simple-timeservice-cluster"
}

resource "aws_ecs_task_definition" "app" {
    family                   = "simple-timeservice-task"
    network_mode             = "awsvpc"
    requires_compatibilities  = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

    container_definitions = jsonencode([
        {
            name      = "simple-timeservice-container"
            image     = var.container_image # Replace with your Docker image URL
            essential = true
            portMappings = [
                {
                    containerPort = 8080
                    protocol      = "tcp"
                }
            ]
        }
    ])

}

resource "aws_ecs_service" "app" {
    name            = "simple-timeservice-service"
    cluster         = aws_ecs_cluster.name.id
    task_definition = aws_ecs_task_definition.app.arn
    desired_count   = 1
    launch_type     = "FARGATE"

    network_configuration {
        subnets          = module.vpc.private_subnets
        security_groups  = [aws_security_group.ecs-sg.id]
        assign_public_ip = false
    }

    load_balancer {
        target_group_arn = aws_lb_target_group.app_tg.arn
        container_name   = "simple-timeservice-container"
        container_port   = 8080
    }

}