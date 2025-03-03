# certificate_config.tf

# Request and validate an SSL certificate from AWS Certificate Manager (ACM)
resource "aws_acm_certificate" "ideawaves-ca" {
  domain_name       = "ideawaves.ca"
  validation_method = "DNS"
  tags = merge(var.project_environment_qa, { Name = "ideawaves.ca SSL certificate" })
}

# Associate the SSL certificate with the ALB listener
resource "aws_lb_listener_certificate" "ideawaves-ca" {
  listener_arn    = aws_lb_listener.public_alb_listener.arn
  certificate_arn = aws_acm_certificate.ideawaves-ca.arn
  
}
