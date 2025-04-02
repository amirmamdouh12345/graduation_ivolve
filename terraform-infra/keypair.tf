resource "tls_private_key" "private-key" {
    rsa_bits = "4096"
    algorithm = "RSA"
}

resource "aws_key_pair" "instances_keypair" {
    key_name = "amir-keypair"
    public_key= tls_private_key.private-key.public_key_openssh

}

resource "local_file" "amir-keypair" {
    filename = "amir-keypair.pem"
    content = tls_private_key.private-key.private_key_pem
}