provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "log" {
  name     = "log-automation-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "log_vnet" {
  name                = "log-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.log.location
  resource_group_name = azurerm_resource_group.log.name
}

resource "azurerm_subnet" "log_subnet" {
  name                 = "log-subnet"
  resource_group_name  = azurerm_resource_group.log.name
  virtual_network_name = azurerm_virtual_network.log_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "log_nsg" {
  name                = "log-nsg"
  location            = azurerm_resource_group.log.location
  resource_group_name = azurerm_resource_group.log.name
}

resource "azurerm_public_ip" "log_pip" {
  name                = "log-public-ip"
  location            = azurerm_resource_group.log.location
  resource_group_name = azurerm_resource_group.log.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_log_analytics_workspace" "log_ws" {
  name                = "loganalytics-ws"
  location            = azurerm_resource_group.log.location
  resource_group_name = azurerm_resource_group.log.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_data_collection_endpoint" "log_dce" {
  name                = "log-dce"
  location            = azurerm_resource_group.log.location
  resource_group_name = azurerm_resource_group.log.name
}

resource "azurerm_monitor_data_collection_rule" "log_dcr" {
  name                          = "log-dcr"
  location                      = azurerm_resource_group.log.location
  resource_group_name           = azurerm_resource_group.log.name
  data_collection_endpoint_id   = azurerm_monitor_data_collection_endpoint.log_dce.id

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.log_ws.id
      name                  = "loganalyticsdest"
    }
  }

  data_flows {
    streams      = ["Microsoft-Syslog"]
    destinations = ["loganalyticsdest"]
  }

  data_sources {
    syslog {
      facility_names = ["authpriv"]
      log_levels     = ["Error"]
      name           = "syslog-source"
    }
  }
}