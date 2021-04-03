resource "azurerm_application_insights" "pluralsight-app-insights" {
  name                = "ht-ai-${var.azureml_random}"
  location            = var.rg_loc
  resource_group_name = var.rg
  application_type    = "web"
}

resource "azurerm_key_vault" "pluralsight-vault" {
  name                = "ht-kv-${var.azureml_random}"
  location            = var.rg_loc
  resource_group_name = var.rg
  tenant_id           = var.tenant
  sku_name            = "premium"
}
