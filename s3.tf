#creating a S3 bucket
resource "aws_s3_bucket" "static_s3_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    environment = var.environment
  }
}

#public access block
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.static_s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "static_s3_bucket_website" {
  bucket = aws_s3_bucket.static_s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}


resource "aws_s3_bucket_policy" "allow_access" {
  bucket = aws_s3_bucket.static_s3_bucket.id

  policy = jsonencode({
    "Version":"2012-10-17",
    "Statement":[
      {
        "Sid":"PublicRead",
        "Effect":"Allow",
        "Principal": "*",
        "Action":["s3:GetObject"],
        "Resource":["arn:aws:s3:::tallshawnnetwork.com/*"]
      }
    ]
  }
  )
}
   
  