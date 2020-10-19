provider "aws"{
    region="us-east-1"
}


resource "aws_iam_user" "user1"{

    name="user1terraform"
    
}

resource "aws_iam_user" "user2"{

    name="user2terraform"
    
}

resource "aws_iam_user" "user3"{
    name="lalituser3tf"
}


resource "aws_iam_group" "lalitgroup"{
    name="lalitgroup"
}

//this module will add users and group through these membership resource

resource "aws_iam_group_membership" "membership"{
    name="group_membership"

    users=[aws_iam_user.user1.name,aws_iam_user.user2.name]
    group=aws_iam_group.lalitgroup.name
}

resource "aws_iam_policy" "firstpolicy"{
    name="firstpolicy"
    policy=<<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:DeleteTags",
                "ec2:CreateTags"
            ],
            "Resource": "*"
        }
    ]
}
EOF

}


resource "aws_iam_policy_attachment" "policy_attach"{
    name="policy_attachment"
    users=[aws_iam_user.user1.name,aws_iam_user.user2.name,aws_iam_user.user3.name]
    groups=[aws_iam_group.lalitgroup.name]
    policy_arn=aws_iam_policy.firstpolicy.arn
}

//outputs variable we can define if we want output

output "unique_ID"{
    value=aws_iam_user.user1.unique_id
}

//This will show you the policy document in JSON format
output "policy_document"{
    value=aws_iam_policy.firstpolicy.policy
}