#!/bin/bash

PARTITION="$1"
SWAP_PARTITION="$2"
DISTRIB_CODENAME="$3"
VERSION_CODENAME="$4"
INSTALL_TYPE="$5"
VERSION="$6"
NEOFETCH="$7"
SWAP="$8"

echo "Partition: $PARTITION"
echo "Swap Partition: $SWAP_PARTITION"
echo "Distribution Codename: $DISTRIB_CODENAME"
echo "Version Codename: $VERSION_CODENAME"
echo "Install Type: $INSTALL_TYPE"
echo "Version: $VERSION"
echo "Neofetch: $NEOFETCH"

echo "Initializing the script generation..."

tar -xf $(pwd)/releases/$VERSION/LFS-BOOK-$VERSION.tar.xz ./files/



# Scan for all of the packages of that version first
system_packages=()
echo "Select the system packages you want to install: "
echo "<PRINT ALL AVAILABLE SYSTEM PACKAGES FROM VERSION >"



