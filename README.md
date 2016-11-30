# ansible-role-provision-vm
Ansible role to kickstart a new KVM virtual machine. Uses either kickstart (flexible) or OpenStack images (fast!).

This role relies on ansible's inventory and host_vars to do it's job. You need to configure the following varibles to build a guest.

## Per host (add to host_vars per host):

```
hyper: hypervisor_hostname # Host where guest will be deployed.
internal_ip: 1.2.3.4       # Primary IP address of the guest
bridges:                   # One or more linux bridges on the hypevisor to connect VMs to
  - br-example
fqdn: hypervisor_hostname.fully.qualified.example
```

Optional:
```
guest_type: image          # Defaults to "kickstart"

# Bigger guests
#vcpus: 1
#ram: 1024

# Extra disks
#disks:
#  - path: "{{ libvirt_root }}/{{ fqdn }}.raw"
#    size: 40

# The default ethernet interface is eth0 but for example Ubuntu 16.04
# cloud image uses ens3
#eth_interface: ens3

#environment: default-environment

# If you want to add all your users, use an `adminusers` dictionary as required
# for ansible-role-users:
#   https://github.com/CSC-IT-Center-for-Science/ansible-role-users
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
root_password: "{{ lookup('password', 'credentials/'+ inventory_hostname  +'_rootpw length=15') }}"
```
