# LFSInstaller - Linux From Scratch Script Installer

![new_video-ezgif com-crop](https://github.com/user-attachments/assets/72c916b2-268c-49a4-a3c7-a00c1f8a1659)

LFS installer from LFS book (_LinuxFromScratch.org_) for Linux enthusiasts and/or professionals who want to select their tools without extreme maintenance.

----------------------------------------------------------------------------------------------------------------------------

## Description
Following the instruction manual for building Linux From Scratch, even for experienced developers, can be a tedious repetitive task if they hate reimplementing it manually for maintenance. This is also with addition of fixing errors after compiling specific packages that fail to perform compilation. LFSInstaller aims to mitigate theses problems automatically through previous bug errors when building LFS.

# Getting LFSInstaller
LFSInstaller is compatible with the the following standard host machines for package installation:
- **Debian**
- **Arch Linux**
- **Gentoo Linux**
- **Linux Mint**
- **Slackware**

Install Git and clone LFSInstaller GitHub repository on your preferred location.
```
git clone https://github.com/eliaz5536/lfsinstaller.git
```

## Features
### Online & Offline Installer
LFSInstaller can either be installed from online website (using wget / curl) or offline (existing HTML pages which are extracted using XMLint to convert HTML to XML pages).

### Backward Compatibility
You can select specific version through backward compatibility if the kernel or host machine does not support latest versions of source packages. Therefore, you can 
select by using '--version' or '-v' to specify the build version of LFS to install specific packages for your hardware needs on any machine.

### Automatic Disk Management & Partition Selection
On manual installation, you would normally have to select your partition manually and you have to check if you have a specific disk management software installed.
With LFSInstaller, it will scan the list of Disk Management softwares that is installed on your host machine and allow you to select the disk partition software you can
use to proceed with the partitioning. If you do not want to use the disk partition, you can proceed with either using automatic with prompt provided to you or use 
manual for maintenance operation of implementing partition

### Logging
While performing installation, the logs of the operation will be logged into its specific directory, with the purpose of resuming a paused or interrupted installation with its
log intact. This ensures that when returning to its state, the script will scan for the following directory where log file is installed and check the state of completion
of LFS installation and compared to its installation script for resuming completion.

### Resolves Patching Effectively
It is a common problem for experienced developers to perform maintenance with source packages if it fails to compile, which maybe due to missing packages that are not installed
or that are incompatible with Makefile that does not meet the requirement of such installation. With LFSInstaller, if a problem is resolved previously by other users,
the typical solutions will be displayed if a compilation error for a specific source package will be displayed for you to decide how to solve such problem.

# Custom Logging Message
You can decide the type of logging messages, depending on your background as an experienced linux developer. 
You can choose the type by its style of 'Init' systems of the following: 
- **OpenRC**
- **SystemD**
- **SysV**
- **s6**
- **runit**

The default message type will be in SystemD if you do not select the type before-hand.

## Help
```
<insert help box over here>
```

## Usage
```
<insert usage over here>
```

## License
This project is licensed under the GNU General Public License v3.0. See the [LICENSE] file for details.
