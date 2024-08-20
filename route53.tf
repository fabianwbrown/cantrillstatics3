#creating a hosted zone
resource "aws_route53_zone" "r53zone" {
  name = var.my_domain
}

resource "aws_route53_record" "route53record" {
  zone_id = aws_route53_zone.r53zone.zone_id
  name    = var.record_name
  type    = "A"

  alias {
    name = aws_s3_bucket.static_s3_bucket.id
    zone_id = aws_s3_bucket.static_s3_bucket.id
    evaluate_target_health = true
    
  }
}