#!/bin/bash
#================================================================
# HEADER 
#================================================================
# Script Name    : LFSInstaller.sh
# Description    : Interactive LFS Installer
# Author         : Eliaz Simon
# Date           : 2024-10-13
# Version        : 1.0
# Usage          : ./LFSInstaller.sh
# Notes          : 
# Dependencies   : 
#================================================================
# MIT License
# Copyright (c) 2024 Eliaz Simon
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this
# software and associated documentation files (the Software), to deal in the Software
# without restriction, including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software, and to permit
# persons to whom the Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or
# substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#================================================================

# Capture the current time
current_time=$(date +"%T")

# Capture the current date
current_date=$(date +"%Y-%m-%d")

# Capture the current year
current_year=$(date +"%Y")

#################################################################
# ANSI Color Code Escape Sequences			        #
#################################################################

# Colors
BLACK="\e[30m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
LIGHT_GRAY="\e[37m"
GRAY="\e[90m"
LIGHT_RED="\e[91m"
LIGHT_GREEN="\e[92m"
LIGHT_YELLOW="\e[93m"
LIGHT_BLUE="\e[94m"
LIGHT_MAGENTA="\e[95m"
LIGHT_CYAN="\e[96m"

# Background Colors
BLACK_BG="\e[40m"
RED_BG="\e[41m"
GREEN_BG="\e[42m"
YELLOW_BG="\e[43m"
BLUE_BG="\e[44m"
MAGENTA_BG="\e[45m"
CYAN_BG="\e[46m"
WHITE_BG="\e[47m"

# Bold
BOLD_BLACK="\e[1;30m"
BOLD_RED="\e[1;31m"
BOLD_GREEN="\e[1;32m"
BOLD_YELLOW="\e[1;33m"
BOLD_BLUE="\e[1;34m"
BOLD_MAGENTA="\e[1;35m"
BOLD_CYAN="\e[1;36m"
BOLD_LIGHT_GRAY="\e[1;37m"
BOLD_GRAY="\e[1;90m"
BOLD_LIGHT_RED="\e[1;91m"
BOLD_LIGHT_GREEN="\e[1;92m"
BOLD_LIGHT_YELLOW="\e[1;93m"
BOLD_LIGHT_BLUE="\e[1;94m"
BOLD_LIGHT_MAGENTA="\e[1;95m"
BOLD_LIGHT_CYAN="\e[1;96m"
BOLD_WHITE="\e[1;97m"

# Italic
ITALIC_BLACK="\e[3;30m"
ITALIC_RED="\e[3;31m"
ITALIC_GREEN="\e[3;32m"
ITALIC_YELLOW="\e[3;33m"
ITALIC_BLUE="\e[3;34m"
ITALIC_MAGENTA="\e[3;35m"
ITALIC_CYAN="\e[3;36m"
ITALIC_LIGHT_GRAY="\e[3;37m"
ITALIC_GRAY="\e[3;90m"
ITALIC_LIGHT_RED="\e[3;91m"
ITALIC_LIGHT_GREEN="\e[3;92m"
ITALIC_LIGHT_YELLOW="\e[3;93m"
ITALIC_LIGHT_BLUE="\e[3;94m"
ITALIC_LIGHT_MAGENTA="\e[3;95m"
ITALIC_LIGHT_CYAN="\e[3;96m"
ITALIC_WHITE="\e[3;97m"

# Styles
BOLD="\e[1m"
ITALIC="\e[3m"
ENDCOLOR="\e[0m"

#================================================================
# FUNCTION: info
# DESCRIPTION:
#     Prints info message using the provided parameter.
# PARAMETERS:
#     $1 - A message
# RETURNS:
#     None
#================================================================
info() {
        local message=$1
        printf "${WHITE}[${ENDCOLOR}${CYAN}$current_time${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}[${ENDCOLOR}${GREEN}INFO${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}$1${ENDCOLOR}\n"
}

