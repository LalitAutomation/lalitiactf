provider "aws"{
    region="us-east-1"

}

resource "aws_s3_bucket" "bucket"{
    bucket="lalitoctbucket"
    acl="private"
    versioning{
        enabled=true
    }
}

output "BUCKET_DOMAIN_NAME"{
    value=aws_s3_bucket.bucket.bucket_domain_name
}

output "BUCKET_REGION"{
    value=aws_s3_bucket.bucket.region
}

output "BUCKET_ARN"{
    value=aws_s3_bucket.bucket.arn
}



/* Outputs

Outputs:

BUCKET_ARN = arn:aws:s3:::lalitoctbucket
BUCKET_DOMAIN_NAME = lalitoctbucket.s3.amazonaws.com
BUCKET_REGION = us-east-1

*/

