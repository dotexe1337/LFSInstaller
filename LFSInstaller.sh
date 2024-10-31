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
RED="\e[31m"
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
	if [[ "$VERBOSE" = true ]]; then
		local message=$1
		printf "${WHITE}[${ENDCOLOR}${CYAN}$current_time${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}[${ENDCOLOR}${GREEN}INFO${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}$1${ENDCOLOR}\n"
	fi
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
	if [[ "$VERBOSE" = true ]]; then
		local message=$1
		printf "${WHITE}[${ENDCOLOR}${CYAN}$current_time${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}[${ENDCOLOR}${BOLD_GREEN}INFO${ENDCOLOR}${WHITE}]${ENDCOLOR} ${BOLD_WHITE}$1${ENDCOLOR}\n"
	fi
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
	if [[ "$VERBOSE" = true ]]; then
		local message=$1
		printf "${WHITE}[${ENDCOLOR}${CYAN}$current_time${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}[${ENDCOLOR}${YELLOW}WARNING${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}$1${ENDCOLOR}\n"
	fi
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
	if [[ "$VERBOSE" = true ]]; then
		local message=$1
		printf "${WHITE}[${ENDCOLOR}${CYAN}$current_time${ENDCOLOR}${WHITE}]${ENDCOLOR} ${WHITE}[${ENDCOLOR}${BOLD_YELLOW}WARNING${ENDCOLOR}${WHITE}]${ENDCOLOR} ${BOLD_WHITE}$1${ENDCOLOR}\n"
	fi
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
# FUNCTION: check_file
# DESCRIPTION:
#     Checks if target file exists
# PARAMETERS:
#     None
# RETURNS:
#     0 - Target file exists on the host machine.
#     1 - Target file does not exist on the host machine.
#================================================================
check_file() {
	local $TARGET_FILE="$1"

	if [[ -e "$TARGET_FILE" ]]; then
		info "$TARGET_FILE exists in your host machine."
		return 0
	else 
		error "$TARGET_FILE does not exist on the host machine."
		return 1
	fi
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
	# MOUNT_POINT="/mnt/lfs"
	if grep -qs /mnt/lfs /proc/mounts; then
		# DEVICE=$(grep "$MOUNT_POINT" /proc/mounts | awk '{print $1}')
		return 0
	else
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
#     Mounts target partition to /mnt/lfs mount point
# PARAMETERS:
#     None
# RETURNS:
#     0 - Target partition is mounted to /mnt/lfs mount point.
#     1 - Target partition is failed mounting to /mnt/lfs mount point.
#================================================================
mount() {
	if verify_mount_point; then
		success "/mnt/lfs is already mounted."
		exit 0
	fi

	if [[ -z $PARTITION ]]; then
		PARTITION=$(select_partition)
		if [ $? -eq 1 ]; then
			error "Unavailable partition for mounting"
			exit 1
		fi
	fi


	if [ ! -d /mnt/lfs ]; then
		info "Creating /mnt/lfs directory..."	
		mkdir -pv /mnt/lfs
		if [ $? -ne 0 ]; then
			error "Failed to create /mnt/lfs directory."
			exit 1
		fi
	fi

	info "Mounting partition $PARTITION to /mnt/lfs..."
	sudo mount -v -t ext4 $PARTITION /mnt/lfs
	if [ $? -ne 0 ]; then
		error "Failed to mount $PARTITION to /mnt/lfs"
		exit 1
	fi

	info "Creating /mnt/lfs/home directory..."
	if [ ! -d /mnt/lfs/home ]; then
		info "Creating /mnt/lfs/home directory..."
		mkdir -v /mnt/lfs/home
		if [ $? -ne 0 ]; then
			error "Failed to create /mnt/lfs/home directory."
			exit 1
		fi
	fi	

	sudo mount -v -t ext4 $PARTITION /mnt/lfs/home
	if [ $? -ne 0 ]; then
		error "Failed to mount $PARTITION to /mnt/lfs/home"
		exit 1
	fi

	bold_info "Creating Virtual File System directories"
	virtual_file_system=("dev" "proc" "sys" "run")
	for vfs in "${virtual_file_system[@]}"; do
		if [ ! -d /mnt/lfs/$vfs ]; then
			info "Creating /mnt/lfs/$vfs directory..."
			mkdir -v /mnt/lfs/$vfs
			if [ $? -ne 0 ]; then
				error "Failed to create /mnt/lfs/$vfs directory."
				exit 1
			fi
		fi
	done

	bold_info "Mounting Virtual Kernel File Systems"
	sudo mount -v --bind /dev/ /mnt/lfs/dev
	if [ $? -ne 0 ]; then
		error "Failed to mount /dev to /mnt/lfs/dev"
		exit 1
	fi

	sudo mount -vt devpts devpts -o gid=5,mode=0620 /mnt/lfs/dev/pts
	if [ $? -ne 0 ]; then
		error "Failed to mount /dev/pts to /mnt/lfs/dev/pts"
		exit 1
	fi

	sudo mount -vt proc proc /mnt/lfs/proc
	if [ $? -ne 0 ]; then
		error "Failed to mount proc to /mnt/lfs/proc"
		exit 1
	fi

	sudo mount -vt sysfs sysfs /mnt/lfs/sys
	if [ $? -ne 0 ]; then
		error "Failed to mount sysfs to /mnt/lfs/sys"
		exit 1
	fi

	sudo mount -vt tmpfs tmpfs /mnt/lfs/run
	if [ $? -ne 0 ]; then
		error "Failed to mount tmpfs to /mnt/lfs/run"
		exit 1
	fi

	if [ -h /mnt/lfs/dev/shm ]; then
		install -v -d -m 1777 /mnt/lfs$(realpath /dev/shm)
		if [ $? -ne 0 ]; then
			error "Failed to create directory and installation on /mnt/lfs$(realpath /dev/shm) path"
			exit 1
		fi
	else
		sudo mount -vt tmpfs -o nosuid,nodev tmpfs /mnt/lfs/dev/shm
		if [ $? -ne 0 ]; then
			error "Failed to mount tmpfs to /mnt/lfs/dev/shm"
			exit 1
		fi
	fi

	if verify_mount_point; then
		success "$PARTITION mounted on /mnt/lfs"
		exit 0
	else
		error "Mounting Failed: $PARTITION is not mounted on /mnt/lfs"
		exit 1
	fi
}

#================================================================
# FUNCTION: unmount
# DESCRIPTION:
#     Unmounts target partition from LFS mount point.
# PARAMETERS:
#     None
# RETURNS:
#     0 - LFS mountpoint is successfully unmounted from partition.
#     1 - LFS mountpoint failed to be unmounted from partition.
#================================================================
unmount() {
	if [ ! verify_mount_point ]; then
		success "/mnt/lfs is already not mounted."
		exit 0
	fi

	bold_info "Unmounting Virtual File Systems"	
	info "Unmounting /mnt/lfs/dev/pts"
	umount -v /mnt/lfs/dev/pts
	if [ $? -ne 0 ]; then
		error "Failed to unmount /mnt/lfs/dev/pts"
		exit 1
	fi

	info "Unmounting /mnt/lfs/dev/shm"
	mountpoint -q /mnt/lfs/dev/shm && umount -v /mnt/lfs/dev/shm
	if [ $? -ne 0 ]; then
		error "Failed to unmount /mnt/lfs/dev/shm"
		exit 1
	fi

	info "Unmounting /mnt/lfs/dev"
	umount -v /mnt/lfs/dev
	if [ $? -ne 0 ]; then
		error "Failed to unmount /mnt/lfs/dev"
		exit 1
	fi

	info "Unmounting /mnt/lfs/run"
	umount -v /mnt/lfs/run
	if [ $? -ne 0 ]; then
		error "Failed to unmount /mnt/lfs/run"
		exit 1
	fi

	info "Unmounting /mnt/lfs/proc"
	umount -v /mnt/lfs/proc
	if [ $? -ne 0 ]; then
		error "Failed to unmount /mnt/lfs/proc"
		exit 1
	fi

	info "Unmounting /mnt/lfs/sys"
	umount -v /mnt/lfs/sys
	if [ $? -ne 0 ]; then
		error "Failed to unmount /mnt/lfs/sys"
		exit 1
	fi

	bold_info "Unmounting LFS filesystem"
	info "Unmounting /mnt/lfs/home"
	umount -v /mnt/lfs/home
	if [ $? -ne 0 ]; then
		error "Failed to unmount /mnt/lfs/home"
		exit 1
	fi

	info "Unmounting /mnt/lfs"
	umount -v /mnt/lfs
	if [ $? -ne 0 ]; then
		error "Failed to unmount /mnt/lfs"
		exit 1
	fi

	verify_mount_point
	if [ $? -eq 1 ]; then
		success "/mnt/lfs is successfully unmounted."
		exit 0
	else 
		error "/mnt/lfs failed to be unmounted."
		exit 1
	fi
}

#================================================================
# FUNCTION: chroot
# DESCRIPTION:
#     Enters chroot environment as an isolated machine
# PARAMETERS:
#     None
# RETURNS:
#     1 - LFS mount point is not mounted to partition
#================================================================
chroot() {
	verify_mount_point
	if [ $? -ne 0 ]; then
		error "/mnt/lfs is not mounted."	
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
	exit 0
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

	if [ "$INSTALL_TYPE" == "s" ] || [ "$INSTALL_TYPE" == "single" ]; then
		CHECK_COMMAND=$(check_file "install.sh")
		check_file "install.sh"
		if [ $CHECK_COMMAND -eq 0 ]; then
			info "Initializing single installation script..."
			sudo ./$TARGET_INSTALLATION_FILE
			exit 0
		fi
	fi

	if [ "$INSTALL_TYPE" == "p" ] || [ "$INSTALL_TYPE" == "phase" ]; then
		MISSING_PHASE_FILE=false
		PHASE_FILES=("phase1.sh" "phase2.sh" "phase3.sh" "phase4.sh")	
		for phase_file in ${PHASE_FILES[@]}; do
			CHECK_PHASE_COMMAND=$(check phase_file)	
			if [ $CHECK_PHASE_COMMAND -eq 1 ]; then
				error "$phase_file installation script does not exist in your phase installation"
				MISSING_PHASE_FILE=true
			fi
		done

		if [[ "$MISSING_PHASE_FILE" == "true" ]]; then
			error "Unable to proceed with installation due to missing phase installation script(s)."
			exit 1
		fi
	fi

	exit 1
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
	disk_tools=("cfdisk" "fdisk" "parted" "lsblk" "gparted" "gdisk")
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
        
		case $tool in 
			"fdisk")
				sudo "$tool" $PARTITION
				;;
		esac	

		if [[ ! "$tool" == "fdisk" ]]; then
			sudo "$tool"
		fi
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
			bold_info "Partition: $PARTITION"
		else
			error "Partition not selected"
			exit 1
		fi
	fi

	if [ -z "$SWAP_PARTITION" ]; then
		SWAP=false
		while true; do
			read -p "Do you want to use swap partition during LFS installation (Y/n): " answer
			case "$answer" in 
				[Yy]* )
					SWAP=true
					break
					;;
				[Nn]* )
					break
					;;
				* )
					error "Please answer Y or n."
					;;
			esac
		done

		if [ "$SWAP" = true ]; then
			SWAP_PARTITION=$(select_partition)
			if [ $? -eq 0 ]; then
				bold_info "Swap Partition: $SWAP_PARTITION"
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
			bold_info "Version: $VERSION"
		fi
	fi

	if [ -z "$INSTALL_TYPE" ]; then
		INSTALL_VALUES=("single" "phase")
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
						bold_info "Installation Type: Single Script Installation"
						INSTALL_TYPE="single"
						break
						;;
					2 )
						bold_info "Installation Type: Phase-by-Phase Installation"
						INSTALL_TYPE="phase"
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
				error "The distribution codename is empty. Please try again."
			else 
				bold_info "Distribution Codename: $distrib_codename"
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
				error "The version codename is empty. Please try again."
			else 
				bold_info "Version Codename: $version_codename"
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
		"$VERSION" 		\
		"$VERBOSE" 		

	exit 0
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
  	printf "  ${BOLD}--verbose${ENDCOLOR}									Enable verbose mode\n"
	echo " "
	echo "Examples:"
  	printf "  ${BOLD}./LFSInstaller -m${ENDCOLOR}								Initialize mounting procedure\n"
	printf "  ${BOLD}./LFSInstaller -c${ENDCOLOR}								Creates standard installation script in interactive mode (if no values have passed)\n"
  	printf "  ${BOLD}./LFSInstaller --partition=/dev/sda1 --install-type=phase -c${ENDCOLOR}			Creates installation script, on the /dev/sda1 partition, which will create shell script as phases.\n"
  	printf "  ${BOLD}./LFSInstaller --version=9.0 -c${ENDCOLOR}						Creates installation script that uses the release build version 9.0\n"
	exit 0
}

