# LFSInstaller - Linux From Scratch Script Installer

<p align="center">
  <img src="https://github.com/user-attachments/assets/16a41527-b9b9-452a-9356-f7386008b615" alt="Logo Banner">
</p>

LFSInstaller is a Linux From Scratch script installation generator that produces a script installation template for you to decide how you want to proceed with the LFS installation.

# Getting LFSInstaller
Clone LFSInstaller repository to a suitable directory.
```
git clone https://github.com/eliaz5536/lfsinstaller.git
```

Go into the repository directory and add execute permission to LFSInstaller.sh.
```
cd /LFSInstaller
chmod +x LFSInstaller.sh
```

Execute the shell script (It is recommended that you execute as a root user).
```
sudo ./LFSInstaller.sh
```

To create your first LFS installation script to start your installation, perform the following command:
```
sudo ./LFSInstaller.sh -c
```

If you want to immediately create LFS Installation script without the use of manually entering the properties from scratch, you can perform the following that would skip certain instructions:
```
sudo ./LFSInstaller.sh -c -v <VERSION> -p <PARTITION_HERE>
```

# Features
### Installation Types
You can select two types of installation scripts that you want to produce which are the following and can be executed as it follows:

#### Single
The installlation will be produced as a single script that will append the installation of packages into the main installation script, by which the installation script would be called 'install.sh'.

```
sudo ./LFSInstaller.sh -c --install-type="SINGLE"
```
#### Phases
The installation will be installed in phases, meaning that each stage of the installation will be created as each script
in order to ensure that the following target machine meets its requirements. The phases can be represented as such:

<div align="center"></div>
<table class="tg"><thead>
  <tr>
    <th class="tg-1wig">Installation Lifecycle</th>
    <th class="tg-1wig">Installation State</th>
    <th class="tg-1wig">Installation Description</th>
  </tr></thead>
<tbody>
  <tr>
    <td class="tg-0lax">Phase 1</td>
    <td class="tg-0lax">Build Preparation</td>
    <td class="tg-0lax">Creating and setting up LFS partition in order to build the LFS system.</td>
  </tr>
  <tr>
    <td class="tg-0lax">Phase 2</td>
    <td class="tg-0lax">Cross Toolchain</td>
    <td class="tg-0lax">Compiling and installing cross toolchain (binutils, gcc and glibc) and temporary tools using the cross-toolchain. </td>
  </tr>
  <tr>
    <td class="tg-0lax">Phase 3</td>
    <td class="tg-0lax">Chroot</td>
    <td class="tg-0lax">Entering chroot environment on the isolated LFS system to install selected packages.</td>
  </tr>
  <tr>
    <td class="tg-0lax">Phase 4</td>
    <td class="tg-0lax">System Configuration</td>
    <td class="tg-0lax">Setting up system configuration such as the kernel and bootloader.</td>
  </tr>
</tbody></table>

```
sudo ./LFSInstaller.sh -c --install-type="PHASE"
```

> [!WARNING]
> It is highly recommended that you install LFS by **phase installation type to ensure** that your isolated system is properly configured and set up correctly from each step of the installation.

> [!IMPORTANT]
> It is **essential** and a **must** that you must **review the installation script(s)** before initializing the installation to ensure that there are no conflicts or major prone errors during the installation process.

### Automatic Mounting and Unmounting
You can mount the LFS mounting point to the target partition and unmount automatically with certain flags that you can pass through to perform such process through the following:
```
sudo ./LFSInstaller.sh -m
sudo ./LFSInstaller.sh -m -f 
sudo ./LFSInstaller.sh -m -l 
```

### Entering Chroot Environment
If the mount is successful and you completed two phases of installation, you can enter chroot environment to install 
packages of your choice in an isolated environment:
```
sudo ./LFSInstaller.sh --chroot
```

### Version Selection (Release Selection)
If you're unsure if the latest release build of LFS is compatible with your kernel or hardware for installation, you can select the version of your choice by 
passing the argument '--version' or '-v' of the following which you can specify the build version to install specific version of packages of your choice:
```
sudo ./LFSInstaller -v="12.2"
```

If you are uncertain about the version that you can choose from, you can execute this command to display the list of release builds of LFS:
```
./LFSInstaller --version-list
```

<p align="center">
  <img src="https://github.com/user-attachments/assets/60b01003-bc12-4d3e-af7c-00e54b5acbad" alt="version-list">
</p>

The following release builds of LFS that you can select from are the following: 

<div align="center">
<table class="tg"><thead>
  <tr>
    <th class="tg-amwm">Release Build</th>
    <th class="tg-amwm">Version</th>
    <th class="tg-amwm">Release Date</th>
  </tr></thead>
