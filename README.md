
# Creating a Classic Load Balancer on AWS using Terraform 

This is a sample project to test the classic load balancer deployment using terraform 


## Follow below documentation to install terraform on your terraform node 

[Terraform Installation](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform)

## Follow below documentation to install awscli on the same node, and configure aws cli with your programmatic access, and configure the backednd S3 with dynamodb for remoter state 

[AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[Configure AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/configure/index.html)

[Configure terrraform remote state backend, and DynamoDB for state lock](https://developer.hashicorp.com/terraform/language/settings/backends/s3)


## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`vpc-cidr`

`pusub-1`

`pusub-2`

`pusub-3`

`prisub-1`

`prisub-2`

`prisub-3`

`ami` # Please use a custom AMI for this. the custom AMI should be centOS based with httpd running
## Deployment

Follow the terraform workflow to create the Deployment

to intialise the terrform run

```bash
  terraform init 
```

to see the terraform plan

```bash
  terraform plan
```

to run, apply the configuration 

```bash
  terraform apply --auto-approve
```

once you have tested, please destroy the infrastructure using 

```bash
  terraform destroy --auto-approve
```
## Authors

- [@azeemparvez](https://www.github.com/azeemparvez), [email](azeem_parvez@hotmail.com)

