# Uloha8

**Stručný popis**  
Tento projekt nasadzuje Nginx na AWS ECS (Fargate) prostredníctvom Application Load Balancer, pričom deployment je riadený pomocou Terraformu a GitHub Actions.

---

## Obsah

- `.github/workflows/` – konfigurácie workflow pre CI/CD s použitím GitHub Actions  
- `Dockerfile` – definícia Docker image s Nginx (a prípadne ďalšími nastaveniami)  
- Terraform súbory:  
  - `main.tf`, `variables.tf`, `outputs.tf`, `terraform.tfvars`, `ecr.tf`, `iam.tf`, `ecs_task_definition.tf`, `outputs.tf`, `terraform.tfvars`, `variables.tf`  
  - `.terraform.lock.hcl` – uzamknutie závislostí Terraformu  
- `index.html` – vzorová stránka, ktorú Nginx naservíruje  

---

## Predpoklady

- AWS účet s oprávneniami na vytvorenie:  
  - S3 bucketu (pre Terraform state)  
  - ECR repository (pre Docker image)  
  - ECS tasku a Fargate služby  
  - IAM rolí potrebných na nasadenie  
- Nainštalovaný `terraform` (a možno `aws` CLI, ak potrebujete manuálnu interakciu)  

---

## Nasadenie (Deployment)

1. **Pripravte backend pre Terraform (S3 bucket)**  
   Vytvorte S3 bucket, napríklad:  
   ```hcl
   backend "s3" {
     bucket = "{NAZOV_S3_BUCKETU}"
     key    = "ecs-demo/terraform.tfstate"
     region = "eu-central-1"
   }
