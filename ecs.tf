resource "aws_ecs_cluster" "jenkins_cluster" {
  name = "JenkinsCluster"
}

resource "aws_ecs_service" "jenkins" {
  name            = "jenkins-ci"
  cluster         = aws_ecs_cluster.jenkins_cluster.id
  task_definition = aws_ecs_task_definition.jenkins-task.arn
  desired_count   = 1
}

resource "aws_ecs_task_definition" "jenkins-task" {
  family = "jenkins-task"
  task_role_arn = "arn:aws:iam::474429983342:role/ecsTaskExecutionRole"
  execution_role_arn = "arn:aws:iam::474429983342:role/ecsTaskExecutionRole"
  requires_compatibilities = ["EC2"]
  container_definitions = <<DEFINITION
[
    {
      "name": "jenkins",
      "image": "jenkins/jenkins:lts",
      "memory": 512,
      "essential": true,
      "portMappings": [
        {
          "containerPort": 8080,
          "hostPort": 80
        }
      ]
    }
  ]
DEFINITION

  volume {
    name = "service-storage"
    host_path = "/ecs/service-storage"
  }
}