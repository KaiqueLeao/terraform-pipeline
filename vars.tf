# set default value to region variable
variable "AWS_REGION" {
  default = "sa-east-1"
}

# set default value to instance type
variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

# set default value to private key variable
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykeypair"
}

# set default value to public key variable
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykeypair.pub"
}

# set default value to map variable
variable "AMIS" {
  type = map(string)
  default = {
    sa-east-1 = "ami-07820a4443539a2b0"
  }
}

