#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sudo echo 469 > /sys/class/gpio/export
sudo echo 480 > /sys/class/gpio/export
sudo echo 474 > /sys/class/gpio/export
sudo echo 468 > /sys/class/gpio/export

sudo echo low > /sys/class/gpio/PX.07/direction
sudo echo low > /sys/class/gpio/PZ.02/direction
sudo echo high > /sys/class/gpio/PY.04/direction
sudo echo low > /sys/class/gpio/PX.06/direction

sudo gtkterm -p /dev/ttyTHS1 -s 115200

sudo echo 469 > /sys/class/gpio/unexport
sudo echo 480 > /sys/class/gpio/unexport
sudo echo 474 > /sys/class/gpio/unexport
sudo echo 468 > /sys/class/gpio/unexport

