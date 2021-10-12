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
  key_name   = "main"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzXbbxK3VekVvDon22Dk/DT37oEwn7GaRb31y5LZihuxZu5hmESUS6/gFakRKSpelv3GnPmExd+PyZdfswvUm2OE5LfxlEnUm9iwqTrvkO5ZaAKlJakTv5NVQYOrCtazB2RLeuilBjn1IGYjJ5bqFwcr0PNu50T9eXKAd89jCEwTQTze5/RBqMcgb4A9a5y5iFBpz8rhnBMCWOuUbFEsmiuloT1ftriK6fJWbgoPXOZRXkntN1VZoNhAAsfnCRBtbEDioXrR+IdKbvDTlrsYPFf0yFVv552uzfeBDfnYdJKBfJW77yx7r1rk148DUtdVfh4jC9QE/ppTAYQhbp4c79 katya@desktop"
}
