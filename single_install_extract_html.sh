#!/bin/bash

echo "SINGLE-INSTALLATION-SCRIPT"

VERSION="$1"
MAJOR_VERSION="$2"
DIRECTORY="$3"
selected_softwares=("${@:4}")

echo "Version: $VERSION"
echo "Major Version: $MAJOR_VERSION"
echo "Directory: $DIRECTORY"
echo "Packages: ${selected_softwares[@]}"

function compile_package() {
	local DIRECTORY=$1
	local PACKAGE=$2

	echo "Compiling package for $PACKAGE on $DIRECTORY..."

	for file in "$DIRECTORY"*.html; do
		if [[ -f "$file" ]]; then
			base_name=$(basename "$file" .html)

			closest_match=""
			max_match_length=0

			base_name_lower=$(echo "$base_name" | tr '[:upper:]' '[:lower:]')
			package_lower=$(echo "$PACKAGE" | tr '[:upper:]' '[:lower:]')

			if [[ "$package_lower" == *"$base_name_lower"* ]]; then
				match_length=${#base_name_lower}
				if [[ $match_length -gt $max_match_length ]]; then
					closest_match="$PACKAGE"
					max_match_length=$match_length
				fi
			fi

			if [[ -n "$closest_match" ]]; then
				echo "Performing actions on single-installation script for $closest_match and file $file"
				if [[ "$MAJOR_VERSION" == "9" ]]; then
					xmllint --html --xpath '//pre[@class="userinput"]' "$DIRECTORY"$base_name.html 2>/dev/null | sed 's/<[^>]*>//g' > $base_name.sh
				else
					xmllint --html --xpath '//pre[@class="userinput"]' "$DIRECTORY"$base_name.html 2>/dev/null | sed 's/<[^>]*>//g' > $base_name.sh
				fi
			fi
		fi
	done
}

mkdir scripts

# Build Preparation
mkdir scripts/build_preparation
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter02/hostreqs.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/version.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter02/creatingfilesystem.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/filesystem.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter02/aboutlfs.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/aboutlfs.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter02/mounting.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/mounting.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter03/introduction.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/chapter3-introduction.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter04/creatingminlayout.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/creatingminlayout.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter04/addinguser.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/addinguser.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter04/settingenvironment.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/settingenvironment.sh

grep -hv '^#' scripts/build_preparation/version.sh scripts/build_preparation/filesystem.sh scripts/build_preparation/aboutlfs.sh scripts/build_preparation/mounting.sh scripts/build_preparation/chapter3-introduction.sh scripts/build_preparation/creatingminlayout.sh scripts/build_preparation/addinguser.sh scripts/build_preparation/settingenvironment.sh > install.sh


# Cross Toolchain
mkdir scripts/cross_toolchain
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/binutils-pass1.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/cross_toolchain/binutils-pass1.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/gcc-pass1.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/cross_toolchain/gcc-pass1.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/linux-headers.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/cross_toolchain/linux-headers.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/glibc.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/cross_toolchain/glibc.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/glibc-libstdc++.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/cross_toolchain/glibc-libstdc++.sh

# --- Cross Compiling temporary tools (Sub-menu)
mkdir scripts/temp_tools
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/m4.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/m4.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/ncurses.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/ncurses.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/bash.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/bash.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/coreutils.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/coreutils.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/diffutils.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/diffutils.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/file.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/file.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/findutils.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/findutils.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/gawk.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/gawk.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/'grep.html' 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/'grep.sh'

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/gzip.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/gzip.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/make.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/make.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/patch.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/patch.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/'sed.html' 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/'sed.sh'

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/tar.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/tar.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/xz.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/xz.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/binutils-pass2.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/binutils-pass2.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/gcc-pass2.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/gcc-pass2.sh

# Chroot
mkdir scripts/chroot
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/changingowner.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/changingowner.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/kernfs.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/kernfs.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/chroot.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/chroot.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/creatingdirs.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/creatingdirs.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/createfiles.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/createfiles.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/gettext.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/gettext.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/bison.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/bison.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/perl.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/perl.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/python.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/python.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/texinfo.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/texinfo.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/util-linux.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/util-linux.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/cleanup.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/cleanup.sh

for package in "${selected_softwares[@]}"; do
	compile_package "$DIRECTORY" "$package"
done

# System Configuration
mkdir scripts/system_configuration
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/bootscripts.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/bootscripts.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/network.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/network.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/usage.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/usage.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/locale.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/locale.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/inputrc.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/inputrc.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/etcshells.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/etcshells.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter10/fstab.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/fstab.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter10/kernel.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/kernel.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter10/grub.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/grub.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter10/theend.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/theend.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter11/reboot.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/reboot.sh
