variable "prod_name" {
  description = "prod-devopskb"
  type        = string
  default     = "prod-devopskb"
}

variable "users" {
  type        = list
  default     = ["devops"]
}

variable "public_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDhpPqve1rOfIC3+SVwiyrYNb4ZaXmRPi89qreGp/+qN/P0Z1uIjRcrhjO9crEYPY0hWsU0/bzj3IkyNLMSemsQ8JMWo8u4yJvwK73tcRV4jVhd+glilBTZCNEDKRTM/gQFVbak8VzoCGSEca89Fg+X0r89NSnPaCVwjYmCohg1IpHv6aVkvAyY1K1k78UEXRE3z6Zzb6zd6N2SxKVw4K/iwGNJPaRYlycoBB8wo4YsawG7jqqcr8bMDa4jmH+GWgltB0V6ruK27GlO/CcsAhuonlAoiW/SXoxp9NY+v0p/VH1pqbH3HhbBkP7LANrH0QrKLScDxtpMaDFsaFn98cl1OggE38/7l9kS4A0fPDPDqiXEWBocBsFGaMa46ndXnSNxkPdniOGncIhhtNmQGnnQG4D1YRx1Zl+3wDYgpYpL/VUmhwDp3WJXgYLRYYfh8bcBjOpQNR99EZDEA1OZ2Rv/4qRCoEOLEDAi/oLolhlkZRUB0qOtrlRn+G/Ibt+rJv0= devops"
}
