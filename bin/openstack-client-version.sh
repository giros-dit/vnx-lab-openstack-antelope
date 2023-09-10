#!/bin/bash

echo "-- linux packages:"
dpkg -l | grep openstack
echo""
echo "-- python packages:"
pip3 list | grep openstack
