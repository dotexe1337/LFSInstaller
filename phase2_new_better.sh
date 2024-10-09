#!/bin/bash

# ----------
# Phase 2 
# ----------

export LFS=/mnt/lfs

# 4.3. Adding the LFS User
# As root, issue the following commands to add the new user:
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

# As the root user, run the following to clear lfs user's environment
[ ! -e /etc/bash.bashrc ] || mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE

# Grant lfs full access to all the directories under $LFS by making lfs the owner:
chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac

for file in /mnt/lfs/sources/*.{xz,gz,bz2}; do tar -xf "$file" -C /mnt/lfs/sources; done

mkdir -pv $LFS/tools
chown -v lfs:lfs $LFS/tools
chown -v lfs:lfs $LFS/sources/*

# Start a shell running as user lfs. This can be done by logging in as lfs on a virtual console or with the following substitute/switch user command:
su - lfs << "EOF"
set +h
umask 022
export LFS=/mnt/lfs
export LC_ALL=POSIX
export LFS_TGT=$(uname -m)-lfs-linux-gnu
export PATH=/usr/bin
export PATH=$LFS/tools/bin:$PATH
export CONFIG_SITE=$LFS/usr/share/config.site

cd /mnt/lfs/sources/binutils-2.43.1

mkdir -v build
cd       build

../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --enable-gprofng=no \
             --disable-werror    \
             --enable-new-dtags  \
             --enable-default-hash-style=gnu

make
make install
EOF
