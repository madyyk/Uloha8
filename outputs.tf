output "alb_dns_name" {
  description = "DNS názov Load Balanceru"
  value       = aws_lb.app.dns_name
}

output "url" {
  description = "HTTP URL"
  value       = "http://${aws_lb.app.dns_name}"
}
