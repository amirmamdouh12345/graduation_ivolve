resource "aws_security_group" "instance_security_group" {
  
    vpc_id = aws_vpc.grad-ivolve.id
    ingress {
        from_port = 0
        to_port = 0
        protocol = -1 
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]

    }


}