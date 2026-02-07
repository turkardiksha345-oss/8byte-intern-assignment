# VPC Creation Block

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name = "8byte-vpc"
    }
  
}

#Public Subnet

resource "aws_subnet" "my_public" {
    vpc_id = aws_vpc.my_vpc.id 
    cidr_block = "10.0.0.0/17"
    
    tags = {
      env = "dev"
      name = "tf_ps"
    }
  
}


#Internet Gateway

resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
     name = "8byte-igw"
    }
  
}

# Route Table

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "8byte-public-rt"
  }
}

# Route Table Association

resource "aws_route_table_association" "public_association" {
    subnet_id = aws_subnet.my_public.id 
    route_table_id = aws_route_table.public_rt.id
}



# security group

resource "aws_security_group" "aws_sg" {     
  name        = "sg_name"
  description = "security group for instance"
  vpc_id      = aws_vpc.my_vpc.id 

    ingress {                               # inbound rule
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }


    ingress {                               # inbound rule
    description = "Node App"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    egress {                               # outbound rule
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
     tags = {
         Name = "8byte-app-sg"
     }
}

## Ec2 Instnace

resource "aws_instance" "my_instance" {
  ami = "ami-0fa91bc90632c73c9"    # ----> change according to the AMI 
  instance_type = "t3.micro"
   subnet_id = aws_subnet.my_public.id
  vpc_security_group_ids = [aws_security_group.aws_sg.id]    # associating security group with instance
  associate_public_ip_address = true

 user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt-get install -y docker.io
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ubuntu
              EOF


  tags = {
   Name = "8byte-devops-ec2"
  }
}

