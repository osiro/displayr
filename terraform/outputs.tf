output "webserver_address" {
  value       = "http://${aws_instance.web_server.public_ip}"
  description = "The public IP address of the web server instance."
}
