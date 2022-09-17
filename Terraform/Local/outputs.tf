output "endpoint-http" {
  value = "${local.hostname}:${local.ports[0].external}"
}

output "endpoint-https" {
  value = "${local.hostname}:${local.ports[1].external}"
}