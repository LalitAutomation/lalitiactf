provider "aws"{
    region="us-east-1"
}

resource "aws_instance" "ec2"{

    ami="ami-0947d2ba12ee1ff75"
    instance_type="t2.micro"
    security_groups=[aws_security_group.lalit_security_group.name]
}

resource "aws_security_group" "lalit_security_group"{
    name="http_security_group"
    ingress{
        cidr_blocks=["0.0.0.0/0"]
        protocol="TCP"
        from_port="80"
        to_port="80"
    }

    egress{
        cidr_blocks=["0.0.0.0/0"]
        protocol="TCP"
        from_port="80"
        to_port="80"
    }

    
}

output "public_ip"{
    value=aws_instance.ec2.public_ip
}

output "private_ip"{
    value=aws_instance.ec2.private_ip
}
output "attached_security_groups"{
    value=aws_instance.ec2.security_groups
}



/* Outputs

Outputs:

attached_security_groups = [
  "http_security_group",  
]
private_ip = 172.31.23.166
public_ip = 54.235.29.250 

*/