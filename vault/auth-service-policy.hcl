# Allow reading the specific secret for the auth-service dev environment
path "secret/data/ai-service/dev" {
  capabilities = ["read"]
}

# Allow reading metadata
path "secret/metadata/ai-service/dev" {
  capabilities = ["read"]
}