<tbody>
  <tr>
    <td class="tg-0lax">LFS-12.2 Release</td>
    <td class="tg-1wig">12.2</td>
    <td class="tg-0lax">2024/09/01</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-12.2-rc1 Release</td>
    <td class="tg-1wig">12.2-rc1</td>
    <td class="tg-0lax">2024/08/18</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-12.1 Release</td>
    <td class="tg-1wig">12.1</td>
    <td class="tg-0lax">2024/03/01</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-12.2-rc1 Release</td>
    <td class="tg-1wig">12.2</td>
    <td class="tg-0lax">2024/02/15</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-12.0 Release</td>
    <td class="tg-1wig">12.0</td>
    <td class="tg-0lax">2023/09/01</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-12.0-rc1 Release</td>
    <td class="tg-1wig">12.0-rc1</td>
    <td class="tg-0lax">2023/08/15</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-11.3 Release</td>
    <td class="tg-1wig">11.3</td>
    <td class="tg-0lax">2023/03/01</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-11.3-rc1 Release</td>
    <td class="tg-1wig">11.3-rc1</td>
    <td class="tg-0lax">2023/02/14</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-11.2 Release</td>
    <td class="tg-1wig">11.2</td>
    <td class="tg-0lax">2022/09/01</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-11.2-rc1 Release</td>
    <td class="tg-1wig">11.2-rc1</td>
    <td class="tg-0lax">2022/08/21</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS Stable Version 11.1 Release</td>
    <td class="tg-1wig">11.1</td>
    <td class="tg-0lax">2022/03/01</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-11.1-rc1 Release</td>
    <td class="tg-1wig">11.1-rc1</td>
    <td class="tg-0lax">2022/02/15</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-11.0 Release</td>
    <td class="tg-1wig">11.0</td>
    <td class="tg-0lax">2021/09/01</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-11.0-rc3 Release</td>
    <td class="tg-1wig">11.0-rc3</td>
    <td class="tg-0lax">2021/08/25</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-11.0-rc2 Release</td>
    <td class="tg-1wig">11.0-rc2</td>
    <td class="tg-0lax">2021/08/20</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-11.0-rc1 Release</td>
    <td class="tg-1wig">11.0-rc1</td>
    <td class="tg-0lax">2021/08/15</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS Stable Version 10.1 Release</td>
    <td class="tg-1wig">10.1</td>
    <td class="tg-0lax">2021/03/01</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-10.1-rc1 Release</td>
    <td class="tg-1wig">10.1-rc1</td>
    <td class="tg-0lax">2021/02/19</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS Stable Version 10.0 Release</td>
    <td class="tg-1wig">10.0</td>
    <td class="tg-0lax">2020/09/01</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS-10.0-rc1 Release</td>
    <td class="tg-1wig">10.0-rc1</td>
    <td class="tg-0lax">2020/08/15</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS Stable Version 9.1 Release</td>
    <td class="tg-1wig">9.1</td>
    <td class="tg-0lax">2020/03/01</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS 9.1-rc1 Release</td>
    <td class="tg-1wig">9.1-rc1</td>
    <td class="tg-0lax">2020/02/14</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS Stable Version 9.0 Release</td>
    <td class="tg-1wig">9.0</td>
    <td class="tg-0lax">2019/09/01</td>
  </tr>
  <tr>
    <td class="tg-0lax">LFS 9.0-rc1 Release</td>
    <td class="tg-1wig">9.0-rc1</td>
    <td class="tg-0lax">2019/08/15</td>
  </tr>
</tbody></table>
</div>

### Automatic Disk Management & Partition Selection
If you have not created a partition before initializing the LFS installation and you do not want to go through the manual configuration of creating such partition, you can 
create your partition through LFSInstaller by the following command:
```
sudo ./LFSInstaller --create-partition
```

The following process scans a list of Disk management application in your host machine, by which you can select such software in order to proceed with partitioning.

<div align="center">
<table class="tg"><thead>
  <tr>
    <th class="tg-7btt">Disk Utility Programs</th>
  </tr></thead>
<tbody>
  <tr>
    <td class="tg-c3ow">cfdisk</td>
  </tr>
  <tr>
    <td class="tg-c3ow">fdisk</td>
  </tr>
  <tr>
    <td class="tg-c3ow">parted</td>
  </tr>
  <tr>
    <td class="tg-baqh">lsblk</td>
  </tr>
  <tr>
    <td class="tg-baqh">gparted</td>
  </tr>
  <tr>
    <td class="tg-baqh">gdisk</td>
  </tr>
  <tr>
    <td class="tg-baqh">df</td>
  </tr>
  <tr>
    <td class="tg-baqh">mount</td>
  </tr>
  <tr>
    <td class="tg-baqh">umount</td>
  </tr>
  <tr>
    <td class="tg-baqh">blkid</td>
  </tr>
</tbody>
</table>
</div>

## Help
```
LFSInstaller
 
LFS Script Installer by which the user can decide how they want to customize their own package.
This is designed to be a template starter for Linux enthusiasts who want to 

Usage: ./LFSInstaller.sh [modes] [options] [others]
It is recommended to execute this script as a root user.

Modes: 
  -c, --create									Generates LFS installation script
  -i, --install									Starts LFS Installation script
  -it, --install-type								Specifies installation type
  --create-partition								Specifies new device blocks of partition
  -m, --mount									Mounts LFS to a target partition
  -um, --unmount								Unmounts LFS from a target partition
  --chroot									Enters chroot environment on an isolated machine

Options:
  -v, --version									Specifies LFS Release Build Version
  -p, --partition								Specifies partition
  -s, --swap									Enables SWAP partition
  -sp, --swap-partition								Specifies SWAP partition
  -vc, --version-codename							Specifies version codename
  -dc, --distrib-codename							Specifies distrib codename
 
Others:
  -h, --help									Show help message
  -u, --usage									Show usage information
  --version-list								Show list of LFS Release Builds
 
Examples:
  ./LFSInstaller -m								Initializes mounting procedure
  ./LFSInstaller -m -f								Forces mounting procedure
  ./LFSInstaller -c								Creates standard installation script in interactive mode (if no values have passed)
  ./LFSInstaller --partition='/dev/sda1' --install-type='PHASE' -c		Creates installation script, on the '/dev/sda1' partition, which will create shell script as phases.
  ./LFSInstaller --version='9.0' -c						Creates installation script that uses the release build version '9.0'
```

## Usage
```
LFSInstaller - Linux From Scratch Shell Script Installer
 
Usage: ./LFSInstaller.sh [modes] [options] [others]
It is recommended to execute this script as a root user !.
```

## License
This project is licensed under MIT License. See the [LICENSE] file for details.
