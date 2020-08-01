locals {
  user_data = <<EOF
#!/bin/bash -x
echo "begin"
echo ECS_CLUSTER=JenkinsCluster >> /etc/ecs/ecs.config
start ecs
EOF
}

resource "aws_instance" "jenkins-instance" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_default_security_group.jenkins-default-sg.id]
  subnet_id= aws_subnet.jenkins-pub-sn.id
  user_data_base64 = base64encode(local.user_data)
  depends_on = [aws_ecs_cluster.jenkins_cluster]
  iam_instance_profile = "EC2"
  key_name = var.key_name

  tags = {
      name = "Jenkins Instance"
  }
}