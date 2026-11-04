rg_names = {
  
  rg1 = {
    name     = "rg-lms-preprod"
    location = "South Africa North"
  }
}
vnet_name = {
  vnet1 = {
    name                = "vnet-lms-preprod"
    location            = "South Africa North"
    resource_group_name = "rg-lms-preprod"
    address_space       = ["10.0.0.0/16"]

  }
}
subnet_name = {
  subnet1 = {
    name                 = "preprod-frontend-subnet"
    virtual_network_name = "vnet-lms-preprod"
    resource_group_name  = "rg-lms-preprod"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "preprod-backend-subnet"
    virtual_network_name = "vnet-lms-preprod"
    resource_group_name  = "rg-lms-preprod"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "preprod-database-subnet"
    virtual_network_name = "vnet-lms-preprod"
    resource_group_name  = "rg-lms-preprod"
    address_prefixes     = ["10.0.3.0/24"]
  }
   subnet4 = {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "vnet-lms-preprod"
    resource_group_name  = "rg-lms-preprod"
    address_prefixes     = ["10.0.4.0/24"]
}
}

public_ip = {
  pip1 = {
    name                = "preprod-frontend_pip"
    location            = "South Africa North"
    resource_group_name = "rg-lms-preprod"
    allocation_method   = "Static"
    sku                 = "Standard"

  }
  pip2 = {
    name                = "preprod-backend_pip"
    location            = "South Africa North"
    resource_group_name = "rg-lms-preprod"
    allocation_method   = "Static"
    sku                 = "Standard"

  }
  pip3 = {
    name                = "preprod-database_pip"
    location            = "South Africa North"
    resource_group_name = "rg-lms-preprod"
    allocation_method   = "Static"
    sku                 = "Standard"

  }
}



nsg_name = {
  nsg1 = {
    name                = "preprod-frontend_nsg"
    location            = "South Africa North"
    resource_group_name = "rg-lms-preprod"

    security_rules = [
      {
        name      = "Allow-SSH"
        priority  = 100
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },

      {
        name      = "Allow-HTTP"
        priority  = 110
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },

      {
        name      = "Allow-HTTPS"
        priority  = 120
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }



  nsg2 = {
    name                = "preprod-backend_nsg"
    location            = "South Africa North"
    resource_group_name = "rg-lms-preprod"

    security_rules = [
      {
        name      = "Allow-SSH"
        priority  = 100
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },

      {
        name      = "Allow-HTTP"
        priority  = 110
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },

      {
        name      = "Allow-HTTPS"
        priority  = 120
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
  nsg3 = {
    name                = "preprod-database_nsg"
    location            = "South Africa North"
    resource_group_name = "rg-lms-preprod"

    security_rules = [
      {
        name      = "Allow-SSH"
        priority  = 100
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },

      {
        name      = "Allow-HTTP"
        priority  = 110
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },

      {
        name      = "Allow-HTTPS"
        priority  = 120
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}


vms = {
  vm1 = {
    vm_name              = "vm-lms-preprod-frontend-vm"
    resource_group_name  = "rg-lms-preprod"
    location             = "South Africa North"
    vm_size              = "Standard_DS1_v2"
    admin_password       = "Kuldeep@12345"
    admin_username       = "Kuldeep@admin"
    subnet_name          = "preprod-frontend_subnet"
    virtual_network_name = "vnet-lms-preprod"
    nic_name             = "frontend_nic"
    public_ip_name       = "preprod-frontend_pip"
    nsg_name             = "preprod-frontend_nsg"

  }
  vm2 = {
    vm_name              = "vm-lms-preprod-backend-vm"
    resource_group_name  = "rg-lms-preprod"
    location             = "South Africa North"
    vm_size              = "Standard_DS1_v2"
    admin_password       = "Kuldeep@12345"
    admin_username       = "Kuldeep@admin"
    subnet_name          = "preprod-backend_subnet"
    virtual_network_name = "vnet-lms-preprod"
    nic_name             = "backend_nic"
    public_ip_name       = "preprod-backend_pip"
    nsg_name             = "preprod-backend_nsg"

  }
  vm3 = {
    vm_name              = "vm-lms-preprod-database-vm"
    resource_group_name  = "rg-lms-preprod"
    location             = "South Africa North"
    vm_size              = "Standard_DS1_v2"
    admin_password       = "Kuldeep@12345"
    admin_username       = "Kuldeep@admin"
    subnet_name          = "preprod-database_subnet"
    virtual_network_name = "vnet-lms-preprod"
    nic_name             = "database_nic"
    public_ip_name       = "preprod-database_pip"
    nsg_name             = "preprod-database_nsg"

  }
}
bastions = {
  bastion1 = {
    name                = "bastion1"
    location            = "South Africa North"
    rg_name             = "rg-lms-preprod"
    subnet_name         = "AzureBastionSubnet"
    vnet_name           = "vnet-lms-preprod"
    public_ip_name      = "bastion_pip"
  }
}

