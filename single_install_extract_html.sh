#!/bin/bash

# How can I do this for different versions of LFS release build

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

				cat $base_name.sh >> install.sh
			fi
		fi
	done
}

mkdir scripts

# Build Preparation
mkdir scripts/build_preparation
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter02/hostreqs.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/version.sh
cat scripts/build_preparation/version.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter02/creatingfilesystem.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/filesystem.sh
cat scripts/build_preparation/filesystem.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter02/aboutlfs.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/aboutlfs.sh
cat scripts/build_preparation/aboutlfs.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter02/mounting.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/mounting.sh
cat scripts/build_preparation/mounting.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter03/introduction.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/chapter3-introduction.sh
cat scripts/build_preparation/chapter3-introduction.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter04/creatingminlayout.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/creatingminlayout.sh
cat scripts/build_preparation/creatingminlayout.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter04/addinguser.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/addinguser.sh
cat scripts/build_preparation/addinguser.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter04/settingenvironment.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/build_preparation/settingenvironment.sh
cat scripts/build_preparation/settingenvironment.sh >> install.sh


# Cross Toolchain
mkdir scripts/cross_toolchain
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/binutils-pass1.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/cross_toolchain/binutils-pass1.sh
cat scripts/cross_toolchain/binutils-pass1.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/gcc-pass1.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/cross_toolchain/gcc-pass1.sh
cat scripts/cross_toolchain/gcc-pass1.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/linux-headers.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/cross_toolchain/linux-headers.sh
cat scripts/cross_toolchain/linux-headers.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/glibc.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/cross_toolchain/glibc.sh
cat scripts/cross_toolchain/glibc.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/glibc-libstdc++.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/cross_toolchain/glibc-libstdc++.sh
cat scripts/cross_toolchain/glibc-libstdc++.sh >> install.sh


# --- Cross Compiling temporary tools (Sub-menu)
mkdir scripts/temp_tools
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/m4.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/m4.sh
cat scripts/temp_tools/m4.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/ncurses.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/ncurses.sh
cat scripts/temp_tools/ncurses.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/bash.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/bash.sh
cat scripts/temp_tools/bash.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/coreutils.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/coreutils.sh
cat scripts/temp_tools/coreutils.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/diffutils.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/diffutils.sh
cat scripts/temp_tools/diffutils.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/file.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/file.sh
cat scripts/temp_tools/file.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/findutils.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/findutils.sh
cat scripts/temp_tools/findutils.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/gawk.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/gawk.sh
cat scripts/temp_tools/gawk.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/'grep.html' 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/'grep.sh'
cat scripts/temp_tools/'grep.sh' >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/gzip.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/gzip.sh
cat scripts/temp_tools/gzip.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/make.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/make.sh
cat scripts/temp_tools/make.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/patch.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/patch.sh
cat scripts/temp_tools/patch.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/'sed.html' 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/'sed.sh'
cat scripts/temp_tools/'sed.sh' >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/tar.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/tar.sh
cat scripts/temp_tools/tar.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/xz.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/xz.sh
cat scripts/temp_tools/xz.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/binutils-pass2.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/binutils-pass2.sh
cat scripts/temp_tools/binutils-pass2.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/gcc-pass2.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/temp_tools/gcc-pass2.sh
cat scripts/temp_tools/gcc-pass2.sh >> install.sh

# Chroot
mkdir scripts/chroot
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/changingowner.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/changingowner.sh
cat scripts/chroot/changingowner.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/kernfs.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/kernfs.sh
cat scripts/chroot/kernfs.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/chroot.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/chroot.sh
cat scripts/chroot/chroot.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/creatingdirs.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/creatingdirs.sh
cat scripts/chroot/creatingdirs.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/createfiles.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/creatingfiles.sh
cat scripts/chroot/creatingfiles.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/gettext.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/gettext.sh
cat scripts/chroot/gettext.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/bison.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/bison.sh
cat scripts/chroot/bison.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/perl.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/perl.sh
cat scripts/chroot/perl.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/python.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/python.sh
cat scripts/chroot/python.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/texinfo.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/texinfo.sh
cat scripts/chroot/texinfo.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/util-linux.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/util-linux.sh
cat scripts/chroot/util-linux.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/cleanup.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot/cleanup.sh
cat scripts/chroot/cleanup.sh >> install.sh

for package in "${selected_softwares[@]}"; do
	compile_package "$DIRECTORY" "$package"
done

# System Configuration
mkdir scripts/system_configuration
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/bootscripts.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/bootscripts.sh
cat scripts/system_configuration/bootscripts.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/network.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/network.sh
cat scripts/system_configuration/network.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/usage.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/usage.sh
cat scripts/system_configuration/usage.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/locale.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/locale.sh
cat scripts/system_configuration/locale.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/inputrc.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/inputrc.sh
cat scripts/system_configuration/inputrc.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/etcshells.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/etcshells.sh
cat scripts/system_configuration/etcshells.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter10/fstab.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/fstab.sh
cat scripts/system_configuration/fstab.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter10/kernel.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/kernel.sh
cat scripts/system_configuration/kernel.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter10/grub.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/grub.sh
cat scripts/system_configuration/grub.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter10/theend.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/theend.sh
cat scripts/system_configuration/theend.sh >> install.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter11/reboot.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/system_configuration/reboot.sh
cat scripts/system_configuration/reboot.sh >> install.sh
