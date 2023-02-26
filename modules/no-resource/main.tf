terraform {
	required_version = ">=1.0.0"

}


variable "name" {
  type = string
}

resource "local_file" "foo" {
  content  = "${var.name}"
  filename = "${path.module}/${var.name}"
}

resource "null_resource" "noop" {
  triggers = {
    noop_id = var.name
  }
}
