variable "ami-name-prefix"{
type = string
default = "windows-packer"
}

locals{
aws_instance = "t2.micro"
region = "central"
access_id = ""
access-key = ""
secret-key = ""
timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}


source "amazon-ebs" "windows_packer_image"{
ami_name = "${var.ami-name-prefix}-${local.timestamp}"
instance_type = local.aws_instance
region = local.region

source_ami_filter{
filters = {
name = "Windows_Server-2012-R2_RTM-English-64Bit-Base-*"
}
most_recent = true
owners = ["801119661308"]
}

communicator = "winrm"
associate_public_ip_address = "true"
winrm_insecure = true
winrm_use_ssl  = true
winrm_username = "Administrator"
tags = {
"Name" = "MyWindowImage"
"Source" = "Packer"
"User" = "Akshey"
}
}
build {

sources = ["source.amazon-ebs.windows_packer_image"]

provisioner "file"{
	source = "Samplepowershell.ps1"
	destination = "tmp/Samplepowershell.ps1"
}

provisioner "breakpoint"{
disable = false
note = "check ec2 instance"
}

provisioner "powershell"{
	script = "tmp/Samplepowershell.ps1"
}



 post-processor "manifest" {
  }
}