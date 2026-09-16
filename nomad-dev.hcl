client {
  enabled = true
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

vault {
  enabled = true
  address = "http://127.0.0.1:8200"
}