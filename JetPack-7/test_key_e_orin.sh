#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

function activate_intel_bt_driver {
	sudo rmmod rtk_btusb
	sudo modprobe --ignore-install btusb
}

function reactivate_realtek_bt_driver {
	sudo rmmod btusb
	sudo modprobe rtk_btusb
}

activate_intel_bt_driver

trap interrupt_func INT
interrupt_func() {
	reactivate_realtek_bt_driver
}

watch -n 0.1 lsusb

