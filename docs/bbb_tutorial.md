Prepare your host for yocto development:

https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#detailed-supported-distros

Assuming you are using Ubuntu (16.04 or 18.04):
```
$ sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev xterm
```
Clone poky:

```
$ mkdir yocto
$ cd yocto
$ git clone git://git.yoctoproject.org/poky -b sumo
```

Clone the other OE layers:
```
$ git clone https://github.com/openembedded/meta-openembedded -b sumo
$ git clone http://github.com/bernardoaraujor/meta-ethereum
```

Start the build environment:
```
$ source oe-init-build-env
```

Inform BitBake about your layers by adding them to `conf/bblayers.conf`:
```
...

BBLAYERS ?= " \
  /home/bernardo/dev/yocto/poky/meta \
  /home/bernardo/dev/yocto/poky/meta-poky \
  /home/bernardo/dev/yocto/poky/meta-yocto-bsp \
  /home/bernardo/dev/yocto/meta-openembedded/meta-oe \
  /home/bernardo/dev/yocto/meta-ethereum \
  "
```

Inform BitBake that we want to build images for a BeagleBone, that want to use Go v1.10 (to avoid compilation issues from 1.9) and that we want geth to be included in the image build. We do this by adding the following variables to the end of `conf/local.conf`
```
...
MACHINE = "beaglebone-yocto"

GOVERSION = "1.10%"

IMAGE_INSTALL_append = "geth"

```

Build a core-image-minimal image:
```
$ bitbake core-image-minimal
```

After the build has finished (might take a while), we need to flash the artifacts into the SD card. But first we need to prepare it.

Insert the SD card. In my case it showed up as /dev/sdc, might be something else for you. One way to find out is to use de `lsblk` command before and after inserting the SD card.
```
$ lsblk
NAME            MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sdb               8:16   0 238,5G  0 disk 
├─sdb2            8:18   0 230,1G  0 part /
├─sdb3            8:19   0   7,9G  0 part [SWAP]
└─sdb1            8:17   0   512M  0 part 
sda               8:0    0 238,5G  0 disk 
├─sda2            8:2    0     1G  0 part 
├─sda3            8:3    0 237,3G  0 part 
│ ├─fedora-home 253:1    0 179,5G  0 lvm  
│ ├─fedora-root 253:2    0    50G  0 lvm  
│ └─fedora-swap 253:0    0   7,8G  0 lvm  
└─sda1            8:1    0   200M  0 part /boot/efi
$
$
$ lsblk
NAME            MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sdb               8:16   0 238,5G  0 disk 
├─sdb2            8:18   0 230,1G  0 part /
├─sdb3            8:19   0   7,9G  0 part [SWAP]
└─sdb1            8:17   0   512M  0 part 
sdc               8:32   1  14,4G  0 disk 
└─sdc1            8:33   1  14,4G  0 part 
sda               8:0    0 238,5G  0 disk 
├─sda2            8:2    0     1G  0 part 
├─sda3            8:3    0 237,3G  0 part 
│ ├─fedora-home 253:1    0 179,5G  0 lvm  
│ ├─fedora-root 253:2    0    50G  0 lvm  
│ └─fedora-swap 253:0    0   7,8G  0 lvm  
└─sda1            8:1    0   200M  0 part /boot/efi

```

Now let's partition:
```
$ umount /dev/sdc1
$ sudo fdisk /dev/sdc

Welcome to fdisk (util-linux 2.27.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): d
Selected partition 1
Partition 1 has been deleted.


```

Create the boot partition (32Mb):
```
Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): 

Using default response p.
Partition number (1-4, default 1): 
First sector (2048-30277631, default 2048): 
Last sector, +sectors or +size{K,M,G,T,P} (2048-30277631, default 30277631): +32M

Created a new partition 1 of type 'Linux' and of size 32 MiB.
```