#================================================================
# FUNCTION: bold_info
# DESCRIPTION:
#     Prints bold info message using the provided parameter.
# PARAMETERS:
#     $1 - A message
# RETURNS:
#     None
#================================================================
bold_info() {
        local message=$1
        printf "${WHITE}[${ENDCOLOR}${CYAN}$current_time${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}[${ENDCOLOR}${BOLD_GREEN}INFO${ENDCOLOR}${WHITE}]${ENDCOLOR} ${BOLD_WHITE}$1${ENDCOLOR}\n"
}

#================================================================
# FUNCTION: success
# DESCRIPTION:
#     Prints success message using the provided parameter.
#     $1 - A message
# RETURNS:
#     None
#================================================================
success() {
        local message=$1
        printf "${WHITE}[${ENDCOLOR}${CYAN}$current_time${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}[${ENDCOLOR}${BOLD_GREEN}SUCCESS${ENDCOLOR}${WHITE}]${ENDCOLOR} ${BOLD_WHITE}$1${ENDCOLOR}\n"
}

#================================================================
# FUNCTION: warning
# DESCRIPTION:
#     Prints warning message using the provided parameter.
# PARAMETERS:
#     $1 - A message
# RETURNS:
#     None
#================================================================
warning() {
        local message=$1
        printf "${WHITE}[${ENDCOLOR}${CYAN}$current_time${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}[${ENDCOLOR}${YELLOW}WARNING${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}$1${ENDCOLOR}\n"
}

#================================================================
# FUNCTION: bold_warning
# DESCRIPTION:
#     Prints bold warning message using the provided parameter.
# PARAMETERS:
#     $1 - A message
# RETURNS:
#     None
#================================================================
bold_warning() {
        local message=$1
        printf "${WHITE}[${ENDCOLOR}${CYAN}$current_time${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}[${ENDCOLOR}${BOLD_YELLOW}WARNING${ENDCOLOR}${WHITE}]${ENDCOLOR} ${BOLD_WHITE}$1${ENDCOLOR}\n"
}

#================================================================
# FUNCTION: error
# DESCRIPTION:
#     Prints error message using the provided parameter.
# PARAMETERS:
#     $1 - A message
# RETURNS:
#     None
#================================================================
error() {
        local message=$1
        printf "${WHITE}[${ENDCOLOR}${CYAN}$current_time${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}[${ENDCOLOR}${RED}ERROR${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}$1${ENDCOLOR}\n"
}

#================================================================
# FUNCTION: bold_error
# DESCRIPTION:
#     Prints bold error message using the provided parameter.
# PARAMETERS:
#     $1 - A message
# RETURNS:
#     None
#================================================================
bold_error() {
        local message=$1
        printf "${WHITE}[${ENDCOLOR}${CYAN}$current_time${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}[${ENDCOLOR}${BOLD_RED}ERROR${ENDCOLOR}${WHITE}]${ENDCOLOR} ${BOLD_WHITE}$1${ENDCOLOR}\n"
}

#================================================================
# FUNCTION: verify_mount_point
# DESCRIPTION:
#     Scans if "/mnt/lfs" is mounted to the host machine that is listed in /proc/mounts.
# PARAMETERS:
#     None
# RETURNS:
#     0 - Returns true if mount point is mounted on device
#     1 - Returns false if mount point is not mounted
#================================================================
verify_mount_point() {
	MOUNT_POINT="/mnt/lfs"
	info "Scanning mount point $MOUNT_POINT..."
	if grep -qs /mnt/lfs /proc/mounts; then
		DEVICE=$(grep "$MOUNT_POINT" /proc/mounts | awk '{print $1}')
		success "$MOUNT_POINT is mounted on $DEVICE."
		return 0
	else
		error "$MOUNT_POINT is not mounted."
		return 1
	fi
}

#================================================================
# FUNCTION: verify_partition
# DESCRIPTION:
#     Checks if partition exists which scans from /proc/partitions.
# PARAMETERS:
#     $1 - Target partition
# RETURNS:
#     0 - Returns true if target partition is listed on /proc/partitions.
#     1 - Returns false if target partition is not listed on /proc/partition
#================================================================
verify_partition() {
	local PARTITION=$1
	local PARTITION_NAME=$(basename "$PARTITION")
	if grep -wq "$PARTITION_NAME" /proc/partitions; then
		return 0 
	else 
		return 1
	fi
}

