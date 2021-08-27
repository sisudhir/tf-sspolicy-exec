terraform {
  required_providers {
    curl = {
      version = "0.1"
      source  = "schoewe.me/terraform/curl"
    }
  }
}

provider "curl" {
}

data "curl" "postTodos" {
  http_method = "POST"
  uri = "http://192.168.1.93:32560/_slm/policy/daily-snapshots/_execute"
}

locals {
  json_data = jsondecode(data.curl.postTodos.response)
}

# Returns all Todos
output "all_todos" {
  value = local.json_data
}

//# Returns the title of todo
output "todo_title" {
  value = local.json_data.title
}
