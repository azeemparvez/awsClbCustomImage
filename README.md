
# Creating a Classic Load Balancer on AWS using Terraform 

This is a sample project to test the classic load balancer deployment using terraform 


## Follow below documentation to install terraform on your terraform node 

[Terraform Installation](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform)

## Follow below documentation to install awscli on the same node, and configure aws cli with your programmatic access, and configure the backednd S3 with dynamodb for remoter state 

[AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[Configure AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/configure/index.html)

[Configure terrraform remote state backend, and DynamoDB for state lock](https://developer.hashicorp.com/terraform/language/settings/backends/s3)


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elb.clb](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/elb) | resource |
| [aws_instance.web-1](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/instance) | resource |
| [aws_instance.web-2](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/instance) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/internet_gateway) | resource |
| [aws_route_table.igw-rt](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/route_table) | resource |
| [aws_route_table_association.igw-rt-a](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw-rt-b](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw-rt-c](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/route_table_association) | resource |
| [aws_security_group.web](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/security_group) | resource |
| [aws_subnet.private-1](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/subnet) | resource |
| [aws_subnet.private-2](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/subnet) | resource |
| [aws_subnet.private-3](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/subnet) | resource |
| [aws_subnet.public-1](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/subnet) | resource |
| [aws_subnet.public-2](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/subnet) | resource |
| [aws_subnet.public-3](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/resources/vpc) | resource |
| [aws_availability_zones.zones](https://registry.terraform.io/providers/hashicorp/aws/5.0.1/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | ami | `string` | `""` | no |
| <a name="input_internet"></a> [internet](#input\_internet) | Internet IP address | `string` | `""` | no |
| <a name="input_prisub-1"></a> [prisub-1](#input\_prisub-1) | private subnet 1 CIDR | `string` | `""` | no |
| <a name="input_prisub-2"></a> [prisub-2](#input\_prisub-2) | private subnet 2 CIDR | `string` | `""` | no |
| <a name="input_prisub-3"></a> [prisub-3](#input\_prisub-3) | private subnet 3 CIDR | `string` | `""` | no |
| <a name="input_pusub-1"></a> [pusub-1](#input\_pusub-1) | public subnet 1 CIDR | `string` | `""` | no |
| <a name="input_pusub-2"></a> [pusub-2](#input\_pusub-2) | public subnet 2 CIDR | `string` | `""` | no |
| <a name="input_pusub-3"></a> [pusub-3](#input\_pusub-3) | public subnet 3 CIDR | `string` | `""` | no |
| <a name="input_vpc-cidr"></a> [vpc-cidr](#input\_vpc-cidr) | CIDR block details for main VPC | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_clb"></a> [clb](#output\_clb) | n/a |

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

