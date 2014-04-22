#!/bin/sh

DFU="dfu-util"
BOARD_USB_VENDOR_ID="1eaf"
BOARD_USB_PRODUCT_ID="0003"

./scripts/reset.py &&
sleep 1 &&
$DFU -a1 -d $BOARD_USB_VENDOR_ID:$BOARD_USB_PRODUCT_ID -D spidey.bin -R
