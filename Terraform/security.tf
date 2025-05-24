resource "aws_iam_role" "ecs_task_execution_role" {
    name = "ecsTaskExecutionRole"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Effect = "Allow"
            Principal = {
                Service = "ecs-tasks.amazonaws.com"
            }
            Action = "sts:AssumeRole"
        }
        ]
  })

}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
    role       = aws_iam_role.ecs_task_execution_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"

}

resource "aws_security_group" "alb-sg" {
    name        = "alb-sg"
    description = "Security group for ALB"
    vpc_id      = module.vpc.vpc_id # Reference the VPC ID from the VPC module
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # Allow HTTP traffic from anywhere
        }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1" # Allow all outbound traffic
        cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
        }
}

resource "aws_security_group" "ecs-sg" {
    name        = "ecs-sg"
    description = "Security group for ECS tasks"
    vpc_id      = module.vpc.vpc_id # Reference the VPC ID from the VPC module
    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        security_groups = [aws_security_group.alb-sg.id] # Allow traffic from ALB security group
            }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1" # Allow all outbound traffic
        cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic

          }
    }