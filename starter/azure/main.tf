data "azurerm_resource_group" "udacity" {
  name     = "Regroup_7j8XTKrP"
}

resource "azurerm_container_group" "udacity" {
  name                = "udacity-continst"
  location            = data.azurerm_resource_group.udacity.location
  resource_group_name = data.azurerm_resource_group.udacity.name
  ip_address_type     = "Public"
  dns_name_label      = "mnogs-multicloud-2026"
  os_type             = "Linux"

  image_registry_credential {
    server   = "mnogsacr16229.azurecr.io"
    username = "mnogsacr16229"
    password = "5KjJdVztDKB3BOfNvh6yelQ859RJTFls7HS1X72mYqfAz3va6pwOJQQJ99CEAC4f1cMEqg7NAAACAZCRYFwj"
  }

  container {
    name   = "azure-container-app"
    image  = "mnogsacr16229.azurecr.io/azure_app:1.0"
    cpu    = "0.5"
    memory = "1.5"
    environment_variables = {
      "AWS_S3_BUCKET"        = "udacity-mnogs-aws-s3-v2026"
      "AWS_DYNAMO_INSTANCE"  = "udacity-mnogs-aws-dynamodb"
    }
    ports {
      port     = 3000
      protocol = "TCP"
    }
  }

  tags = {
    environment = "udacity"
  }
}

####### Your Additions Will Start Here ######
resource "azurerm_mssql_server" "udacity" {
  name                         = "udacity-mnogs-azure-sql"
  resource_group_name          = data.azurerm_resource_group.udacity.name
  location                     = data.azurerm_resource_group.udacity.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password1234!"
}

resource "azurerm_mssql_database" "udacity" {
  name           = "udacity-mnogs-sql-db"
  server_id      = azurerm_mssql_server.udacity.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "BasePrice"
  max_size_gb    = 2
  sku_name       = "S0"
}
