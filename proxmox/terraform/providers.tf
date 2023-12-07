terraform {
    required_providers {
        proxmox = {
        source = "telmate/proxmox"
        version = ">= 2.9.14"
        }
    }
    
}

provider "proxmox" {
  pm_api_url = "https://192.168.122.216:8006/api2/json"
}