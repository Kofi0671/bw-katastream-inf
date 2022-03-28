provider "azurerm" {
  features {}

}

terraform {
  required_providers {
    azurerm = {
      source  = "haschicorp/azurerm"
      version = "2.78.0"

    }

  }

}

/* provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.78.0"
    }
  }
} */