#!/bin/bash

VERSION="$1"
PACKAGES="$2" # Retrieve array

# ---- EXTRACTION PHASE ----
# ---- Single installation script ----

# --- Extract point ---
mkdir scripts

# Build Preparation
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter02/hostreqs.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/version.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter02/creatingfilesystem.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/filesystem.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter02/aboutlfs.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/aboutlfs.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter02/mounting.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/mounting.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter03/introduction.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chapter3-introduction.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter04/creatingminlayout.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/creatingminlayout.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter04/addinguser.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/addinguser.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter04/settingenvironment.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/settingenvironment.sh

# Cross Toolchain
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/binutils-pass1.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/binutils-pass1.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/gcc-pass1.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/gcc-pass1.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/linux-headers.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/linux-headers.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/glibc.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/glibc.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter05/glibc-libstdc++.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/glibc-libstdc++.sh

# --- Cross Compiling temporary tools (Sub-menu)
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/m4.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/m4.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/ncurses.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/ncurses.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/bash.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/bash.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/coreutils.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/coreutils.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/diffutils.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/diffutils.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/file.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/file.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/findutils.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/findutils.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/gawk.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/gawk.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/'grep.html' 2>/dev/null | sed 's/<[^>]*>//g' > scripts/'grep.sh'

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/gzip.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/gzip.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/make.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/make.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/patch.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/patch.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/'sed.html' 2>/dev/null | sed 's/<[^>]*>//g' > scripts/'sed.sh'

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/tar.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/tar.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/xz.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/xz.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/binutils-pass2.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/binutils-pass2.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter06/gcc-pass2.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/gcc-pass2.sh

# Chroot
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/changingowner.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/changingowner.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/kernfs.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/kernfs.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/chroot.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/chroot.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/creatingdirs.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/creatingdirs.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/createfiles.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/createfiles.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/gettext.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/gettext.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/bison.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/bison.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/perl.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/perl.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/python.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/python.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/texinfo.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/texinfo.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/util-linux.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/util-linux.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter07/cleanup.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/cleanup.sh

# --- Select basic system package (Building the LFS System)
# <Insert the following name of the system itself>


# System Configuration
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/bootscripts.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/bootscripts.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/network.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/network.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/usage.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/usage.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/locale.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/locale.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/inputrc.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/inputrc.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/etcshells.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/etcshells.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter09/etcshells.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/etcshells.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter10/fstab.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/fstab.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter10/kernel.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/kernel.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter10/grub.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/grub.sh

# --- THE END
xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter10/theend.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/theend.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter10/theend.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/theend.sh

xmllint --html --xpath '//pre[@class="userinput"]' $VERSION/chapter11/reboot.html 2>/dev/null | sed 's/<[^>]*>//g' > scripts/reboot.sh

# -- IMPLEMENTATION PHASE --
