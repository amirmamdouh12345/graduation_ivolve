resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.grad-ivolve.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
}

resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.grad-ivolve.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet-gateway.id
    }
}

resource "aws_route_table_association" "route_table_association" {
    subnet_id =  aws_subnet.public_subnet.id
    route_table_id = aws_route_table.route_table.id
}


module "ec2_1" {
    source = "./ec2_module"
    ami = "ami-05b10e08d247fb927"
    isPublic = true
    subnet_id = aws_subnet.public_subnet.id
    security_group_ids = [aws_security_group.instance_security_group.id]
    key_pair = aws_key_pair.instances_keypair.key_name
    user_data = ""
}

module "ec2_2" {
    source = "./ec2_module"
    ami = "ami-05b10e08d247fb927"
    isPublic = true
    subnet_id = aws_subnet.public_subnet.id
    security_group_ids = [aws_security_group.instance_security_group.id]
    key_pair = aws_key_pair.instances_keypair.key_name
    user_data = ""
}

