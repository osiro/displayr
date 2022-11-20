variable "tags" {
  default     = {}
  description = "Default resource tags"
  type        = map(string)
}

variable "web_server_instance_type" {
  type        = string
  description = "Web Server Instance Type"
}
