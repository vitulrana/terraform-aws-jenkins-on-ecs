# Jenkins Setup on ECS Cluster

There are few things which needs to be there already in your Account 

- Ecs Task Execution Role for EC2 - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html#create-task-execution-role
- EC2 Role - One must allow EC2 to Register ECS Cluster
- If you are using S3 for using Terafform State, S3 Bucket needs to be created before hand.


To Create Cluster on AWS EC2 Using ECS Cluster

`terraform init`

`terraform apply -var access_key=bar -var secret_key=baz -var key_name=foo ecs_execution_role_arn=foo ecs_task_role_arn=foo`

Instead of Passing the Variables from Command Line, you can always update the above values in `variables.tf`
