#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

HALF_FULL=`gpiofind "PX.07"`
HALF_FULL_VAL=0
RS422_232=`gpiofind "PZ.02"`
RS422_232_VAL=1
TX_ENABLE=`gpiofind "PY.04"`
TX_ENABLE_VAL=1
RX_DISABLE=`gpiofind "PX.06"`
RX_DISABLE_VAL=0

gpioset --mode=signal $HALF_FULL=$HALF_FULL_VAL &
PID_HALF_FULL=$!
gpioset --mode=signal $RS422_232=$RS422_232_VAL &
PID_RS422_232=$!
gpioset --mode=signal $TX_ENABLE=$TX_ENABLE_VAL &
PID_TX_ENABLE=$!
gpioset --mode=signal $RX_DISABLE=$RX_DISABLE_VAL &
PID_RX_DISABLE=$!

sudo gtkterm -p /dev/ttyTHS2 -s 115200

kill $PID_HALF_FULL
kill $PID_RS422_232
kill $PID_TX_ENABLE
kill $PID_RX_DISABLE

