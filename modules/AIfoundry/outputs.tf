output "id" {
  value = azapi_resource.openai_account.id
}

output "endpoint" {
  value = try(
    azapi_resource.openai_account.output.properties.endpoint,
    ""
  )
}

