terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {
    organization = "hungpt169"

    workspaces {
      name = "Hands-On_with_Terraform_on_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-f76d7b82-hands-on-with-terraform-on-azure"
  location = "southcentralus"
}

module "securestorage" {
  source               = "app.terraform.io/hungpt169/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "tfhungpt169"
}