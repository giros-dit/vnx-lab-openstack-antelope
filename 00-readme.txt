VNX Openstack tutorial scenario antelope_4nodes_classic_openvswitch
------------------------------------------------------------------

  This file is part of the Virtual Networks over LinuX (VNX) Project distribution. 
  (www: http://www.dit.upm.es/vnx - e-mail: vnx@dit.upm.es) 

  Author: David Fernandez (david.fernandez@upm.es)
  Departamento de Ingenieria de Sistemas Telematicos (DIT)
  Universidad Politecnica de Madrid
  SPAIN


This is an Openstack tutorial scenario designed to experiment with Openstack free and open-source 
software platform for cloud-computing. 

The scenario is made of four virtual machines: a controller node, a network node and two compute nodes, 
all based on LXC. Optionally, new compute nodes can be added by starting additional VNX scenarios. 

Openstack version used is Antelope (2023.1) over Ubuntu 22.04 LTS. The deployment scenario is the 
one that was named "Classic with Open vSwitch" and was described in previous versions of Openstack 
documentation (https://docs.openstack.org/liberty/networking-guide/scenario-classic-ovs.html). It is 
prepared to experiment either with the deployment of virtual machines using "Self Service Networks" 
provided by Openstack, or with the use of external "Provider networks". 

See additional information about this scenario in:

https://web.dit.upm.es/vnxwiki/index.php/Vnx-labo-openstack-4nodes-classic-ovs-antelope
