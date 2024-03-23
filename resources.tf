resource "aws_vpc" "this" {
  cidr_block = var.vpc_parameters.cidr_block

  tags = {
    Name : "aws-vpc-test"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_public_parameters
  availability_zone = "us-east-2a"

  tags = {
    Name : "aws-public-subnet"
  }
}

resource "aws_network_interface" "primary" {
  subnet_id = aws_subnet.public.id

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "ubuntu-server" {
  ami           = "ami-084259a90ab18495c"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.primary.id
    device_index         = 0
  }

   connection {
    type     = "ssh"
    user     = "root"
    password = var.root_password
    host     = self.public_ip
   }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install software-properties-common",
      "sudo add-apt-repository --yes --update ppa:ansible/ansible",
      "sudo apt install ansible",
      "ansible-playbook path/to/ansible-playbook.yml"
    ]
  }

  tags = {
    Name = "ubuntu-instance"
  }
}
