# security_group.tf

#################################################################
# Create aws_security_group
#################################################################

################################################################

resource "aws_security_group" "all-80-443-22-sg" {
  name        = "all-80-443-22-sg"
  description = "Security group for my application"
  vpc_id      = aws_vpc.staging-vpc.id


  ingress {
    description = "ingress_rule_80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ingress_rule_443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    description = "egress_rule_all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }
  tags = {
    Name = "all-80-443-22-sg"
  }

}
################################################################
//"public-allow_alb_traffic"
###############################################################


resource "aws_security_group" "public-allow_alb_traffic" {
  name        = "public-allow_alb_traffic"
  description = "Allow traffic from ALB"
  vpc_id      = aws_vpc.staging-vpc.id



  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    self        = false
    cidr_blocks = ["0.0.0.0/0"]
    #cidr_blocks = [aws_lb.TF-private-alb.dns_name]  

  }


  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    #cidr_blocks = [aws_lb.TF-private-alb.dns_name]
    self        = false
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    description = "egress_rule_all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }


  tags = {
    Name = "public-allow_alb_traffic"
  }

}
################################################################
//"private-allow_alb_traffic"
###############################################################

resource "aws_security_group" "private-allow_alb_traffic" {
  name        = "private-allow_alb_traffic"
  description = "Allow traffic from ALB"
  vpc_id      = aws_vpc.staging-vpc.id



  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    self        = false
    cidr_blocks = ["0.0.0.0/0"]

  }


  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    self        = false
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    description = "egress_rule_all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }
  tags = merge(var.project_environment_qa, { Name = "private-allow_alb_traffic"}) 

}