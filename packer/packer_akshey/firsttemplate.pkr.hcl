source "null" "powershelltemplate" {
  communicator = "none"
}

build {
  sources = ["source.null.powershelltemplate"]
  provisioner "file" {
    source      = "C:/Users/j245/Documents/Eclipse_Workspace/Packer/Practice/Samplepowershell.ps1"
    destination = "C:/Users/j245/Documents/Eclipse_Workspace/Packer/NewLocation"
  }

  provisioner "powershell" {
    script = "./Samplepowershell.ps1"
  }
}