variable "ecr_repo_name" {
  description = "Názov ECR repository"
  type        = string
  default     = "uloha8-nginx-app"
}

resource "aws_ecr_repository" "app" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  force_delete = true

  tags = {
    Project = "uloha8"
  }
}
