output "websiteendpoint" {
  value       = aws_s3_bucket.static_s3_bucket.website_endpoint
  description = "website url"

}


# output "websiteendpoint" {
#   value = "aws_s3_bucket_website_configuration"
# }