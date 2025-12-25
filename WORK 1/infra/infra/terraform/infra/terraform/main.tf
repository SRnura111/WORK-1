// Terraform шаблоны — бастама (AWS мысалында). Бұл файл *шаблон* — нақты қолдануға алдында конфигурацияларды баптаңыз.
// Provider, VPC, EKS/RDS секциялары модульдерге бөлініп жазылуы ұсынылады.

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket_versioning" "state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

# Example: RDS Postgres (dev/stage), minimal config — fill with secure values before apply
resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = var.db_instance_class
  db_name              = "myappdb" # 'name' орнына 'db_name'
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
}
# NOTE:
# - Для production рекомендую использовать отдельные Terraform-модули:
#   - network (VPC, subnets, NACLs)
#   - k8s (EKS/GKE/AKS)
#   - database (RDS/Aurora)
#   - registry (ECR / GCR)
#   - iam (roles/policies)