variable "environment" {
  description = "Deployment environment (stage or prod)"
  type        = string

}

variable "s3_bucket_name" {
    description = "s3 bucket"
    default =  "tallshawnnetwork.com"
    type = string

}

variable "my_domain" {
    description = "my domain"
    default = "tallshawnnetwork.com"
    type = string
}

variable "record_name" {
    description = "sub domina record name"
    default = "www.com"
    type = string
}