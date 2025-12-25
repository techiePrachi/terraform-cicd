terraform{
    backend "s3"{
        bucket= "prachi-demo123"
        key="aws-cicd/terraform.tfstate"
        region="us-east-1"
        dynamodb_table="terraform-logs"
        encrypt=true
    }
}
