# Jenkins Setup on ECS Cluster

There are few things which needs to be there already in your Account 

- Ecs Task Execution Role for EC2 - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html#create-task-execution-role
- EC2 Role - Basically these 2 rules would be enough (AmazonEC2ContainerServiceforEC2Role, AmazonEC2FullAccess)
- If you are using S3 for using Terafform State, S3 Bucket needs to be created before hand.


To Create Cluster on AWS EC2 Using ECS Cluster

`terraform init`

`terraform apply -var profile=aws-dev -var key_name=foo ecs_execution_role_arn=foo ecs_task_role_arn=foo`

Instead of Passing the Variables from Command Line, you can always provide the values by using vars.tf or creating .tfvars file.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_default_route_table.jenkins-default-route-table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_default_security_group.jenkins-default-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_security_group) | resource |
| [aws_ecs_cluster.jenkins_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.jenkins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.jenkins-task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_instance.jenkins-instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.jenkins-igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_subnet.jenkins-pub-sn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.jenkins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | n/a | `string` | `"ami-0e13e0df31e6aa478"` | no |
| <a name="input_ecs_execution_role_arn"></a> [ecs\_execution\_role\_arn](#input\_ecs\_execution\_role\_arn) | n/a | `string` | `""` | no |
| <a name="input_ecs_task_role_arn"></a> [ecs\_task\_role\_arn](#input\_ecs\_task\_role\_arn) | n/a | `string` | `""` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | `""` | no |
| <a name="input_profile"></a> [profile](#input\_profile) | n/a | `string` | `"default"` | no |
| <a name="input_public_subnet_cidr"></a> [public\_subnet\_cidr](#input\_public\_subnet\_cidr) | n/a | `string` | `"10.0.0.0/24"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"ap-south-1"` | no |
| <a name="input_subnet-az"></a> [subnet-az](#input\_subnet-az) | n/a | `string` | `"ap-south-1a"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | n/a |
