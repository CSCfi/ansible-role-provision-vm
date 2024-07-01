[![Build Status](https://travis-ci.org/CSCfi/ansible-role-provision-vm.svg?branch=master)](https://travis-ci.org/CSCfi/ansible-role-provision-vm)

# ansible-role-provision-vm
Ansible role to kickstart a new KVM virtual machine. Uses either kickstart (flexible) or OpenStack images (fast!).

This role relies on ansible's inventory and host_vars to do it's job. You need to configure the following varibles to build a guest.

## Per host (add to host_vars per host):

```
hyper: hypervisor_hostname # Host where guest will be deployed.
internal_ip: 1.2.3.4       # Primary IP address of the guest
bridges:                   # One or more linux bridges on the hypevisor to connect VMs to
  - br-example
```

Optional:
```
guest_type: image          # Defaults to "kickstart"

# Bigger guests
#vcpus: 1
#ram: 1024

# Numa tuning and ship console via syslog with virt-install:
#provision_virt_install_extra_settings:
# - "--numatune 1"
# - "--serial udp,host=10.0.0.1:514"

# Extra disks
#disks:
#  - path: "{{ libvirt_root }}/{{ inventory_hostname }}.raw"
#    size: 40

# Networking setup
# cloud_init_networks:
#  - interface: eth0
#    address: "{{ internal_ip }}"
#    netmask: 255.255.255.0
#  - interface: eth1
#    address: "{{ public_ip }}"
#    netmask: 255.255.255.0
#    gateway: 1.2.3.4
#    nameservers: [ 8.8.8.8 ]
 
# Regex PCI passthrough
# vm_passthrough_lookup_regex: '.*Mellanox.*'
# In this example all devices that match the '.Mellanox.' regex will be passed through to the virtual machine.

#Specific device PCI passthrough
# vm_pci_passthrough_devices:
#            - pci_0000_3b_00_3
#            - pci_0000_3b_00_4
#   In this example the specific devices pci_0000_3b_00_3 will be passed through to the virtual machine.

# kickstart_selinux is an optional parameter that regulates kickstart instructions related with selinux
# by default, kickstart_selinux is not defined and no selinux instructions will be added to the kickstart file, resulting in selinux being set to "enforcing" in the kickstarted operating system
# kickstart_selinux can also be explicitly set to "enforcing", producing the same effect as above
# kickstart_selinux can be set to "permissive" or "disabled", resulting in selinux being set respectively to "permissive" or "disabled" in the kickstarted operating system

#environment: default-environment

# If you want to add all your users, use an `adminusers` dictionary as required
# for ansible-role-users:
#   https://github.com/CSCfi/ansible-role-users
#
# You can also add a custom user to your guests for bootstrapping
#bootstrap_user: bootstrap
#bootstrap_ssh_key: ""
```

## Globally or per group (add to group_vars):

```
default_gateway: 1.2.3.4
```

Optional (and only for Kickstart):
```
install_url: "http://www.nic.funet.fi/pub/Linux/INSTALL/Centos/7/os/x86_64/"
root_password: "{{ lookup('password', 'credentials/'+ inventory_hostname  +'_rootpw length=15 chars=ascii_letters,digits,.,_,,') }}"
```
