# aws_instance for jenkins
resource "aws_instance" "jenkins-istance" {
  ami           = "ami-07820a4443539a2b0"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  # execute script before create instance
  user_data = data.template_file.user_data.rendered
}

data "template_file" "user_data" {
  template = file("scripts/init-jenkins.tpl")
}