#!/bin/bash

# -----------
# Phase 1
# -----------

# ===========================================================================
# Chapter 2. Preparing the Host System
# ===========================================================================

# 2.2. Host System Requirements
cat > version-check.sh << "EOF"
#!/bin/bash
# A script to list version numbers of critical development tools

# If you have tools installed in other directories, adjust PATH here AND
# in ~lfs/.bashrc (section 4.4) as well.

LC_ALL=C 
PATH=/usr/bin:/bin

bail() { echo "FATAL: $1"; exit 1; }
grep --version > /dev/null 2> /dev/null || bail "grep does not work"
sed '' /dev/null || bail "sed does not work"
sort   /dev/null || bail "sort does not work"

ver_check()
{
   if ! type -p $2 &>/dev/null
   then 
     echo "ERROR: Cannot find $2 ($1)"; return 1; 
   fi
   v=$($2 --version 2>&1 | grep -E -o '[0-9]+\.[0-9\.]+[a-z]*' | head -n1)
   if printf '%s\n' $3 $v | sort --version-sort --check &>/dev/null
   then 
     printf "OK:    %-9s %-6s >= $3\n" "$1" "$v"; return 0;
   else 
     printf "ERROR: %-9s is TOO OLD ($3 or later required)\n" "$1"; 
     return 1; 
   fi
}

ver_kernel()
{
   kver=$(uname -r | grep -E -o '^[0-9\.]+')
   if printf '%s\n' $1 $kver | sort --version-sort --check &>/dev/null
   then 
     printf "OK:    Linux Kernel $kver >= $1\n"; return 0;
   else 
     printf "ERROR: Linux Kernel ($kver) is TOO OLD ($1 or later required)\n" "$kver"; 
     return 1; 
   fi
}

# Coreutils first because --version-sort needs Coreutils >= 7.0
ver_check Coreutils      sort     8.1 || bail "Coreutils too old, stop"
ver_check Bash           bash     3.2
ver_check Binutils       ld       2.13.1
ver_check Bison          bison    2.7
ver_check Diffutils      diff     2.8.1
ver_check Findutils      find     4.2.31
ver_check Gawk           gawk     4.0.1
ver_check GCC            gcc      5.2
ver_check "GCC (C++)"    g++      5.2
ver_check Grep           grep     2.5.1a
ver_check Gzip           gzip     1.3.12
ver_check M4             m4       1.4.10
ver_check Make           make     4.0
ver_check Patch          patch    2.5.4
ver_check Perl           perl     5.8.8
ver_check Python         python3  3.4
ver_check Sed            sed      4.1.5
ver_check Tar            tar      1.22
ver_check Texinfo        texi2any 5.0
ver_check Xz             xz       5.0.0
ver_kernel 4.19

if mount | grep -q 'devpts on /dev/pts' && [ -e /dev/ptmx ]
then echo "OK:    Linux Kernel supports UNIX 98 PTY";
else echo "ERROR: Linux Kernel does NOT support UNIX 98 PTY"; fi

alias_check() {
   if $1 --version 2>&1 | grep -qi $2
   then printf "OK:    %-4s is $2\n" "$1";
   else printf "ERROR: %-4s is NOT $2\n" "$1"; fi
}
echo "Aliases:"
alias_check awk GNU
alias_check yacc Bison
alias_check sh Bash

echo "Compiler check:"
if printf "int main(){}" | g++ -x c++ -
then echo "OK:    g++ works";
else echo "ERROR: g++ does NOT work"; fi
rm -f a.out

if [ "$(nproc)" = "" ]; then
   echo "ERROR: nproc is not available or it produces empty output"
else
   echo "OK: nproc reports $(nproc) logical cores are available"
fi
EOF

bash version-check.sh

sudo apt-get install -y bison
sudo apt-get install -y gawk
sudo apt-get install -y m4
sudo apt-get install -y texinfo

sudo rm /bin/sh
sudo ln -s /bin/bash /bin/sh
ls -l /bin/sh

# 2.4. Create a new Partition
# create partition here

# 2.5. Creating a File System on the Partition
# mkfs -v -t ext4 /dev/<xxx> --> Scan for the selected rive
## --> Use fdisk -l to retrieve info on which drive with the highest memory
## --> Or you can manually set it before hand to pick which drive for this
mkfs -v -t ext4 /dev/sda1
# mkswap /dev/<yyy> --> Scan for SWAP drive
mkswap /dev/sda2

# 2.6. Setting the $LFS Variable
export LFS=/mnt/lfs
echo $LFS

# 2.7. Mounting the New Partition
# Creating the mount point and mount the LFS file system with these commands:
mkdir -pv $LFS
mount -v -t ext4 /dev/sda1 $LFS
# Reaplce <xxx> with the name of the LFS partition.

# If you are using multiple partitions for LFS (e.g. one for / and another for /home), mount them like this:
mkdir -pv $LFS
mount -v -t ext4 /dev/sda1 $LFS
mkdir -v $LFS/home
mount -v -t ext4 /dev/sda2 $LFS/home

# Add this line to /etc/fstab
echo "/dev/sda1  /mnt/lfs ext4   defaults      1     1" >> /etc/fstab

# If you are using a swap partition, ensure that it is enabled using the swapon command:
/sbin/swapon -v /dev/sda2
# Replace <zzz> with the name of the swap partition.

# ===========================================================================
# Chapter 3. Packages and Patches
# ===========================================================================
# 3.1. Introduction
# To create this directory, execute the following command, as user root, before starting the download session:
mkdir -v $LFS/sources
# Make this directory writable and sticky. "Sticky" means that even if multiple users have write permission on a directory, only the owner of a file can delete the file within a sticky directory. The following command will enable the write and sticky modes:
chmod -v a+wt $LFS/sources

# To download all of the packages and patches by using wget-list-sysv as an input to the wget command, use:
wget --input-file=wget-list-sysv --continue --directory-prefix=$LFS/sources

# Additionally, starting with LFS-7.0, there is a separate file, md5sums, which can be used to verify that all the correct packages are available before proceeding. Place that file in $LFS/sources and run:
pushd $LFS/sources
  md5sum -c md5sums
popd

# If the packages and patches are downloaded as a non-root user, these files will be owned by the user. If you won't assign the same UID for your user in the LFS system, change the owners of these files to root now to avoid this issue:
# chown root:root $LFS/sources/*

# Extract all files to /mnt/lfs/osurces
for file in /mnt/lfs/sources/*.{xz,gz,bz2}; do tar -xf "$file" -C /mnt/lfs/sources; done

# ===========================================================================
# Chapter 4. Final Preparations
# ===========================================================================
# 4.2. Creating a Limited Directory Layout in the LFS Filesystem
mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac

# This cross-compiler will be installed in a special directory, to separate it from the other programs. Still acting as root, create that directory with this command:
mkdir -pv $LFS/tools

echo "Execute phase 2 for package installation..."
