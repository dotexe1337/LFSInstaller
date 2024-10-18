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

### Backward Compatibility
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

Usage: ./LFSInstaller.sh [options]
It is recommended to run this as a root user

Options:
  --usage						            Show usage information
  -h, --help						        Show help message
  -v, --version						      Specifies LFS Release Build Version
  --swap						            Specifies SWAP partition
  -p, --partition						    Specifies main partition
  --create-partition						Specifies new device blocks of partition
  -c, --create						      Generates installation script
  -i, --install						      Initializes LFS Installation
```

## Usage
```
Usage: ./LFSInstaller.sh [options]
```

## License
This project is licensed under the GNU General Public License v3.0. See the [LICENSE] file for details.