#================================================================
# FUNCTION: select_partition
# DESCRIPTION:
#     Retrieves user input of an available target partition.
# PARAMETERS:
#     None
# RETURNS:
#     0 - Returns true if such partition exist.
#     1 - Returns false if such partition does not exist.
#================================================================
select_partition() {
	read -p "Specify the partition: " PARTITION
	AVAILABLE_PARTITION=$(verify_partition "$PARTITION")
	if [ $? -eq 0 ]; then
		echo "$PARTITION"
		return 0
	else
		return 1
	fi
}

#================================================================
# FUNCTION: mount
# DESCRIPTION:
#     Mounts LFS drive to a target partition
# PARAMETERS:
#     $1 - Target Partition
# RETURNS:
#     0 - Target partition is mounted to LFS mount point.
#     1 - Target partition is not mounted successfully to LFS mount point.
#================================================================
mount() {
	local PARTITION=$1
	MOUNT_POINT_BOOLEAN=$(verify_mount_point)

	if [[ "$MOUNT_POINT_BOOLEAN" == "1" ]]; then
		if [[ -n $PARTITION ]]; then
			PARTITION=$(select_partition)
		fi

		info "Proceeding to mount $PARTITION to $LFS..."
	
		info "Creating $LFS directory..."	
		mkdir -pv $LFS
		info "Mounting $LFS to $PARTITION ext4 partiion..."	
		mount -v -t ext4 $PARTITION $LFS
		info "Creating $LFS/home directory..."
		mkdir -v $LFS/home
		info "Mounting $LFS/home directory to $PARTITION ext4 partiion..."	
		mount -v -t ext4 $PARTITION $LFS/home
		
		info "Verifying if the partition $PARTITION is mounted to $LFS..."
		MOUNT_POINT="/mnt/lfs"
		if grep -qs "$MOUNT_POINT" /proc/mounts; then
			if grep -qs "$PARTITION $MOUNT_POINT" /proc/mounts; then
				success "Partition $PARTITION is mounted on $MOUNT_POINT."
				exit 0
			else 
				error "Partition $PARTITION is not mounted on $MOUNT_POINT."
				exit 1
			fi	
		fi
	fi
}

#================================================================
# FUNCTION: unmount
# DESCRIPTION:
#     Unmounts LFS mount point from a partition.
# PARAMETERS:
#     $1 - Unmount flag arguments:
#     		-f / --force - Force unmounting process
#     		-l / --lazy  - Slow unmounting process
# RETURNS:
#     0 - LFS mountpoint is unmounted from partition.
#     1 - LFS mountpoint failed to be unmounted from partition.
#================================================================
unmount() {
	FLAG=""
	for arg in "$0"
	do
		case $arg in
			-f|--force) FLAG="-f"; shift ;;
			-l|--lazy) FLAG="-l"; shift ;;
			*) error "Unknown umount parameter passed: "; exit 1 ;;
		esac
		shift
	done

	UNMOUNT_COMMAND="umount $FLAG"	
	if [[ -n "$FLAG" ]]; then
		FLAG="-v"
	fi

	MOUNT_POINT_BOOLEAN=$(verify_mount_point)
	if [[ "$MOUNT_POINT_BOOLEAN" == "0" ]]; then
		bold_info "Unmounting the virtual file systems"	
		info "Unmounting $LFS/dev/pts..."
		eval $UNMOUNT_COMMAND $LFS/dev/pts
		info "Unmounting $LFS/dev/shm..."
		eval mountpoint -q $LFS/dev/shm && $UNMOUNT_COMMAND -v $LFS/dev/shm
		info "Unmounting $LFS/dev..."
		eval $UNMOUNT_COMMAND $LFS/dev
		info "Unmounting $LFS/run..."
		eval $UNMOUNT_COMMAND $LFS/run
		info "Unmounting $LFS/proc..."
		eval $UNMOUNT_COMMAND $LFS/proc
		info "Unmounting $LFS/sys..."
		eval $UNMOUNT_COMMAND $LFS/sys

		bold_info "Unmounting the LFS file system"	
		info "Unmounting $LFS/home..."
		eval $UNMOUNT_COMMAND $LFS/home
		info "Unmounting $LFS..."
		eval $UNMOUNT_COMMAND $LFS

		MOUNT_POINT=/mnt/lfs
		if [ ! grep -qs "$MOUNT_POINT" /proc/mounts ]; then
			success "The mount point $MOUNT_POINT is unmounted from partition"
		else 
			error "The mount point $MOUNT_POINT is currently still mounted from partition"
			exit 1
		fi
	else
		error "The mount point $MOUNT_POINT is not available on your host machine."
		exit 1
	fi

	exit 0
}

