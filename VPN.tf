module "vpn-gateway_example_complete-vpn-connection-transit-gateway" {
  source  = "terraform-aws-modules/vpn-gateway/aws//examples/complete-vpn-connection-transit-gateway"
  version = "3.7.2"
}

resource "aws_vpn_gateway" "vgw" {
  vpc_id = data.aws_vpc.custom.id
  tags = {
    Name = "main_vgw"
  }
}
	
resource "aws_customer_gateway" "cgw" {
  bgp_asn    = 65000
  ip_address = data.aws_instance.bastion.public_ip
  type       = "ipsec.1"

  tags = {
    Name = "main_cgw"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgwva" {
  subnet_ids         = [aws_subnet.private.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = data.aws_vpc.custom_vpc_name.id
}
