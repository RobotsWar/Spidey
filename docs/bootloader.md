# Flash the bootloader on the OpenCM++

[« back to the documentation](index.md)

The OpenCM++ comes with the ROBOTIS official bootloader. It is not handy to use,
because there is no tool external to its IDE to flash the board. Moreover, it is not open
source and it appeared to be unstable while flashing large programs.

This is why we are using the maple bootloader, which is compatible with the `dfu-util` tool.

To put this bootloader on the board, you'll need to run a special sketch that you can find in
the `bootloader/` directory of this repository. 

**WARNING: When you'll run this sketch, the default bootloader will be erased and replaced with the maple
one. This will make OpenCM IDE unusable.**.

Wait until your board led pin blinks, and the new bootloader should be loaded.

## See also

[Fork of the maple bootloader for robotis boards](https://github.com/Gregwar/maple-bootloader-robotis).

