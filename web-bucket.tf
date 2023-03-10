resource "aws_s3_bucket" "pr-web-bucket" {
  bucket = "terraform-cloud-bucket-cloudmagic"
  acl    = "public-read"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
              "s3:GetObject"
          ],
          "Resource": [
              "arn:aws:s3:::terraform-cloud-bucket-cloudmagic/*"
          ]
      }
  ]
}  
EOF
website {
    index_document = "index.html"
    error_document = "error.html"
  }

tags = {
  "env" = "Prod"
  "ManagedByTerraform" = "true"
  "Company" = "CloudMagic"
}

}
