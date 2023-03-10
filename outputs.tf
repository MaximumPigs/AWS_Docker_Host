output "public_ip" {
  value = aws_eip.public.public_ip
}

output "secret_key_id" {
  value = aws_secretsmanager_secret_version.generated_key.secret_id
}