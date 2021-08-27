provider "restapi" {
  uri                  = "http://192.168.1.93:32560/_slm/policy"
  debug                = true
  headers              = {"Content-Type" = "application/json"}
  create_returns_object = false
  write_returns_object = false
  insecure             = true
  id_attribute         = "/"
  create_method        = "POST"
  update_method        = "POST"
  destroy_method       = "POST"
}

resource "restapi_object" "exec_policy" {
  provider = restapi.rest
  depends_on = [restapi_object.create_policy]
  object_id = "execpolicy"
  path = "/daily-snapshots/_execute"
  data = ""
}
