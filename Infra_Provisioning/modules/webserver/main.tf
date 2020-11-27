terraform {
    required_version = ">= 0.12"
}

resource "aws_instance" "webserver" {
    ami             = var.ami
    instance_type   = var.instance_type

    tags = {
        env = var.env_name
    }
}
