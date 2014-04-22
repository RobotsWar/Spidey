# Firmware

[« back to the documentation](index.md)

## Putting the firmware on the robot

First, be sure you have the [correct bootloader](bootloader.md) on your board.

To put the firmware on the robot, simply cd into the `firmware/` repository and
run the installation script:

```
sudo ./install.sh
```

This should reset the board and then output some progress bar, your firmware is now
on the robot!

## The terminal

### Connecting to the on-board terminal

#### Linux

You can open a serial connection with the robot using `cu` or `screen`. You can use
for instance:

```
you@yourmachine: cu -l /dev/ttyACM0
Connected.

$  
```

Type "~." to quit cu.

#### Windows

On Windows, you can use a serial client such as PuTTy. Just choose "Serial" as connection
mode and enter "COMx", where x is the number of the device.

You can find the number of the device in the devices manager.

### Terminal commands

You can type "help" to see all the available commands. You can use for instance `dxl_scan`
to scan for servos, or `dxl_monitor` to monitor the position, temperature and voltage
of all servos.

## Building, developing & hacking the firmware

The firmware source is in the `src/` directory. To build it, you'll first have to run the
prepare script to get the RobotsWar framework:

```
./prepare.sh
```

Then, run `make`:

```
make
```

You can use `make install` to send directly the firmware on the robot:

```
make install
```

This will work exactly like the above `install.sh` script.