#================================================================
# FUNCTION: chroot
# DESCRIPTION:
#     Enters chroot environment as an isolated machine
# PARAMETERS:
#     None
# RETURNS:
#     1 - LFS Mount point is not mounted to partition
#================================================================
chroot() {
	MOUNT_POINT_BOOLEAN=$(verify_mount_point)
	if [[ "$MOUNT_POINT_BOOLEAN" = "1" ]]; then
		exit 1
	fi

	export LFS=/mnt/lfs
	chroot "$LFS" /usr/bin/env -i   \
	    HOME=/root                  \
	    TERM="$TERM"                \
	    PS1='(lfs chroot) \u:\w\$ ' \
	    PATH=/usr/bin:/usr/sbin     \
	    MAKEFLAGS="-j$(nproc)"      \
	    TESTSUITEFLAGS="-j$(nproc)" \
	    /bin/bash --login
}

#================================================================
# FUNCTION: display_version_list
# DESCRIPTION:
#     Prints LFS Release Build Version list
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
display_version_list() {
	for i in "${!VERSION_LIST[@]}"; do
	        echo "$((i + 1)). ${VERSION_LIST[i]}"
	done
}

#================================================================
# FUNCTION: install
# DESCRIPTION:
#     Performs LFS Installation that is generated from install script
#     if user is currently root and that the installation script exists
#     in order to perform installation.
# PARAMETERS:
#     None
# RETURNS:
#     1 - User is not root to perform the following installation.
#================================================================
install() {
	if [[ "$EUID" -ne 0 ]];  then
		warning "You must run this script as a root user to perform such action."
		exit 1
	fi

	if [[ -e "install.sh" ]]; then
		info "Installing LFS Release Build Version $VERSION"
		sudo ./install.sh				
	else 
		error "File 'install.sh' does not exist in the script's directory."
	fi
}

