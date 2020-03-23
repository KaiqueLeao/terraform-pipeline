# create a gateway
resource "aws_internet_gateway" "gw-jenkins" {
  vpc_id = aws_vpc.vpc-pipeline.id
    tags = {
        Name = "gw-jenkins"
    }
}