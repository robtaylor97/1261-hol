terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }

  cloud {
    organization = "Rob-Taylor"

    workspaces {
      name = "1261-hol"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-913b8925-hands-on-with-terraform-on-azure"
  location = "Central US"
}

module "rt1261" {
  source               = "app.terraform.io/Rob-Taylor/rt1261/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "rt1261holtfsa"
}