#================================================================
# FUNCTION: create_partition
# DESCRIPTION:
#     Scans disk management tools from host machine for the user to create 
#     partition if no partition is available on host machine.
# PARAMETERS:
#     None
# RETURNS:
#     1 - Disk management tools is not available on the host machine.
#================================================================
create_partition() {
	disk_tools=("cfdisk" "fdisk" "parted" "lsblk" "gparted" "gdisk" "df" "mount" "umount" "blkid")
	selected_tools=()

	echo "Scanning for disk management tools..."	

	for tool in "${disk_tools[@]}"; do
	    if command -v "$tool" &> /dev/null; then
		echo "$tool is installed."
		selected_tools+=("$tool")
	    fi
	done

	if [ ${#selected_tools[@]} -eq 0 ]; then
		error "No disk management tools found."
		exit 1
	fi

	echo "Please select the tools you want to use from the following list:"
	for i in "${!selected_tools[@]}"; do
		echo "$((i + 0)). ${selected_tools[i]}"
	done

	read -p "Enter the number of the disk management tool you want to select: " user_input

    	if [[ "$user_input" =~ ^[0-9]+$ ]] && [ "$user_input" -ge 0 ] && [ "$user_input" -lt "${#selected_tools[@]}" ]; then
        	tool="${selected_tools[user_input]}"
        	echo "You selected: $tool"
        
        	sudo "$tool"
        	echo "Operation completed."
    	else
        	echo "Error: Invalid selection: $user_input"
    	fi
}

#================================================================
# FUNCTION: create_script
# DESCRIPTION:
#     Creates LFS installation script from user's input
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
create_script() {
	if [ -z "$PARTITION" ]; then
		PARTITION=$(select_partition)
		if [ $? -eq 0 ]; then
			info "Partition: $PARTITION"
		else
			error "Partition not selected"
			exit 1
		fi
	fi

	if [ -z "$SWAP_PARTITION" ]; then
		while true; do
			read -p "Do you want to use swap partition during LFS installation (Y/n): " answer
			case "$answer" in 
				[Yy]* )
					info "Enabled swap partition."
					SWAP=true
					break
					;;
				[Nn]* )
					info "Disabled swap partition."
					SWAP=false
					break
					;;
				* )
					error "Please answer Y or n."
					;;
			esac
		done

		if [ "$SWAP" = "true" ]; then
			SWAP_PARTITION=$(select_partition)
			if [ $? -eq 0 ]; then
				info "Swap Partition: $SWAP_PARTITION"
			else
				error "Swap partition not selected"
				exit 1
			fi
		fi
	fi

	if [ -z "$VERSION" ]; then
		match_found=0
		for ver in "${VERSION_LIST[@]}"; do
			if [ "$VERSION" = "$ver" ]; then
				match_found=1
				break
			fi
		done

		if [ "$match_found" -eq 0 ]; then
			display_version_list
			while true; do
				read -p "Enter the number corresponding to your choice (1-23): " -a answer
				case "$answer" in 
					1 )
						VERSION="${VERSION_LIST[0]}"
						break
						;;
					2 )
						VERSION="${VERSION_LIST[1]}"
						break
						;;
					3 )
						VERSION="${VERSION_LIST[2]}"
						break
						;;
					4 )
						VERSION="${VERSION_LIST[3]}"
						break
						;;
					5 )
						VERSION="${VERSION_LIST[4]}"
						break
						;;
					6 )
						VERSION="${VERSION_LIST[5]}"
						break
						;;
					7 )
						VERSION="${VERSION_LIST[6]}"
						break
						;;
					8 )
						VERSION="${VERSION_LIST[7]}"
						break
						;;
					9 )
						VERSION="${VERSION_LIST[8]}"
						break
						;;
					10 )
						VERSION="${VERSION_LIST[9]}"
						break
						;;
					11 )
						VERSION="${VERSION_LIST[10]}"
						break
						;;
					12 )
						VERSION="${VERSION_LIST[11]}"
						break
						;;
					13 )
						VERSION="${VERSION_LIST[12]}"
						break
						;;
					14 )
						VERSION="${VERSION_LIST[13]}"
						break
						;;
					15 )
						VERSION="${VERSION_LIST[14]}"
						break
						;;
					16 )
						VERSION="${VERSION_LIST[15]}"
						break
						;;
					17 )
						VERSION="${VERSION_LIST[16]}"
						break
						;;
					18 )
						VERSION="${VERSION_LIST[17]}"
						break
						;;
					19 )
						VERSION="${VERSION_LIST[18]}"
						break
						;;
					20 )
						VERSION="${VERSION_LIST[19]}"
						break
						;;
					21 )
						VERSION="${VERSION_LIST[20]}"
						break
						;;
					22 )
						VERSION="${VERSION_LIST[21]}"
						break
						;;
					23 )
						VERSION="${VERSION_LIST[22]}"
						break
						;;
					* )
						error "You must select the version"
						break
						;;
				esac
			done
			info "LFS Release Build Version: $VERSION"
		fi
	fi

	if [ -z "$INSTALL_TYPE" ]; then
		INSTALL_VALUES=("SINGLE" "PHASES")
		match_found=0
		for install in "${INSTALL_VALUES[@]}"; do
			if [ "$INSTALL_TYPE" = "$install" ]; then
				match_found=1
				break
			fi
		done

		if [ "$match_found" -eq 0 ]; then
			while true; do
				echo "The LFS Installation allows you to choose two types of installation:"
				echo ""
				echo "1. Single Script Installation"
				echo "The script will merge all scripts, with addition of dependencies but it requires overviewing"
				echo "of how your script can be installed."
				echo ""
				echo "2. Phases Script Installation"
				echo "The following installation will be broken down into phases, allowing more control over the process"
				echo "and allowing your to install components manually."
				echo ""
				echo "The following phases follow as such"
				echo "		Phase 1 - Build Preparation"
				echo "		Phase 2 - Cross Toolchain"
				echo "		Phase 3 - Chroot"
				echo "		Phase 4 - System Configuration"
				echo ""

				# Prompt the user
				read -p "Enter your choice (1 or 2): " answer
			
				# Convert the answer to lowercase for easier comparison
				case "$answer" in 
					1)
						info "Installation Type: Single Script Installation"
						INSTALL_TYPE="SINGLE"
						break
						;;
					2 )
						info "Installation Type: Phase-by-Phase Installation"
						INSTALL_TYPE="PHASES"
						break
						;;
					* )
						error "Invalid option. Please run the script again and choose 1 or 2."
						;;
				esac
			done
		fi
	fi

	if [ -z "$DISTRIB_CODENAME" ]; then
		echo "DISTRIB CODENAME"
		echo ""
		echo "The codename refers to the specific release of the Linux distribution."
		echo ""
		echo "It is usually found in system files like /etc/lsb-release."
		echo ""
		while true; do
			read -p "Enter the name of your specific release: " distrib_codename
		
			if [[ -z "$distrib_codename" ]]; then
				error "The DISTRIB CODENAME is empty. Please try again."
			else 
				info "DISTRIB_CODENAME: $distrib_codename"
				DISTRIB_CODENAME="$distrib_codename"
				break
			fi
		done
	fi

	if [ -z "$VERSION_CODENAME" ]; then
		echo "VERSION CODENAME"
		echo ""
		echo "This is term represent the codename of the distributed version, which can be found in files like /etc/os-release."
		echo ""
		while true; do
			read -p "Enter the name of your codename of the distributed version: " version_codename
		
			if [[ -z "$version_codename" ]]; then
				error "The VERSION CODENAME is empty. Please try again."
			else 
				info "VERSION_CODENAME: $version_codename"
				VERSION_CODENAME="$version_codename"
				break
			fi
		done
	fi

 	./generate-installer.sh 	\
		"$PARTITION" 		\
		"$SWAP_PARTITION" 	\
		"$DISTRIB_CODENAME" 	\
		"$VERSION_CODENAME" 	\
		"$INSTALL_TYPE" 	\
		"$VERSION" 		
}

