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
# FUNCTION: usage
# DESCRIPTION:
#     Prints default usage information.
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
usage() {
	echo "Linux-From-Scratch Installer"
  	echo " "
	echo "Usage: ./LFSInstaller.sh [options]"
	exit 0
}

#================================================================
# FUNCTION: mount
# DESCRIPTION:
#     Mounts LFS drive
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
mount() {
	if grep -qs /mnt/lfs /proc/mounts; then
		echo "Mounted /dev/sda1 to $LFS"
	else
		echo "Currently not mounted."
		echo "Proceeding to mount /dev/sda1 to $LFS."
		mkdir -pv $LFS
		mount -v -t ext4 /dev/sda1 $LFS
		mkdir -v $LFS/home
		mount -v -t ext4 /dev/sda1 $LFS/home
		echo "Mounted /dev/sda1 to $LFS."
	fi
}

#================================================================
# FUNCTION: unmount
# DESCRIPTION:
#     Unmounts LFS drive
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
unmount() {
	bold_info "Unmounting the virtual file systems"	
	umount -v $LFS/dev/pts
	mountpoint -q $LFS/dev/shm && umount -v $LFS/dev/shm
	umount -v $LFS/dev
	umount -v $LFS/run
	umount -v $LFS/proc
	umount -v $LFS/sys

	bold_info "Unmounting the LFS file system"	
	umount -v $LFS/home
	umount -v $LFS
}

