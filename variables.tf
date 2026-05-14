variable "rg" {
  default = {
    name = "peering-rg"
    location = "Central India"
  }
}

variable "public_vnet" {
  default = {
    name = "Public-Vnet"
    address_space = ["10.0.0.0/16"]
  }
}

variable "private_vnet" {
  default = {
    name = "Private-Vnet"
    address_space = ["10.1.0.0/16"]
    location = "West US 2"
  }
}

variable "public_subnet" {
  default = {
    name = "Public-Subnet"
    address_prefixes = ["10.0.1.0/24"]
  }
}

variable "private_subnet" {
  default = {
    name = "Private-Subnet"
    address_prefixes = ["10.1.1.0/24"]
  }
}

variable "public_ip" {
  default = {
    name = "Public-IP"
    allocation_method = "Static"
    sku = "Standard"
  }
}

variable "nat_public_ip" {
  default = {
    name = "NAT-Public-IP"
    allocation_method = "Static"
    sku = "Standard"
  }
}

variable "nat_gateway" {
  default = {
    name = "NAT-Gateway"
    sku_name = "Standard"
  }
}

variable "public_nic" {
  default = {
    name = "Public-NIC"
    ip_configuration = {
        name = "Public-IP-1"
        private_ip_address_allocation = "Dynamic"
    }
  }
}

variable "private_nic" {
  default = {
    name = "Private-NIC"
    ip_configuration = {
        name = "Private-IP-1"
        private_ip_address_allocation = "Dynamic"
    }
  }
}

variable "public_vm" {
  default = {
    name = "Public-VM"
    size = "Standard_D2s_v5"
    admin_username = "surya"
    admin_password = "Password@12345"
    disable_password_authentication = false
    os_disk = {
        caching = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }
    source_image_reference = {
        publisher = "Canonical"
        offer = "ubuntu-24_04-lts"
        sku = "server"
        version = "latest"
    }
  }
}

variable "private_vm" {
  default = {
    name = "Private-VM"
    size = "Standard_D2als_v7"
    admin_username = "surya"
    admin_password = "Password@12345"
    disable_password_authentication = false
    os_disk = {
        caching = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }
    source_image_reference = {
        publisher = "Canonical"
        offer = "ubuntu-24_04-lts"
        sku = "server"
        version = "latest"
    }
  }
}

variable "public_nsg" {
  default = {
    name = "Public-NSG"
    security_rule = {
        name = "SSH"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "22"
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }
    security_rule_1 = {
        name = "nginx"
        priority = 110
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "80"
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }
  }
}

variable "vnet_peering" {
  default = {
    peer1 = "peer1-2"    
    peer2 = "peer2-1"    
  }
}
