# aws_instance for jenkins
resource "aws_instance" "jenkins-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.INSTANCE_TYPE

  # the VPC subnet
  subnet_id = aws_subnet.main-public.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  # execute script before create instance
  user_data = data.template_file.user_data.rendered

  tags = {
    Name = "jenkins-instance"
  }
}

resource "aws_instance" "tomcat-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.INSTANCE_TYPE

  # the VPC subnet
  subnet_id = aws_subnet.main-public.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  # execute script before create instance
  user_data = data.template_file.user_data_tomcat.rendered

  tags = {
    Name = "tomcat-instance"
  }

}

# template file for jenkins instance
data "template_file" "user_data" {
  template = file("scripts/init-jenkins.tpl")
}

# template file for tomcat instance
data "template_file" "user_data_tomcat" {
  template = file("scripts/tomcat.tpl")
}