#================================================================
# FUNCTION: force_unmount
# DESCRIPTION:
#     Unmount by force of all LFS drives
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
unmount() {
	bold_info "Force Unmounting the virtual file systems"	
	umount -f $LFS/dev/pts
	mountpoint -q $LFS/dev/shm && umount -f $LFS/dev/shm
	umount -f $LFS/dev
	umount -f $LFS/run
	umount -f $LFS/proc
	umount -f $LFS/sys

	bold_info "Force Unmounting the LFS file system"	
	umount -f $LFS/home
	umount -f $LFS
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
# FUNCTION: version
# DESCRIPTION:
#     Selects LFS Release Build version before installation
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
version() {
	echo "test"
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
	# Check if /dev/sda exists and is a valid block device.	
	BLOCK_DEVICE="/dev/sda"
	if lsblk | grep -q "^sda"; then
		info "$BLOCK_DEVICE exists and is a valid block device"
	else 
		error "$BLOCK_DEVICE exists and is a valid block device"
		exit 1
	fi

	# Specify the partition (e.g., /dev/sda1 or /dev/sda) if it is not selected
	if [ -z "$PARTITION" ]; then
		while true; do
			read -p "Specify the partition" PARTITION
		
			if [[ -z "$PARTITION" ]]; then
				error "The partition is not selected. Please specify the partition."
			else 
				info "PARTITION: $PARTITION"
				break
			fi
		done
	fi

	while true; do
		# Prompt the user
		read -p "Do you want to use SWAP partition during LFS installation (Y/n):" answer
	
		# Convert the answer to lowercase for easier comparison
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
			read -p "Specify the swap partition" SWAP_PARTITION
		
			if [[ -z "$SWAP_PARTITION" ]]; then
				error "The swap partition is not selected. Please specify the swap partition."
			else 
				info "SWAP PARTITION: $SWAP_PARTITION"
				break
			fi
		done
	fi

	if [ -z "$VERSION" ]; then
		echo "Please select the LFS Release Build Version: "
		echo "1. LFS 9.0-rc1 Release"
		echo "2. LFS Stable Version 9.0 Release"
		echo "3. LFS 9.1-rc1 Release"
		echo "4. LFS Stable Version 9.1 Release"
		echo "5. LFS-10.0-rc1 Release"
		echo "6. LFS Stable Version 10.0 Release"
		echo "7. LFS-10.1-rc1 Release"
		echo "8. LFS Stable Version 10.1 Release"
		echo "9. LFS-11.0-rc1 Release"
		echo "10. LFS-11.0-rc2 Release"
		echo "11. LFS-11.0-rc3 Release"
		echo "12. LFS-11.0 Release"
		echo "13. LFS-11.1-rc1 Release"
		echo "14. LFS Stable Version 11.1 Release"
		echo "15. LFS-11.2-rc1 Release"
		echo "16. LFS-11.3-rc1 Release"
		echo "17. LFS-11.3 Release"
		echo "18. LFS-12.0-rc1 Release"
		echo "19. LFS-12.0 Release"
		echo "20. LFS-12.1-rc1 Release"
		echo "21. LFS-12.1 Release"
		echo "22. LFS-12.2-rc1 Release"
		echo "23. LFS-12.2 Release"

		while true; do
			# Prompt the user
			read -p "Enter the number corresponding to your choice (1-23): " answer
		
			# Convert the answer to lowercase for easier comparison
			case "$choice" in 
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

			info "LFS Release Build Version: $VERSION"
		done
	fi

	while true; do
		echo "The LFS Installation script can be generated in two ways:"
		echo "1) Single file "
		echo "OR"
		echo "2) Phases (Multiple phases)"
		echo "		2.1 - Preparing the Build"
		echo "		2.2 - Building the LFS Cross Toolchain and Temporary Tools"
		echo "		2.3 - Building the LFS System (Package Installation)"
		echo "		2.4 - System Configuration & Making the LFS System Bootable"

		# Prompt the user
		read -p "Would you like your script to be generated as a single file or in phases with multiple script (s/p):" answer
	
		# Convert the answer to lowercase for easier comparison
		case "$answer" in 
			[Yy]* )
				info "Install script will be generated as a single file"
				INSTALL_TYPE="SINGLE"
				break
				;;
			[Nn]* )
				info "Install script will be generated in phases"
				INSTALL_TYPE="PHASES"
				break
				;;
			* )
				error "You must select one of the following options"
				;;
		esac
	done

	while true; do
		read -p "Enter the name of the DISTRIB CODENAME" DISTRIB_CODENAME
	
		if [[ -z "$DISTRIB_CODENAME" ]]; then
			error "The DISTRIB CODENAME is empty. Please try again."
		else 
			info "DISTRIB_CODENAME: $DISTRIB_CODENAME"
			break
		fi
	done

	while true; do
		read -p "Enter the name of the VERSION CODENAME" VERSION_CODENAME
	
		if [[ -z "$VERSION_CODENAME" ]]; then
			error "The VERSION CODENAME is empty. Please try again."
		else 
			info "VERSION_CODENAME: $VERSION_CODENAME"
			break
		fi
	done

	while true; do
		# Prompt the user
		read -p "Would you like to download and compile Neofetch at the end of the Installation? (Y/n):" answer
	
		# Convert the answer to lowercase for easier comparison
		case "$answer" in 
			[Yy]* )
				NEOFETCH=true
				break
				;;
			[Nn]* )
				NEOFETCH=false
				break
				;;
			* )
				error "You must select one of the following options"
				;;
		esac
	done

	# Success
	#echo "Your script has been successfully created."
	#echo "Before starting your installation, it is essential that you view your installation script to display how it installs your system"
	#echo "If you are satisfied with the current script, you can initialize by typing ./LFSInstaller --install or go to the directory and type the following"
	#echo "It is important you must become root in order to perform tasks as a super user"
	#echo ""
	#echo "sudo su"
	#echo "sudo chmod +x install.sh"
	#echo "./install.sh"
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
	echo ""
	echo "Usage: ./LFSInstaller.sh [options]"
	echo "It is recommended to run this as a root user"
	echo ""
	echo "Options:"
  	printf "  ${BOLD}--usage${ENDCOLOR}						Show usage information\n"
	printf "  ${BOLD}-h, --help${ENDCOLOR}						Show help message\n"
	printf "  ${BOLD}-v, --version${ENDCOLOR}						Specifies LFS Release Build Version\n"
	printf "  ${BOLD}--swap${ENDCOLOR}						Specifies SWAP partition\n"
	printf "  ${BOLD}-p, --partition${ENDCOLOR}						Specifies main partition\n"
	printf "  ${BOLD}--create-partition${ENDCOLOR}						Specifies new device blocks of partition\n"
	printf "  ${BOLD}-c, --create${ENDCOLOR}						Generates installation script\n"
	printf "  ${BOLD}-i, --install${ENDCOLOR}						Initializes LFS Installation\n"
	echo " "
	exit 0
}

PARTITION=""
SWAP_PARTITION=""
DISTRIB_CODENAME=""
VERSION_CODENAME=""
INSTALL_TYPE=""
VERSION=""
NEOFETCH=false
SWAP=false

while [[ "$#" -gt 0 ]]; do
	case $1 in
		-u|--usage) usage ;;
		-h|--help) help ;;
		-v|--version) VERSION="$2" shift ;;
		--swap) SWAP_PARTITION="$2" shift ;;
		-p|--partition) PARTITION="$2" shift ;;
		--create-partition) create_partition ;;
		-c|--create) create_script ;;
		-i|--install) install ;;
		*) error "Unknown parameter passed: "; exit 1 ;;
	esac
	shift
done
