resource "aws_s3_bucket" "pr-web-bucket" {
  bucket = "pr-web-bucket-20221222"
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
              "arn:aws:s3:::pr-web-bucket-20221222/*"
          ]
      }
  ]
}  
EOF
website {
    index_document = "index.html"
    error_document = "error.html"
  }
}