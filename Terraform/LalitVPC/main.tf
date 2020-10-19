provider "aws"{
    region="us-east-1"
}

resource "aws_vpc" "my_vpc"{
    cidr_block="10.0.0.0/24"
    tags={
        name="myvpc"
    }
}

//Output variable to get values after VPC is created

output "VPC_ID"{
    value=aws_vpc.my_vpc.id
}

output "ARN"{
    value=aws_vpc.my_vpc.arn
}
output "instance_tenancy"{
    value=aws_vpc.my_vpc.instance_tenancy
}

output "default_security_group_id"{
    value=aws_vpc.my_vpc.default_security_group_id
}

output "main_route_table_id"{
    value=aws_vpc.my_vpc.main_route_table_id
}
output "default_route_table_id"{
    value=aws_vpc.my_vpc.default_route_table_id
}

output "default_network_acl_id"{
    value=aws_vpc.my_vpc.default_network_acl_id
}
/*

Outputs:

ARN = arn:aws:ec2:us-east-1:853394572982:vpc/vpc-0eb63ce2d01396222
VPC_ID = vpc-0eb63ce2d01396222
default_network_acl_id = acl-0532093e6071ed905s
default_route_table_id = rtb-079a6605c7aafb9f4
default_security_group_id = sg-0f0baa65f5126090c
instance_tenancy = default
main_route_table_id = rtb-079a6605c7aafb9f4

*/





