# LFSInstaller - Linux From Scratch Script Installer

![new_video-ezgif com-crop](https://github.com/user-attachments/assets/72c916b2-268c-49a4-a3c7-a00c1f8a1659)

LFS installer from LFS book (_LinuxFromScratch.org_) for Linux enthusiasts and/or professionals who want to select their tools without extreme maintenance.

----------------------------------------------------------------------------------------------------------------------------

## Description
Following the instruction manual for building Linux From Scratch, even for experienced developers, can be a tedious repetitive task if they hate reimplementing it manually for maintenance. This is also with addition of fixing errors after compiling specific packages that fail to perform compilation. LFSInstaller aims to mitigate theses problems automatically through previous bug errors when building LFS.

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

### Installation Types
You can select two types of installation scripts that you want to produce which are the following and can be executed as it follows:

#### Single
The installlation will be produced as a single script that will append the installation of packages into the main installation script, by which the installation script would be called 'install.sh'.

#### Phases
The installation will be installed in phases, meaning that each stage of the installation will be created as each script
in order to ensure that the following target machine meets its requirements. The phases can be represented as such:

| **Installation Lifecycle** 	| **Installation State** 	|
|----------------------------	|------------------------	|
| **Phase 1**                	| Build Preparation      	|
| **Phase 2**                	| Cross Toolchain        	|
| **Phase 3**                	| Chroot                 	|
| **Phase 4**                	| System Configuration   	|

The following install type can be prompted before creating installation script(s).
```
sudo ./LFSInstaller.sh -c --install-type="SINGLE"
sudo ./LFSInstaller.sh -c --install-type="PHASE"
```

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
You can select specific version through backward compatibility if the kernel or host machine does not support latest versions of source packages. Therefore, you can 
select by using '--version' or '-v' to specify the build version of LFS to install specific packages for your hardware needs on any machine.

### Automatic Disk Management & Partition Selection
On manual installation, you would normally have to select your partition manually and you have to check if you have a specific disk management software installed.
With LFSInstaller, it will scan the list of Disk Management softwares that is installed on your host machine and allow you to select the disk partition software you can
use to proceed with the partitioning. If you do not want to use the disk partition, you can proceed with either using automatic with prompt provided to you or use 
manual for maintenance operation of implementing partition

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

Options:
  -v, --version									Specifies LFS Release Build Version
  -p, --partition								Specifies partition
  -s, --swap									Enables SWAP partition
  -sp, --swap-partition								Specifies SWAP partition
  -vc, --version-codename							Specifies version codename
  -dc, --distrib-codename							Specifies distrib codename
  --mount							                Mounts target partition to LFS mounting point
  --unmount							                Unmounts target partition from LFS mounting point

Others:
  -h, --help									Show help message
  -u, --usage									Show usage information
  --version-list								Show list of LFS Release Builds
 
Examples:
  ./LFSInstaller -c								Creates standard installation script in interactive mode
  ./LFSInstaller -c --partition='/dev/sda1' --install-type='PHASES'		Creates installation script, on the '/dev/sda1' partition, which will create shell script as phases.
  ./LFSInstaller -c --version='9.0'						Creates installation script that uses the release build version '9.0'
```

## Usage
```
LFSInstaller - Linux From Scratch Shell Script Installer
 
Usage: ./LFSInstaller.sh [modes] [options] [others]
It is recommended to execute this script as a root user !.
```

# Important Note
It is highly recommended that you install LFS by phase installation type.

## License
This project is licensed under MIT License. See the [LICENSE] file for details.
