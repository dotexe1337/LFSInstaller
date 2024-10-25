#!/bin/bash
#================================================================
# HEADER
#================================================================
# Script Name    : script_generator.sh
# Description    : Generates installation script from user's preference
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
# ANSI Color Code Escape Sequences                              #
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
# FUNCTION: display_menu
# DESCRIPTION:
#     Displays selection menu for choosing System software packages
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
display_menu() {
	echo "Please select basic system software packages to compile and install on chroot environment: "

	terminal_width=$(tput cols)
	
	counter_width=1
	option_width=20
	padding=1

	total_item_width=$((counter_width + padding + option_width))

	current_line_width=0
	counter=0

	for package in "${SYSTEM_PACKAGES[@]}"; do
		option_length=${#package}
		total_length=$((option_length + padding + ${#counter} + 2))

		if (( current_line_width + total_length > terminal_width )); then
			echo ""
			current_line_width=0
		fi

		printf "%-${counter_width}d %-${padding}s %-${option_width}s" "$counter" "." "$package"
		current_line_width=$((current_line_width + total_item_width))

		((counter++))
	done
	
	printf "\n"
	printf "\n"

	echo -n "Enter the number corresponding to your choice (Enter 80 to Quit): "
}

#================================================================
# FUNCTION: append_install_script
# DESCRIPTION:
#     Appends the content from target script to the main script.
# PARAMETERS:
#     $1 - Target Installation script
#     $2 - Target script
# RETURNS:
#     None
#================================================================
append_install_script() {
	local TARGET_INSTALLATION_SCRIPT=$1	
	local TARGET_SCRIPT=$2

	cat $TARGET_SCRIPT >> $TARGET_INSTALLATION_SCRIPT
	echo "" >> $TARGET_INSTALLATION_SCRIPT
	sudo rm -r $TARGET_SCRIPT
}

#================================================================
# FUNCTION: extract_html_to_shell
# DESCRIPTION:
#     Extracts HTML content to a target script, which appends to install script.
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
extract_html_to_shell() {
	local TARGET_DIRECTORY=$1
	local TARGET_HTML=$2
	local TARGET_INSTALLATION_SCRIPT=$3

	PACKAGE_EXTRACT=$(scan_package_name "$TARGET_DIRECTORY" "$TARGET_HTML")
	PACKAGE_EXTRACT_STATUS=$?
	if [ $PACKAGE_EXTRACT_STATUS -eq 0 ]; then
	 	extract_package "$TARGET_DIRECTORY/$TARGET_HTML"
		return
	fi

 	TARGET_SCRIPT=$(basename "$TARGET_HTML" .html).sh
	xmllint --html --xpath '//pre[@class="userinput"]' $TARGET_HTML 2>/dev/null | sed 's/<[^>]*>//g' > $TARGET_SCRIPT
	
	append_install_script "$TARGET_INSTALLATION_SCRIPT" "$TARGET_SCRIPT"
}

#================================================================
# FUNCTION: extract_package
# DESCRIPTION:
#     Extracts shell script commands from target HTML page to be 
#     appended to the install script
# PARAMETERS:
#     $1 - Target HTML
#     $2 - Target Installation Script
# RETURNS:
#     None
#================================================================
extract_package() {
         local TARGET_HTML=$1
         local TARGET_INSTALLATION_SCRIPT=$2

         RESULT=$(xmllint --html --xpath 'string(//h1[@class="sect1"])' $TARGET_HTML 2>/dev/null | sed 's/^[0-9. ]*//' | tr -s ' ' | sed 's/ - Pass 1//' | xargs)

 	 TARGET_SCRIPT=$(basename "$TARGET_HTML" .html).sh

         xmllint --html --xpath '//pre[@class="userinput"]' $TARGET_HTML 2>/dev/null | sed 's/<[^>]*>//g' > $TARGET_SCRIPT

	 result_lower=$(echo "$RESULT" | tr '[:upper:]' '[:lower:]')

         COMMAND="cd ../$result_lower"
         sed -i "1i $COMMAND" "$TARGET_SCRIPT"
         if [[ "$RESULT" == *"Pass 2"* ]]; then
		 sed -i '/^mkdir -v build/i rm -r build' $TARGET_SCRIPT
         fi

	 append_install_script "$TARGET_INSTALLATION_SCRIPT" "$TARGET_SCRIPT"
}

#================================================================
# FUNCTION: check_chroot
# DESCRIPTION:
#     Extracts selected package by the user 
# PARAMETERS:
#     $1 - Target Directory
#     $2 - Target HTML
#     $3 - Target Installation Script
# RETURNS:
#     None
#================================================================
install_selected_packages() {
	local TARGET_DIR="$1"
	local TARGET_HTML="$2"
	local TARGET_INSTALLATION_SCRIPT="$3"

	HEADER=$(xmllint --html --xpath 'string(//h1[@class="sect1"])' "$TARGET_DIR/$TARGET_HTML" 2>/dev/null | sed 's/^[0-9. ]*//' | tr -s ' ' | sed 's/ - Pass 1//' | sed 's/ - Pass 2//' | xargs)
        for page in ${pages[@]}; do
		for selected_packages in "${SELECTED_SOFTWARES[@]}"; do
			if [[ "$selected_package" == "$HEADER" ]]; then
				extract_html_to_shell "$TARGET_DIR" "$TARGET_DIR/$page" "$TARGET_INSTALLATION_SCRIPT"
			fi
		done
	done
}

#================================================================
# FUNCTION: scan_package_name
# DESCRIPTION:
#     Extracts h1 element from target HTML page to check if it matches
#     with any software packages
# PARAMETERS:
#     $1 - Target HTML page
# RETURNS:
#     1 - Returns false if both header and package variable are not 
#         close to match
#================================================================
scan_package_name() {
	local DIRECTORY="$1"
	local PAGE="$2"
	HEADER=$(xmllint --html --xpath 'string(//h1[@class="sect1"])' "$DIRECTORY/$PAGE" 2>/dev/null | sed 's/^[0-9. ]*//' | tr -s ' ' | sed 's/ - Pass 1//' | sed 's/ - Pass 2//' | xargs)
	if [[ "$HEADER" =~ [[:space:]] ]]; then
		read -ra spaces <<< "$HEADER"
		for package in "${SYSTEM_PACKAGES[@]}"; do
			for name in "${spaces[@]}"; do
				if [[ "$package" == "$name" ]]; then
					return 0
				fi
			done			
		done
	else 
		for package in "${SYSTEM_PACKAGES[@]}"; do
			if [[ "$package" == "$HEADER" ]]; then
				return 0
			fi
		done
	fi
	return 1
}

#================================================================
# FUNCTION: scan_chapter
# DESCRIPTION:
#     Loops through each HTML page of all chapters in order to 
#     evaluate its content.
# PARAMETERS:
#     $1 - Chapter Directory
# RETURNS:
#     None
#================================================================
scan_chapter() {
        local CHAPTER_DIR=$1
	local TARGET_INSTALLATION_SCRIPT=$2

        BASENAME_CHAPTER_DIR=$(basename "$CHAPTER_DIR")
        mapfile -t pages < <(awk '/<div class="toc">/,/<\/div>/' $CHAPTER_DIR/$BASENAME_CHAPTER_DIR.html | grep '<a href=' | sed -n 's/.*<a href="\([^"]*\)".*/\1/p')

    	CHAPTER_NUMBER=$(echo "$CHAPTER_DIR" | sed -E 's/.*chapter([0-9]{2}).*/\1/')
    	CHAPTER_NUMBER=$(printf "%d" "$CHAPTER_NUMBER")
	if [[ "$MAJOR_VERSION" == "9" ]]; then
		if [ "$CHAPTER_NUMBER" -e 6 ]; then
			install_selected_packages "$CHAPTER_DIR" "$pages" "$TARGET_INSTALLATION_SCRIPT"
			return			
		fi
	else
		if [ "$CHAPTER_NUMBER" -e 8 ]; then
			install_selected_packages "$CHAPTER_DIR" "$pages" "$TARGET_INSTALLATION_SCRIPT"
			return			
		fi
	fi

        for page in ${pages[@]}; do
                if grep -q '<pre[^>]*class="[^"]*userinput[^"]*"' "$CHAPTER_DIR/$page"; then
			extract_html_to_shell "$CHAPTER_DIR" "$CHAPTER_DIR/$page" "$TARGET_INSTALLATION_SCRIPT"
                fi
        done
}

#================================================================
# FUNCTION: progress
# DESCRIPTION:
#     Evaluates the progress state of the LFS installation.
# PARAMETERS:
#     $1 - Chapter Directory
#     $2 - Total number of chapter directories
# RETURNS:
#     None
#================================================================
progress() {
	local CHAPTER_DIR="$1"

    	CHAPTER_NUMBER=$(echo "$CHAPTER_DIR" | sed -E 's/.*chapter([0-9]{2}).*/\1/')
    	CHAPTER_NUMBER=$(printf "%d" "$CHAPTER_NUMBER")

	PROGRESS=$(( CHAPTER_NUMBER * 100 / TOTAL_CHAPTER_DIR ))

	echo "Progress: $PROGRESS"
}

#================================================================
# FUNCTION: generate_bash_script
# DESCRIPTION:
#     Generates standard bash script 
# PARAMETERS:
#     $1 - Target script
# RETURNS:
#     None
#================================================================
generate_bash_script() {
	local TARGET_SCRIPT=$1
	touch "$TARGET_SCRIPT"
	echo "#!/bin/bash" >> $TARGET_SCRIPT
	echo "" >> $TARGET_SCRIPT
}

#================================================================
# FUNCTION: filter_script
# DESCRIPTION:
#     Filters the script by manipulating the content of the script
#     to replace characters that can be read before executing
#     the script.
# PARAMETERS:
#     $1 - Target script
# RETURNS:
#     None
#================================================================
filter_script() {
	local TARGET_SCRIPT=$1
	sed -i 's/&gt;/>/g' $TARGET_SCRIPT
	sed -i 's/&lt;/</g' $TARGET_SCRIPT
	sed -i 's/&amp;/\&/g' $TARGET_SCRIPT
	sed -i "s|/dev/<xxx>|$PARTITION|g" $TARGET_SCRIPT

	if [[ -n "$SWAP_PARTITION" ]]; then
		sed -i "/mkswap/s|/dev/<yyy>|$SWAP_PARTITION|g" $TARGET_SCRIPT
		sed -i "/swap/s|/dev/<yyy>|$SWAP_PARTITION|g" $TARGET_SCRIPT
		sed -i "s|/dev/<zzz>|$SWAP_PARTITION|g" $TARGET_SCRIPT
	fi
	if [[ -z "$SWAP_PARTITION" ]]; then
		sed -i '/mkswap\|swapon/d' $TARGET_SCRIPT
	fi

	sed -i "/ext4/s|/dev/<yyy>|$PARTITION|g" $TARGET_SCRIPT
	sed -i "s|/dev/<yyy>|$PARTITION|g" $TARGET_SCRIPT
	sed -i "s/<fff>/ext4/g" $TARGET_SCRIPT

}

#================================================================
# FUNCTION: phase_script
# DESCRIPTION:
#     Returns the name of phase script based on the directory of LFS
#     installation
# PARAMETERS:
#     None 
# RETURNS:
#     None
#================================================================
phase_script() {
	local CHAPTER_DIR="$1"

        if [ "$CHAPTER_NUMBER" -ge 2 ] && [ "$CHAPTER_NUMBER" -lt 4 ]; then
                echo "phase1.sh"
        elif [ "$CHAPTER_NUMBER" -ge 5 ] [ "$CHAPTER_NUMBER" -lt 6 ]; then
                echo "phase2.sh"
        elif [ "$CHAPTER_NUMBER" -ge 7 ] && [ "$CHAPTER_NUMBER" -lt 8 ]; then
                echo "phase3.sh"
        elif [ "$CHAPTER_NUMBER" -ge 9 ]; then
                echo "phase4.sh"
        fi	
}

#================================================================
# FUNCTION: single
# DESCRIPTION:
#     Generates single LFS installation script
# PARAMETERS:
#     None 
# RETURNS:
#     None
#================================================================
single_installation() {
	TARGET_INSTALLATION_SCRIPT="install.sh"
	generate_bash_script "$TARGET_INSTALLATION_SCRIPT"

	for dir in $CHAPTER_DIRS; do
		progress "$dir" "$TOTAL_CHAPTER_DIRS"
		scan_chapter "$dir" "$TARGET_INSTALLATION_SCRIPT"
	done

	filter_script "$TARGET_INSTALLATION_SCRIPT"
}

#================================================================
# FUNCTION: phase
# DESCRIPTION:
#     Generates phase LFS installation scripts
# PARAMETERS:
#     None
# RETURNS:
#     None
#================================================================
phase_installation() {
	for dir in $CHAPTER_DIRS; do
		PHASE_INSTALLATION_SCRIPT=$(phase_installation_script "$dir")
		if [[ -n "$PHASE_INSTALLATION_SCRIPT" ]]; then
			if [[ ! -e "$PHASE_INSTALLATION_SCRIPT" ]]; then
				TARGET_INSTALLATION_SCRIPT="$PHASE_INSTALLATION_SCRIPT"
			fi
			progress "$dir"
			scan_chapter "$dir" "$TARGET_INSTALLATION_SCRIPT"
		fi
	done
}

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-
# ARGUMENTS
PARTITION=$1
SWAP_PARTITION=$2
DISTRIB_CODENAME=$3
VERSION_CODENAME=$4
INSTALL_TYPE=$5
VERSION=$6
SWAP=$7
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-

VERSION_DIRECTORY="$(pwd)/releases/$VERSION"
if [[ "$VERSION" == "12.2" ]]; then
	tar -xf $VERSION_DIRECTORY/LFS-$VERSION-SYSV.tar.xz
else
	tar -xf $VERSION_DIRECTORY/LFS-BOOK-$VERSION.tar.xz
fi

MAJOR_VERSION=$(echo "$VERSION" | cut -d '.' -f 1)
MAJOR_VERSION_DIRECTORY=""
if [[ "$MAJOR_VERSION" == "9" ]]; then
	MAJOR_VERSION_DIRECTORY="$(pwd)/$VERSION/chapter06"
else
	MAJOR_VERSION_DIRECTORY="$(pwd)/$VERSION/chapter08"
fi

CHAPTER_BASENAME=$(basename "$MAJOR_VERSION_DIRECTORY".html)

mapfile -t SYSTEM_PACKAGES < <(xmllint --html --xpath '//li[@class="sect1"]/a/text()' $MAJOR_VERSION_DIRECTORY/$CHAPTER_BASENAME 2>/dev/null)
FILTERED_SYSTEM_PACKAGES=()
for package in "${SYSTEM_PACKAGES[@]}"; do
    if [[ ! "$package" =~ (Introduction|Package Management|About Debugging Symbols|Stripping|Cleaning Up) ]]; then
        FILTERED_SYSTEM_PACKAGES+=("$package")
    fi
done
FILTERED_SYSTEM_PACKAGES+=("Quit")
SYSTEM_PACKAGES=("${FILTERED_SYSTEM_PACKAGES[@]}")

SELECTED_SOFTWARES=()
while true; do
	display_menu
	read -r choice
	if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 0 && choice < ${#SYSTEM_PACKAGES[@]} )); then
		if [[ "${SYSTEM_PACKAGES[$choice]}" == "Quit" ]]; then
			info "Quitting system package selection..."
			break
		fi
		SELECTED_SOFTWARES+=("${SYSTEM_PACKAGES[$choice]}")
		info "Selected System Softwares: "
	else 
		error "Invalid choice, please try again."
	fi
done

echo "Selected System software packages: "
for opt in "${SELECTED_SOFTWARES[@]}"; do
	echo "- $opt"
done

bold_info "Partition: $PARTITION"
if [[ -n $SWAP_PARTITION ]]; then
	bold_info "Swap Partition: $SWAP_PARTITION"
fi
bold_info "Distribution Codename: $DISTRIB_CODENAME"
bold_info "Version Codename: $VERSION_CODENAME"
bold_info "Install Type: $INSTALL_TYPE"
bold_info "Version: $VERSION"

echo "Generating $INSTALL_TYPE LFS installation..."

CHAPTER_DIRS=$(find "$(pwd)/$VERSION" -type d -regex '.*chapter[0-9][0-9].*' | sort)
TOTAL_CHAPTER_DIRS=$(echo "$CHAPTER_DIRS" | wc -l)

case $INSTALL_TYPE in
	"single")
		single_installation
		;;
	"phase")
		phase_installation
		;;
esac

sudo rm -r $VERSION/ 
