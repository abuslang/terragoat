resource azurerm_app_service_plan "example" {
  name                = "terragoat-app-service-plan-${var.environment}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Dynamic"
    size = "S1"
  }
  tags = {
    git_commit           = "5c6b5d60a8aa63a5d37e60f15185d13a967f0542"
    git_file             = "terraform/azure/app_service.tf"
    git_last_modified_at = "2021-05-02 10:06:10"
    git_last_modified_by = "nimrodkor@users.noreply.github.com"
    git_modifiers        = "nimrodkor"
    git_org              = "abuslang"
    git_repo             = "terragoat"
    yor_trace            = "6611bf45-fd5b-467e-b119-d533cd7539b8"
    yor_name             = "example"
  }
}

resource azurerm_app_service "app-service1" {
  app_service_plan_id = azurerm_app_service_plan.example.id
  location            = var.location
  name                = "terragoat-app-service-${var.environment}${random_integer.rnd_int.result}"
  resource_group_name = azurerm_resource_group.example.name
  https_only          = true
  site_config {
    dotnet_framework_version = "v6.0"
    ftps_state = "Disabled"
    min_tls_version = "1.2"
  }
  tags = {
    git_commit           = "5c6b5d60a8aa63a5d37e60f15185d13a967f0542"
    git_file             = "terraform/azure/app_service.tf"
    git_last_modified_at = "2021-05-02 10:06:10"
    git_last_modified_by = "nimrodkor@users.noreply.github.com"
    git_modifiers        = "Adin.Ermie/nimrodkor"
    git_org              = "abuslang"
    git_repo             = "terragoat"
    yor_trace            = "13be096d-c599-46e5-bf54-51c6e9732858"
    yor_name             = "app-service1"
  }
  storage_account {
    type = "AzureFiles"
  }
  identity = true
  logs {
    detailed_error_messages_enabled = true
    failed_request_tracing_enabled = true
  }
  client_cert_enabled = true
  auth_settings {
    enabled = true
  }
}

resource azurerm_app_service "app-service2" {
  app_service_plan_id = azurerm_app_service_plan.example.id
  location            = var.location
  name                = "terragoat-app-service-${var.environment}${random_integer.rnd_int.result}"
  resource_group_name = azurerm_resource_group.example.name
  https_only          = true

  auth_settings {
    enabled = true
  }
  tags = {
    git_commit           = "5c6b5d60a8aa63a5d37e60f15185d13a967f0542"
    git_file             = "terraform/azure/app_service.tf"
    git_last_modified_at = "2021-05-02 10:06:10"
    git_last_modified_by = "nimrodkor@users.noreply.github.com"
    git_modifiers        = "Adin.Ermie/nimrodkor"
    git_org              = "bridgecrewio"
    git_repo             = "terragoat"
    yor_trace            = "ec8295ab-af68-4cff-b0f1-b0cf5eaf1b75"
    yor_name             = "app-service2"
  }
  storage_account {
    type = "AzureFiles"
  }
  identity = true
  site_config {
    dotnet_framework_version = "v6.0"
    ftps_state = "Disabled"
  }
  logs {
    detailed_error_messages_enabled = true
    failed_request_tracing_enabled = true
  }
  client_cert_enabled = true
}

