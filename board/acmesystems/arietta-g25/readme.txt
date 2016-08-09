Acme Systems Arietta G25

Intro
=====

Buildroot configuration for Arietta G25.
This default configuration, based on AT91bootstrap v3.8.5 and 
Linux Kernel image v4.4.16, allow you to build a minimal root filesystem
which includes the support for the serial console.
The default configuration for Arietta G25 includes the getty program that
enables you to log in through the serial console ttyS0.
After the boot, to log in at the getty prompt use the following credentials:
Username: root
Password: acmesystems

You can find additional informations, tutorials and a very comprehensive
documentation on http://www.acmesystems.it/arietta.

Build instructions
==================

To build an image for the Arietta G25 choose the configuration
corresponding to the Arietta variant.

For 128MB RAM variant type:

$ make acmesystems_arietta_g25_128mb_defconfig

else for 256MB RAM variant type:

$ make acmesystems_arietta_g25_256mb_defconfig

To customize the configuration choosed type:

$ make menuconfig

When you are ready to start building Buildroot type:

$ make

How to write the microSD card
=============================

Once the build process is finished you will have an image called "sdcard.img"
in the output/images/ directory.

Write the bootable SD card image "sdcard.img" onto an SD card with "dd" command:

  $ sudo dd if=output/images/sdcard.img of=/dev/sdX

Insert the microSD card into the Arietta slot and power it.

To get the kernel log messages you can use a DPI cable (http://www.acmesystems.it/DPI)
