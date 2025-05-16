resource "azurerm_resource_group_template_deployment" "logic_app_deploy" {
  name                = "logic-app-deploy"
  resource_group_name = azurerm_resource_group.main.name
  deployment_mode     = "Incremental"

  template_content     = file("${path.module}/log-alert-logicapp.json")
  parameters_content   = "{}"
}