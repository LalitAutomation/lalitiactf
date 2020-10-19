provider "aws"{
    region=var.region
}

resource "aws_instance" "ec2"{
    ami="ami-0947d2ba12ee1ff75"
    instance_type="t2.micro"
    tags={
        name=var.instance_name
    }

}

output "public_ip"{
    value=aws_instance.ec2.public_ip
    }

output "private_ip"{

    value=aws_instance.ec2.private_ip
}

