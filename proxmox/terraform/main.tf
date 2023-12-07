resource "proxmox_vm_qemu" "test-server" {
    count = 2
    name = "test-server-${count.index + 1}"
    target_node = "proxmox"
    clone = "ubuntu-cloudinit"

    # VM settings
    agent = 1
    os_type = "cloud-init"
    cores = 1
    sockets = 1
    cpu = "host"
    memory = 512
    scsihw = "virtio-scsi-pci"
    bootdisk = "virtio0"
    
    disk {
        slot = 0
        size = "8G"
        type = "scsi"
        storage = "local-lvm"
        iothread = 1
    }
    network {
        model = "virtio"
        bridge = "vmbr0"
    }
    ipconfig0 = "ip=10.98.1.9${count.index + 1}/24,gw=10.98.1.1"
    sshkeys = var.ssh_key
}