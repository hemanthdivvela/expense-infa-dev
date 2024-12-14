resource "aws_key_pair" "vpn" {
  key_name   = "openvpn"
  # you can paste the public key directly like this 
  #public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEVQV8IVovFjZAwkheqGfTDCW+QBTCoI1isuveZTFc16 91701@hemanth"
  public_key = file("~/.ssh/openvpn.pub")
  # ~ means windows home directory
}

module "vpn" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  key_name = aws_key_pair.vpn.key_name
  name = "${var.project_name}-${var.environment}-vpn"

  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  # convert string to list and get first element
  subnet_id              = local.public_subnet_id

  ami = data.aws_ami.ami_info.id
  
  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-vpn"
    }
  )
}