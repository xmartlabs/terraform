
output "secret" {
  value = aws_iam_access_key.userak.encrypted_secret
}
output "Acceskey" {
  value = aws_iam_access_key.userak.id
}

