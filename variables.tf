# provider information

variable "key_pair" {
  type = string
}

# network information

variable "my_ip" {
  type = string
}

# routes

variable "routes" {
  type = list(object({
    name    = string
    type    = string
    records = list(string)
  }))
}