#================================================================
# FUNCTION: usage
# DESCRIPTION:
#     Prints default usage information.
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
usage() {
	echo "LFSInstaller - Linux From Scratch Shell Script Installer"
  	echo " "
	echo "Usage: ./LFSInstaller.sh [modes] [options] [others]"
	echo "It is recommended to execute this script as a root user !."
	exit 0
}

#================================================================
# FUNCTION: help
# DESCRIPTION:
#     Prints default help information.
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
help() {
	echo "LFSInstaller"
	echo " "
	echo "LFS Script Installer by which the user can decide how they want to customize their own package."
	echo "This is designed to be a template starter for Linux enthusiasts who want to "
	echo ""
	echo "Usage: ./LFSInstaller.sh [modes] [options] [others]"
	echo "It is recommended to execute this script as a root user."
	echo ""
	echo "Modes: "
	printf "  ${BOLD}-c, --create${ENDCOLOR}									Generates LFS installation script\n"
	printf "  ${BOLD}-i, --install${ENDCOLOR}									Starts LFS Installation script\n"
	printf "  ${BOLD}-it, --install-type${ENDCOLOR}								Specifies installation type\n"
	printf "  ${BOLD}--create-partition${ENDCOLOR}								Specifies new device blocks of partition\n"
	printf "  ${BOLD}-m, --mount${ENDCOLOR}									Mounts LFS to a target partition\n"
	printf "  ${BOLD}-um, --unmount${ENDCOLOR}								Unmounts LFS from a target partition\n"
	printf "  ${BOLD}--chroot${ENDCOLOR}									Enters chroot environment on an isolated machine\n"
	echo ""
	echo "Options:"
	printf "  ${BOLD}-v, --version${ENDCOLOR}									Specifies LFS Release Build Version\n"
	printf "  ${BOLD}-p, --partition${ENDCOLOR}								Specifies partition\n"
	printf "  ${BOLD}-s, --swap${ENDCOLOR}									Enables SWAP partition\n"
	printf "  ${BOLD}-sp, --swap-partition${ENDCOLOR}								Specifies SWAP partition\n"
	printf "  ${BOLD}-vc, --version-codename${ENDCOLOR}							Specifies version codename\n"
	printf "  ${BOLD}-dc, --distrib-codename${ENDCOLOR}							Specifies distrib codename\n"
	echo " "
	echo "Others:"
	printf "  ${BOLD}-h, --help${ENDCOLOR}									Show help message\n"
  	printf "  ${BOLD}-u, --usage${ENDCOLOR}									Show usage information\n"
  	printf "  ${BOLD}--version-list${ENDCOLOR}								Show list of LFS Release Builds\n"
	echo " "
	echo "Examples:"
  	printf "  ${BOLD}./LFSInstaller -m${ENDCOLOR}								Initializes mounting procedure\n"
  	printf "  ${BOLD}./LFSInstaller -m -f${ENDCOLOR}								Forces mounting procedure\n"
	printf "  ${BOLD}./LFSInstaller -c${ENDCOLOR}								Creates standard installation script in interactive mode (if no values have passed)\n"
  	printf "  ${BOLD}./LFSInstaller --partition='/dev/sda1' --install-type='PHASE' -c${ENDCOLOR}		Creates installation script, on the '/dev/sda1' partition, which will create shell script as phases.\n"
  	printf "  ${BOLD}./LFSInstaller --version='9.0' -c${ENDCOLOR}						Creates installation script that uses the release build version '9.0'\n"
	exit 0
}

