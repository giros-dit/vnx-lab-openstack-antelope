Recipe to create and pack the scenario from scratch (Sep-2023)
--------------------------------------------------------------
  
- Create the original rootfs:

cd filesystems
sudo ./create_rootfs_lxc_ubuntu64-22.04-ostack

- Set the scenario to use the original filesystem:

./create_rootfs_lxc_links 
cd ..

Note: this script just sets the rootfs links (rootfs_lxc_ubuntu64-openstack-*) to point to the unconfigured 
rootfs (vnx_rootfs_lxc_ubuntu64-22.04-v025-openstack)

- Start the scenario and execute all configuration steps:

sudo vnx -f openstack_lab.xml -v -t  # wait till you see the controller login
sudo vnx -f openstack_lab.xml -v -x start-all-from-scratch

- Shutdown the scenario:

vnx -f openstack_lab.xml -v --shutdown
# wait for all VMs to stop (all consoles closed)

- Consolidate the changes made to the controller in a new rootfs:

cd filesystems
sudo ./create_rootfs_lxc_ubuntu64-18.04-ostack-controller-cfgd 
cd ..
sudo vnx -f openstack_lab.xml -v -P

- Pack the scenario with:

sudo bin/pack-scenario-with-rootfs # including rootfs
sudo bin/pack-scenario             # without rootfs


Check list to see if everything is working (not finished)
---------------------------------------------------------

- Check hypervisor list:

root@controller:~# openstack hypervisor list
+----+---------------------+-----------------+-----------+-------+
| ID | Hypervisor Hostname | Hypervisor Type | Host IP   | State |
+----+---------------------+-----------------+-----------+-------+
|  1 | compute2            | QEMU            | 10.0.0.32 | up    |
|  2 | compute1            | QEMU            | 10.0.0.31 | up    |
+----+---------------------+-----------------+-----------+-------+


- Check registered services list:

root@controller:~# openstack service list
+----------------------------------+-----------+-----------+
| ID                               | Name      | Type      |
+----------------------------------+-----------+-----------+
| 08c00e6cfcf54c04bc9f2d90110c168e | nova      | compute   |
| 711c18bafb6c4aa2b6334cfc242c838c | keystone  | identity  |
| 9210277327b34c3f92e94d46aa8113dd | glance    | image     |
| e2dec0f8630d44a39557baefdec43661 | neutron   | network   |
| e2f1845ea8d64eb6933f83012c19f453 | placement | placement |
+----------------------------------+-----------+-----------+

If any of the services is duplicated there are problems. For example, if glance is duplicated, horizon won't be able to show available images.

- If you get a "no valid host found" when creating a vm, check disk space.

- Services running on each node:

  + Controller:

service nova-api status
service nova-conductor status
service nova-consoleauth status 
service nova-novncproxy status
service nova-scheduler status 
service neutron-server status
service apache2 status


