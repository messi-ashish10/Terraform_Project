resource "null_resource" "display_hostnames" {
  for_each = var.vm_names

  depends_on = [
    azurerm_linux_virtual_machine.vmlinux,      
    azurerm_public_ip.vmlinux_pip,              
    azurerm_network_interface.vmlinux_nic  
  ]

  #provisioner "remote-exec" {
   # inline = [
    #  "echo Hostname: $(hostname)"
    #]
  #}

  connection {
    type        = "ssh"
   # host        = azurerm_public_ip.vmlinux_pip[each.key].ip_address
    host        = azurerm_public_ip.vmlinux_pip[each.key].fqdn
    user        = var.admin_username
    private_key = var.ssh_private_key
  }
  provisioner "remote-exec" {
    inline = [
      "echo Hostname: $(hostname)"
    ]
  }
}