VERSION_LIST=("9.0-rc1" "9.0" "9.1-rc1" "9.1" "10.0-rc1" "10.0" "10.1-rc1" "10.1" "11.0-rc1"
	"11.0-rc2" "11.0-rc3" "11.0" "11.1-rc1" "11.1" "11.2-rc1" "11.3-rc1" "11.3" "12.0-rc1" "12.0" "12.1-rc1" 
	"12.1" "12.2-rc1" "12.2")

PARTITION=""
SWAP_PARTITION=""
VERSION_CODENAME=""
DISTRIB_CODENAME=""
INSTALL_TYPE=""
VERSION=""
VERBOSE=false

while [[ "$#" -gt 0 ]]; do
	case "$1" in
		-u|--usage) usage ;;
		-h|--help) help ;;
		--version-list) display_version_list ;;
		-v=*|--version=*) VERSION="${1#*=}" ;;
		-p=*|--partition=*) PARTITION="${1#*=}" ;;
		-sp=*|--swap-partition=*) SWAP_PARTITION="${1#*=}" ;;
		-it=*|--install-type=*) INSTALL_TYPE="${1#*=}" INSTALL_TYPE="${INSTALL_TYPE,,}";;
		-vc=*|--version-codename=*) VERSION_CODENAME="${1#*=}" ;;
		-dc|--distrib-codename) DISTRIB_CODENAME="${1#*=}" ;;
		--create-partition) create_partition ;;
		-m|--mount) mount ;;
		-um|--unmount) unmount ;;
		--chroot) chroot ;;
		-c|--create) create_script ;;
		-i|--install) install ;;
		--verbose|--verbose) VERBOSE=true ;;
		*) error "Unknown parameter passed: $1"; exit 1 ;;
	esac
	shift
