# tf
terraform files

Create s3 bucket as backend:

1. if you already have s3 bucket:
 - enter bucket name and region into init_configuration file
 - terraform init -backend-config '.\s3_backend\init_configuration'

2. if you don't have s3 bucket:
 - make terraform apply s3_backend before previous steps