Create the rootfs partition (rest of the card):
```
Command (m for help): n
Partition type
   p   primary (1 primary, 0 extended, 3 free)
   e   extended (container for logical partitions)
Select (default p): 

Using default response p.
Partition number (2-4, default 2): 
First sector (67584-30277631, default 67584): 
Last sector, +sectors or +size{K,M,G,T,P} (67584-30277631, default 30277631): 

Created a new partition 2 of type 'Linux' and of size 14,4 GiB.

```

Make first partition bootable:
```
Command (m for help): a
Partition number (1,2, default 2): 1

The bootable flag on partition 1 is enabled now.

```

Set first partition to fat32:
```
Command (m for help): t
Partition number (1,2, default 2): 1
Partition type (type L to list all types): c

Changed type of partition 'Linux' to 'W95 FAT32 (LBA)'.
```

Write the changes to the card:
```
Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

Format partition 1 to fat:
```
$ sudo mkfs.vfat -n "BOOT" /dev/sdc1
mkfs.fat 3.0.28 (2015-05-16)
```

Format partition 2 to ext4:
```
$ sudo mkfs.ext4 -L "ROOT" /dev/sdc2
mke2fs 1.42.13 (17-May-2015)
Creating filesystem with 3776256 4k blocks and 944704 inodes
Filesystem UUID: b1747780-31b6-4194-afdb-78d882f7e415
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208

Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done
```

Mount the partitions:
```
$ mkdir /media/$USER/BOOT; /media/$USER/ROOT
$ sudo mount /dev/sdc1 /media/$USER/BOOT
$ sudo mount /dev/sdc2 /media/$USER/ROOT
```

Copy the build artifacts to the card:
```
$ cd tmp/deploy/images/beaglebone-yocto/
$ sudo cp MLO /media/$USER/BOOT
$ sudo cp u-boot.img /media/$USER/BOOT
$ sudo cp zImage /media/$USER/BOOT
$ sudo cp am335x-boneblack.dtb /media/$USER/BOOT
$ sudo tar xf core-image-minimal-beaglebone-yocto.tar.bz2 -C /media/$USER/ROOT
$ ls /media/$USER/BOOT
am335x-boneblack.dtb  MLO  u-boot.img  zImage
$ ls /media/$USER/ROOT/
bin  boot  dev  etc  home  lib  media  mnt  proc  run  sbin  sys  tmp  usr  var
```

Umount the card:
```
$ sync
$ sudo umount /dev/sdc1
$ sudo umount /dev/sdc2
```

I assume you have a FTDI USB-RS232 cable, and that it shows up as `/dev/ttyUSB0`. Put the SD card on the board, connect the FTDI and start minicom:

```
$ sudo minicom -D /dev/ttyUSB0 -b 115200
```

Power up the board and stop uboot by pressing space. Type the following commands to load the kernel from the SD card:
```
# mmc dev 1
# mmc erase 0 512
# boot
```

Now you are inside the board! Connect an Ethernet cable to a LAN router that's also connected to your host. Make sure the router has UPnP enabled.

Open another terminal and install the go-ethereum package:
```
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository -y ppa:ethereum/ethereum
$ sudo apt-get update
$ sudo apt-get install ethereum
```

Create a dummy wallet:

```
$ geth account new
Your new account is locked with a password. Please give a password. Do not forget this password.
Passphrase: 
Repeat passphrase: 
Address: {f1c0fc4fd943c8664436bf7f3fc75800754b60fd}

```

Start a light node on the host, with HTTP-RPC support for WebSockets:
```
$ geth --syncmode "light" --rpc --ws
```

Back to the BBB (on minicom), use geth to attach to the host's light node:
```
# geth attach http://<host's IP inside the LAN>:8545
```

Finally, print some information on geth's console from the BBB:
```
> net.listening
true
> net.peerCount
1
#wait some minutes, then look at the peer count again
> net.peerCount
3
> eth.accounts
["0xf1c0fc4fd943c8664436bf7f3fc75800754b60fd"]
#same wallet address that we created on the host
> eth.blockNumber
7985956
(wait some minutes, then try to see the blockNumber again)
> eth.blockNumber
7985960
> eth.gasPrice
4000000000

```
