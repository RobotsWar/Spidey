# Flash the bootloader on the OpenCM++

[« back to the documentation](index.md)

The OpenCM++ comes with the ROBOTIS official bootloader. It is not handy to use,
because there is no tool external to its IDE to flash the board.

This is why we are using the maple bootloader, you can find the variant for the OpenCM
in this repository, under `bootloader/` directory. The sources of the bootloader are
also available [here](https://github.com/Gregwar/maple-bootloader-robotis).

To flash the bootloader, you'll have to wire a FTDI (serial adapter) to the Serial1 port
of your board. This is the most annoying part of this, but it's not that hard. You can use
an Arduino board, a FTDI breakout or anything that can be used as a serial device.

Now, boot the board holding the BOOT0 pin at 3.3V (this can be done by wiring a little cable),
now release BOOT0.

You can then run the following command:

```
python stm32loader.py -p /dev/ttyUSB -evw bootloader.bin
```

Your board is now on the Maple bootloader!
