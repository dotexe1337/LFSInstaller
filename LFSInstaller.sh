#!/bin/bash
#================================================================
# HEADER 
#================================================================
# Script Name    : LFSInstaller.sh
# Description    : Complete LFS Installer
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
# FUNCTION: check_mount_point
# DESCRIPTION:
#     Scans if the following mount point '/mnt/lfs' is mounted to the host machine.
# PARAMETERS:
#     None
# RETURNS:
#     0 - True
#     1 - False
#================================================================
check_mount_point() {
	MOUNT_POINT="/mnt/lfs"
	info "Verifying mount point for $MOUNT_POINT..."
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
# FUNCTION: check_partition
# DESCRIPTION:
#     Checks if partition exists which searches the partition name in /proc/partitions
# PARAMETERS:
#     $1 - Partition Device
# RETURNS:
#     None
#================================================================
check_partition() {
	local PARTITION=$1
	if grep -q "$(basename "$PARTITION")" /proc/partitions; then
		success "Partition $PARTITION exists on host machine"
		return 0 
	else 
		error "Partition $PARTITION is either unavailable or does not exist on host machine"
		return 1
	fi
}

#================================================================
# FUNCTION: select_partition
# DESCRIPTION:
#     Selects the partition drive from block device of the host machine.
# PARAMETERS:
#     $1 - Partition Device
# RETURNS:
#     None
#================================================================
select_partition() {
	# Check if /dev/sda exists and is a valid block device.	
	BLOCK_DEVICE="/dev/sda"
	if lsblk | grep -q "^sda"; then
		info "$BLOCK_DEVICE exists and is a valid block device"
	else 
		error "$BLOCK_DEVICE does not exist and is not a valid block device"
		exit 1
	fi

	local PARTITION=$1

	if [ -z "$PARTITION" ]; then
		while true; do
			read -p "Specify the partition: " PARTITION

			if [[ -z "$PARTITION" ]]; then
				error "The partition is not selected. Please specify the partition."
			else 
				AVAILABLE_PARTITION=$(check_partition)		
				if [[ "$AVAILABLE_PARTITION" == 0 ]]; then
					info "Partition: $PARTITION"
					break
				else
					error "The partition you have provided is not available or does not exist on your host machine. Specify the partition that is available on your host machine."
				fi
			fi
		done
	fi

	return $PARTITION
}

#================================================================
# FUNCTION: select_swap_partition
# DESCRIPTION:
#     Selects the partition drive from block device of the host machine.
# PARAMETERS:
#     $1 - SWAP Partition Device
# RETURNS:
#     None
#================================================================
select_swap_partition() {
	local SWAP=$1
	while true; do
		read -p "Do you want to use SWAP partition during LFS installation (Y/n): " answer
		case "$answer" in 
			[Yy]* )
				info "Enabling SWAP partition."
				SWAP=true
				break
				;;
			[Nn]* )
				info "Disabling SWAP partition."
				SWAP=false
				break
				;;
			* )
				error "Please answer Y or n."
				;;
		esac
	done
	if [ -z "$SWAP_PARTITION" ]; then
		while true; do
			read -p "Specify the swap partition: " SWAP_PARTITION
		
			if [[ -z "$SWAP_PARTITION" ]]; then
				error "The swap partition is not selected. Please specify the swap partition."
			else 
				info "SWAP PARTITION: $SWAP_PARTITION"
				break
			fi
		done
	fi
}

