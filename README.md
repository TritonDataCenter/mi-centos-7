# Centos 7 ISO Builder

This repo allows one to create a custom CentOS 7 ISO with the necessary packages and
tooling for deploying on SmartOS and the Joyent Public Cloud.

## Requirements

In order to use this repo, you need to have the following:

 * SmartOS
 * A running CentOS instance (physical or virtual) with spare disk space
 * sdc-vmtools

## Setup

Included is a `setup_env.sh` script to be run inside the CentOS instance.  This
script will install the necessary packages required to create a custom ISO.

## Using

The next script is `create_iso` which takes a series of commands:

 * fetch
 * layout
 * finish

### fetch
This command will fetch the DVD ISO from a given URL (default is Stanford) if
no currently found.

### layout
This command will extract the ISO and place it onto disk and copying any
custom RPMS in `./RPMS` onto the layout.

## finish
This command will cleanup all prior ISO metadata, copy over the kickstart file
in `./ks.cfg`, modify the boot menu to add the kickstart file, and
creates the ISO in `./iso`.

You can run each command separately or all together.

    ./create_iso fetch
    # create RPMs
    ./create_iso layout
    ./create_iso finish

Or `./create_iso fetch layout finish`.

The resulting ISO will be ready to boot and install a clean image ready for
SmartOS and the Joyent Public Cloud.

## Default Settings For Image

* Stock Kernel
* US Keyboard and Language
* Firewall enabled with SSH allowed
* Passwords are using SHA512
* Firstboot disabled
* SELinux is set to permissive
* Timezone is set to UTC
* Disk is 10GB in size (8GB for / and the rest for swap)
* Default packages installed (me-centos
is from [https://github.com/joyent/me-centos](https://github.com/joyent/me-centos))


   * @core
   * acpid
   * iputils
   * man
   * me-centos
   * ntp
   * ntpdate
   * parted
   * vim-common
   * vim-enhanced
   * vim-minimal
   * wget
