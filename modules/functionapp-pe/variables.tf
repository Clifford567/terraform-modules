variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "target_resource_id" {
  description = "Resource ID of the PaaS resource (Function App, Logic App, OpenAI)"
  type        = string
}

variable "private_connection_name" {
  description = "Name of the private connection"
  type        = string
}

variable "subresource_names" {
  description = "List of subresource names to connect (e.g., ['sites'])"
  type        = list(string)
}


