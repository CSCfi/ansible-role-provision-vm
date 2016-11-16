# ansible-role-provision-vm
Ansible role to kickstart a new KVM virtual machine

This role relies on ansible's inventory and host_vars to do it's job. You need to configure the follow varibles to build a guest.

Per host (add to host_vars per host):

```
hyper: hypervisor_hostname # Host where guest will be deployed.
internal_ip: 1.2.3.4       # Primary IP address of the guest
```

Globally or per group (add to group_vars):

```
install_url: "http://www.nic.funet.fi/pub/Linux/INSTALL/Centos/7/os/x86_64/"
root_password: "{{ lookup('password', 'credentials/'+ inventory_hostname  +'_rootpw length=15') }}"
```
