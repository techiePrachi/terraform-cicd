terraform{
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~>5.0"
        }
    }
}

provider "aws"{
    region= "us-east-1"

}

resource "aws_vpc" "this"{
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "cicd-vpc"
    }
}

resource "aws_subnet" "this"{
    vpc_id = aws_vpc.this.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "${var.region}a"
}

resource "aws_instance" "web"{
    ami = var.ami
    instance_type = "t2.micro"
    subnet_id = aws_subnet.this.id
    tags = {
        Name = "terraform-cicd-demo"
    }
}
