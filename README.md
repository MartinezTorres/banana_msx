# banana_msx

Building module:

banana_msx/kernel/module$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-


Building kernel:

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig zImage modules dtbs -j 4

make modules_install INSTALL_MOD_PATH=tmp_install


sudo update-initramfs -c -v -k 5.15.93
