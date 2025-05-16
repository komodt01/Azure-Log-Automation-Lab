# Teardown Instructions

Follow this order to safely destroy resources without dependency issues:

```bash
terraform destroy -target=azurerm_linux_virtual_machine.log_vm
terraform destroy -target=azurerm_network_interface.log_nic
terraform destroy -target=azurerm_public_ip.log_pip
terraform destroy -target=azurerm_subnet_network_security_group_association.subnet_nsg_assoc
terraform destroy -target=azurerm_network_security_group.log_nsg
terraform destroy -target=azurerm_subnet.log_subnet
terraform destroy -target=azurerm_virtual_network.log_vnet
terraform destroy -target=azurerm_log_analytics_workspace.log_ws
terraform destroy -target=azurerm_resource_group.log
```

Or use:

```bash
terraform destroy
```

If all import conflicts were resolved.
