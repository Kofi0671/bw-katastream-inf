module {
  source  = "bw-katastream/storage-account/azurerm"
  version = "2.0.0"
}

inputs {
  name                = "dev-nonprod"
  resource_group_name = "dev-nonprod-rg"
  location            = "westeus"

  containers = [
    {
      name        = "container"
      access_type = "public"
    },
  ]
}