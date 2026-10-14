variable "rg_name" {
 type = string
}
variable "location" {
 type = string
}
variable "account_name" {
 type = string
}
variable "database_name" {
 type = string
}
variable "container_name" {
 type = string
}
variable "partition_key" {
 type = string
}
variable "consistency_level" {
 type = string
}
variable "tags" {
 type = map(string)
}