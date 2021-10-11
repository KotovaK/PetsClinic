resource "aws_instance" "jenkins" {
  ami                    = "ami-05f7491af5eef733a"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.ci.id]
  key_name               = aws_key_pair.ci.id

  tags = {
    Name = "Jenkins"
  }
}

resource "aws_instance" "ci-dev" {
  ami                    = "ami-05f7491af5eef733a"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.ci.id]
  key_name               = aws_key_pair.ci.id

  tags = {
    Name = "CI-Dev"
  }
}

resource "aws_key_pair" "ci" {
  key_name   = "ci.pub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDpwrp3flPJEe5PhsczAVsGeuTkh6a2IyJSHatZMWkn/EZDcTiO2zuI6oqhZOa5H86bt1XdQRKfS5S1joWpc2I5xEDHTeUo15W4DkBP3Erc5bAbM/8e8/r6MrapPV4Hkbwa/MT/bmAMl4eLGVTHmhUyTBkwU8WNUe7Gh+l4eUcDtKuVoeApL7QkjwybR+sUpDj2/gXhHR/aVe/UyC2zNuvysFxX6qLK3rQQNTAmvSmvo/BFK0Ktr56F0eenVq+4JXXxvhT26ejcwk8z64RgmnBWb+IlaQjrA2iOKz4ky/zC/loWSlABIz4syAG/Vw1rw0dIi3SMgKyFm1g72c3Hc1vh Oleksandr.Kotov"
}