#================================================================
# FUNCTION: mount
# DESCRIPTION:
#     Mounts LFS drive to a partition
# PARAMETERS:
#     $1 - Partition that it is mounted to.
# RETURNS:
#     None
#================================================================
mount() {
	local PARTITION=$1
	MOUNT_POINT_BOOLEAN=$(check_mount_point)

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
#     Unmounts LFS mount point from a partition of the host machine
# PARAMETERS:
#     $1 - Unmount flag argument
# RETURNS:
#     None
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

	MOUNT_POINT_BOOLEAN=$(check_mount_point)
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
#     None
#================================================================
chroot() {
	MOUNT_POINT_BOOLEAN=$(check_mount_point)
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
# FUNCTION: version_list
# DESCRIPTION:
#     Prints a list of LFS Release Build Version
# PARAMETERS:
#     $1 - Version
# RETURNS:
#     None
#================================================================
version_list() {
	echo "1. 9.0-rc1"
	echo "2. 9.0"
	echo "3. 9.1-rc1"
	echo "4. 9.1"
	echo "5. 10.0-rc1"
	echo "6. 10.0"
	echo "7. 10.1-rc1"
	echo "8. 10.1"
	echo "9. 11.0-rc1"
	echo "10. 11.0-rc2"
	echo "11. 11.0-rc3"
	echo "12. 11.0"
	echo "13. 11.1-rc1"
	echo "14. 11.1"
	echo "15. 11.2-rc1"
	echo "16. 11.3-rc1"
	echo "17. 11.3"
	echo "18. 12.0-rc1"
	echo "19. 12.0"
	echo "20. 12.1-rc1"
	echo "21. 12.1"
	echo "22. 12.2-rc1"
	echo "23. 12.2"
}

#================================================================
# FUNCTION: install
# DESCRIPTION:
#     Installs LFS Release Build Version
# PARAMETERS:
#     None
# RETURNS:
#     None
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
# FUNCTION: usage
# DESCRIPTION:
#     Prints default help information.
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
usage() {
	echo "Usage: ./LFSInstaller.sh [options]"
	exit 1
}

#================================================================
# FUNCTION: create_partition
# DESCRIPTION:
#     Creates partition for the following host system in order to install target system
# PARAMETERS:
#     None
# RETURNS:
#     None
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

	# Check if any tools were found
	if [ ${#selected_tools[@]} -eq 0 ]; then
		error "No disk management tools found."
		exit 1
	fi

	echo "Please select the tools you want to use from the following list (space-separated):"
	for i in "${!selected_tools[@]}"; do
		echo "$((i + 1)). ${selected_tools[1]}"
	done

	# Read user input for tool selection
	read -p "Enter the numbers of the disk management tools you want to select (e.g., 1 3 5): " -a user_input
	
	# Build the array of selected tools based on user input
	user_selected_tools=()
	for num in "${user_input[@]}"; do
		index=$((num - 1))
		if [ "$index" -ge 0 ] && [ "$index" -lt "${selected_tools[@]}" ]; then
			user_selected_tools+=("${selected_tools[index]}")
		else
			error "Invalid selection: $num"
		fi
	done

	# Display the selected tools 
	echo "You selected the following tools:"
	for tool in "${user_selected_tools[@]}"; do
		echo "- $tool"
	done

	# Review this section over here
	bash -c "sudo $tool; exec bash" &

	echo "Scan completed."
}

#================================================================
# FUNCTION: create_script
# DESCRIPTION:
#     Creates LFS installation script from user's preference
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
create_script() {
	if [ -z "$PARTITION" ]; then
		PARTITION=$(select_partition)
	fi

	if [ -z "$SWAP_PARTITION" ]; then
		if [ "$SWAP" = "true" ]; then
			SWAP_PARTITION=$(select_swap_partition)
		fi
	fi

	if [ -z "$VERSION" ]; then
		VERSION_ARRAY=("9.0-rc1" "9.0" "9.1-rc1" "9.1" "10.0-rc1" "10.0" "10.1-rc1" "10.1" "11.0-rc1"
			"11.0-rc2" "11.0-rc3" "11.0" "11.1-rc1" "11.2-rc1" "11.3-rc1" "12.0-rc1" "12.0" "12.1-rc1" 
			"12.1" "12.2-rc1" "12.2")

		match_found=0
		for ver in "${VERSION_ARRAY[@]}"; do
			if [ "$VERSION" = "$ver" ]; then
				match_found=1
				break
			fi
		done

		if [ "$match_found" -eq 0 ]; then
			version_list
			while true; do
				read -p "Enter the number corresponding to your choice (1-23): " -a answer
				case "$answer" in 
					1 )
						VERSION="9.0-rc1"
						break
						;;
					2 )
						VERSION="9.0"
						break
						;;
					3 )
						VERSION="9.1-rc1"
						break
						;;
					4 )
						VERSION="9.1"
						break
						;;
					5 )
						VERSION="10.0-rc1"
						break
						;;
					6 )
						VERSION="10.0"
						break
						;;
					7 )
						VERSION="10.1-rc1"
						break
						;;
					8 )
						VERSION="10.1"
						break
						;;
					9 )
						VERSION="11.0-rc1"
						break
						;;
					10 )
						VERSION="11.0-rc2"
						break
						;;
					11 )
						VERSION="11.0-rc3"
						break
						;;
					12 )
						VERSION="11.0"
						break
						;;
					13 )
						VERSION="11.1-rc1"
						break
						;;
					14 )
						VERSION="11.1"
						break
						;;
					15 )
						VERSION="11.2-rc1"
						break
						;;
					16 )
						VERSION="11.3-rc1"
						break
						;;
					17 )
						VERSION="11.3"
						break
						;;
					18 )
						VERSION="12.0-rc1"
						break
						;;
					19 )
						VERSION="12.0"
						break
						;;
					20 )
						VERSION="12.1-rc1"
						break
						;;
					21 )
						VERSION="12.1"
						break
						;;
					22 )
						VERSION="12.2-rc1"
						break
						;;
					23 )
						VERSION="12.2"
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
				echo "The LFS Installation script can be generated in two ways:"
				echo "1) Single file "
				echo "OR"
				echo "2) Phases (Multiple phases) by which will be made in four different shell scripts"
				echo "		2.1 - Preparing the Build"
				echo "		2.2 - Building the LFS Cross Toolchain and Temporary Tools"
				echo "		2.3 - Building the LFS System (Package Installation)"
				echo "		2.4 - System Configuration & Making the LFS System Bootable"

				# Prompt the user
				read -p "Would you like your script to be generated as a single file or in phases with multiple script (s/p): " answer
			
				# Convert the answer to lowercase for easier comparison
				case "$answer" in 
					[Ss]* )
						info "Install script will be generated as a single file"
						INSTALL_TYPE="SINGLE"
						break
						;;
					[Pp]* )
						info "Install script will be generated in phases"
						INSTALL_TYPE="PHASES"
						break
						;;
					* )
						error "You must select one of the following options"
						;;
				esac
			done
		fi
	fi

	if [ -z "$DISTRIB_CODENAME" ]; then
		while true; do
			read -p "Enter the name of the DISTRIB CODENAME: " DISTRIB_CODENAME
		
			if [[ -z "$DISTRIB_CODENAME" ]]; then
				error "The DISTRIB CODENAME is empty. Please try again."
			else 
				info "DISTRIB_CODENAME: $DISTRIB_CODENAME"
				break
			fi
		done
	fi

	if [ -z "$VERSION_CODENAME" ]; then
		while true; do
			read -p "Enter the name of the VERSION CODENAME: " VERSION_CODENAME
		
			if [[ -z "$VERSION_CODENAME" ]]; then
				error "The VERSION CODENAME is empty. Please try again."
			else 
				info "VERSION_CODENAME: $VERSION_CODENAME"
				break
			fi
		done
	fi

	./script_generator.sh 		\
		"$PARTITION" 		\
		"$SWAP_PARTITION" 	\
		"$DISTRIB_CODENAME" 	\
		"$VERSION_CODENAME" 	\
		"$INSTALL_TYPE" 	\
		"$VERSION" 		\
		"$NEOFETCH" 		\
		"$SWAP"			\

	if [[ -z "install.sh" ]]; then
		error "install.sh does not appear to be generated in your directory"
		exit 1	
	else 
		success "install.sh is generated in your directory"
		exit 0
	fi
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
  	printf "  ${BOLD}./LFSInstaller -c${ENDCOLOR}								Creates standard installation script in interactive mode\n"
  	printf "  ${BOLD}./LFSInstaller -c --partition='/dev/sda1' --install-type='PHASES'${ENDCOLOR}		Creates installation script, on the '/dev/sda1' partition, which will create shell script as phases.\n"
  	printf "  ${BOLD}./LFSInstaller -c --version='9.0'${ENDCOLOR}						Creates installation script that uses the release build version '9.0'\n"
	exit 0
}

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
		--version-list) version_list ;;
		-v|--version) VERSION="$2" shift ;;
		-p|--partition) PARTITION="$2" shift ;;
		-s|--swap) SWAP=true shift ;;
		-sp|--swap-partition) SWAP_PARTITION="$2" shift ;;
		-it|--install-type) INSTALL_TYPE="$2" shift ;;
		-vc|--version-codename) VERSION_CODENAME="$2" shift ;;
		-dc|--distrib-codename) DISTRIB_CODENAME="$2" shift ;;
		--create-partition) create_partition ;;
		-c|--create) create_script ;;
		-i|--install) install ;;
		*) error "Unknown parameter passed: "; exit 1 ;;
	esac
	shift
done
