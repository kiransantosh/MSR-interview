terraform {
  required_version = ">= 0.11.0"

  backend "s3" {
    key     = "terraform-state"
    bucket  = "MSR"
    region  = "us-east-1"
    profile = "default"
  }
}
# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY Test instance 1
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "instance1" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-0c8c813b7cac7e094"
  key_name               = "kiransantosh"
  vpc_security_group_ids = ["sg-041d9aee7c32aecca"]
  #user_data              = "${file("${var.db_user_data}")}"

  lifecycle {
    prevent_destroy = false
  }

  root_block_device {
        volume_type = "gp2"
        volume_size = 8
        delete_on_termination = true
  }
  ebs_block_device {
        device_name  = "/dev/xvdf"
        volume_type = "io1"
        volume_size = 8
        delete_on_termination = false
        iops = 6000
  }

  tags {
    Name = "MSR-test-Instance-1"
  }

}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY Test instance 2
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "instance2" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-0c8c813b7cac7e094"
  key_name               = "kiransantosh"
  vpc_security_group_ids = ["sg-041d9aee7c32aecca"]
  #user_data              = "${file("${var.db_user_data}")}"

  lifecycle {
    prevent_destroy = false
  }

  root_block_device {
        volume_type = "gp2"
        volume_size = 8
        delete_on_termination = true
  }
  ebs_block_device {
        device_name  = "/dev/xvdf"
        volume_type = "io1"
        volume_size = 8
        delete_on_termination = false
        iops = 6000
  }

  tags {
    Name = "MSR-test-Instance-2"
  }

}
