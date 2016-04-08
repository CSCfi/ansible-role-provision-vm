#!/bin/bash

if [ ! -f /etc/libvirt/qemu/{{ inventory_hostname }}.xml ]; then

virt-install \
  --name={{ inventory_hostname }} \
  --os-variant=rhel6 \
{% if virt_install_cpu_model %}
  --cpu={{ virt_install_cpu_model }} \
{% else %}
  --cpu=host \
{% endif %}
  --vcpus={{ vcpus }} \
  --ram={{ ram }} \
{% for disk in disks %}
  --disk path={{ disk.path }},cache=writethrough,device=disk,bus=virtio,size={{ disk.size }},format=raw \
{% endfor %}
{% for bridge in bridges %}
  --network bridge={{ bridge }},model=virtio \
{% endfor %}
  --connect=qemu:///system \
  --location={{ install_url }} \
  --graphics=vnc,keymap="fi" \
  --noautoconsole \
  --autostart \
  --wait=20 \
  --initrd-inject={{ kickstart_tempdir }}/{{ inventory_hostname }}.ks \
  --extra-args="ks=file:/{{ inventory_hostname }}.ks nomodeset console=ttyS0"
fi
