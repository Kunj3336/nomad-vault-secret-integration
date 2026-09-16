job "auth-service" {
  datacenters = ["dc1"]
  type        = "service"

  group "web" {
    count = 1

    task "server" {
      driver = "raw_exec"

      config {
        command = "node"
        args    = ["D:/DevOps Projects/nomad vault secret integration/app.js"]
      }

      identity {
        name = "vault_default"
        aud  = ["vault.io"]
      }

      vault {
        role = "nomad-workloads"
      }

      template {
        data = <<EOH
DB_PASSWORD="{{ with secret "secret/data/ai-service/dev" }}{{ .Data.data.DB_PASSWORD }}{{ end }}"
PORT=3000
EOH
        destination = "secrets/app.env"
        env         = true
      }

      resources {
        cpu    = 200
        memory = 128
      }
    }
  }
}