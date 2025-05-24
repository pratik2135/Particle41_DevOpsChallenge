variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"

}
variable "container_image" {
  description = "Docker image URL for the ECS task"
  type        = string
  default     = "pratikk1/myflaskapp:latest" # Docker image URL

}