python ./scripts/reset.py
timeout 1
dfu-util.exe -a1 -d 1eaf:0003 -D spidey.bin -R