done

if [ -n "$VERSION" ]; then
	match=false
	for version in ${VERSION_LIST[@]}; do
		if [[ "$VERSION" == "$version" ]]; then
			match=true	
			break
		fi	
	done
	if [[ "$match" = false ]]; then
		error "Version $VERSION does not match with any of the list of LFS release builds" 
		exit 1
	fi
fi

if [[ -n "$PARTITION" ]]; then
	AVAILABLE_PARTITION=$(verify_partition "$PARTITION")
	if [ $? -eq 1 ]; then
		error "Partition $PARTITION does not exist on the host machine."
		exit 1
	fi
fi

if [[ -n "$SWAP_PARTITION" ]]; then
	AVAILABLE_PARTITION=$(verify_partition "$SWAP_PARTITION")
	if [ $? -eq 1 ]; then
		error "Swap Partition $SWAP_PARTITION does not exist on the host machine."
		exit 1
	fi
fi

if [[ -n "$INSTALL_TYPE" ]]; then
	case "$INSTALL_TYPE" in
		"s"|"single"|"p"|"phase")
			;;
		*)
			error "Unknown Installation Type Parameter: $INSTALL_TYPE"
			exit 1
			;;
	esac
fi

if [[ -n "$VERSION_CODENAME" ]]; then
	info "Version Codename: $VERSION_CODENAME"
fi

if [[ -n "$DISTRIB_CODENAME" ]]; then
	info "Distrib Codename: $DISTRIB_CODENAME"
fi
