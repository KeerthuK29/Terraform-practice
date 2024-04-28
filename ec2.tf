resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-080e1f13689e07408"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}