VERSION_LIST=("9.0-rc1" "9.0" "9.1-rc1" "9.1" "10.0-rc1" "10.0" "10.1-rc1" "10.1" "11.0-rc1"
	"11.0-rc2" "11.0-rc3" "11.0" "11.1-rc1" "11.1" "11.2-rc1" "11.3-rc1" "11.3" "12.0-rc1" "12.0" "12.1-rc1" 
	"12.1" "12.2-rc1" "12.2")

PARTITION=""
SWAP=false
SWAP_PARTITION=""
VERSION_CODENAME=""
DISTRIB_CODENAME=""
INSTALL_TYPE=""
VERSION=""

while [[ "$#" -gt 0 ]]; do
	case $1 in
		-u|--usage) usage ;;
		-h|--help) help ;;
		--version-list) display_version_list ;;
		-v|--version) VERSION="$2" shift ;;
		-p|--partition) PARTITION="$2" shift ;;
		-s|--swap) SWAP=true shift ;;
		-sp|--swap-partition) SWAP_PARTITION="$2" shift ;;
		-it|--install-type) INSTALL_TYPE="$2" shift ;;
		-vc|--version-codename) VERSION_CODENAME="$2" shift ;;
		-dc|--distrib-codename) DISTRIB_CODENAME="$2" shift ;;
		--create-partition) create_partition ;;
		-m|--mount) mount ;;
		-um|--unmount) unmount ;;
		--chroot) chroot ;;
		-c|--create) create_script ;;
		-i|--install) install ;;
		*) error "Unknown parameter passed: "; exit 1 ;;
	esac
	shift
done
