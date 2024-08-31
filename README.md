# DistroCraft - Linux Distribution Scratch Automator
GUI Application for creating a Linux Distribution as a template to be built in C/C++ for compatibility with the specified hardware.

## Description
Producing a linux distribution from scratch, even from an experienced linux user, is a diffuclt task since it requires deep understanding of the inner mechanisms of what holds a 'Linux distribution' such as its kernel, file type, and so fourth.

This even includes the type of file content, the selection of choices of the user to select their desktop envionrment that enhances their ability to be customizable, which even includes creating your own bootloader, memory management and so fourth
to deal with virtual mmemory and its page to run the OS from scratch.

However, the following depth of knowledge required to build such a distribution requires extreme amount of knowledge to produce such example, even with multitasking, and selection of fonts that the user wants to produce.

In this case, the following bash script automates the extensive process of compiling its own image by using C programming language (the same language to produce the Operating System) to not only produce the C code for the Linux Distribution but in addition,
also compiles the entire image of the following to make it runnable for the end-user to implement it from scratch.

Not only this tool provides the means of building your own Linux distribution from scratch but it can also be optional for the user to extend the Linux distribution from other distribution that the user dislikes, such as creating their own variant of Debian 
as their goal and so fourth.

This would be extremely suitable for those who wants to program their own embedded linux systems, their own personal OS and any other specialized means of achieving the same tasks that other distribution have not achieved before, as a means of 
producing a blueprint of their upcoming idea to represent the means of what tasks to perform with the distribution.

## Features
- Kernel
  Kernel is essential for maintaining resources of the computer itself 
  - Monolithic Kernel
  - Micro Kernel
  - Hybrid Kernel
  - Exo Kernel
  - Nano Kernel

- Bootleader
  Bootleader is essential for loading a d running when a computer is first turned on or when it restarts.
  - Systemd-bootleader
  - Clover
  - EFISTUB
  - GRUB
  - GRUB Legacy
  - GRUB/EFI
  - LILO
  - Limne
  - REFind
  - Syslinux
  - Unified kernel image

- File System
  Directories that contains root directory and its subdirectories, which contains a partition that usually has only one file system, but may have more than one file system.
  -  ext2
  -  Xiafs
  -  ext3 
  -  ext4
  -  JFS (Journaled File System)
  -  ReiserFS
  -  SquashFS
  -  Reiser4
  -  XFS
  -  btrfs
  -  FAT32

## Demo
Insert demo over here

## License
