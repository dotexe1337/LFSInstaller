#!/bin/bash

# ----------
# Phase 2 
# ----------

# 4.3. Adding the LFS User
# As root, issue the following commands to add the new user:
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

# As the root user, run the following to clear lfs user's environment
[ ! -e /etc/bash.bashrc ] || mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE

# If you want to log in as lfs or switch to lfs from a non-root user (as opposed to switching to user lfs when logged in as root, which does not require the lfs user to have a password), you need to set a password for lfs. Issue the following command as the root user to set the password:
# passwd lfs

# Grant lfs full access to all the directories under $LFS by making lfs the owner:
chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac

chown lfs:lfs $LFS/sources/*

# Start a shell running as user lfs. This can be done by logging in as lfs on a virtual console or with the following substitute/switch user command:
su - lfs <<EOF

# 4.4. Setting Up the Environment
# Set up a good working environment by creating two new startup files for the bash shell. While logged in as user lfs, issue the following command to create a new .bash_profile:
cat > ~/.bash_profile << "END"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
END

# The new instance of the shell is a non-login shell, which does not read and execute the contents of the /etc/profile or .bash_profile files, but rather reads and executes the .bashrc file instead. Create the .bashrc file now:
cat > ~/.bashrc << "END"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE
END

# To ensure the environment is fully prepared for building the temporary tools, force the bash shell to read the new user profile:
#source ~/.bash_profile

# iii. General Compilation Instructions
export LFS=/mnt/lfs
export LC_ALL=POSIX
export LFS_TGT=$(uname -m)-lfs-linux-gnu
export PATH=$LFS/tools/bin:/usr/bin:/bin
export CONFIG_SITE=$LFS/usr/share/config.site

# ===========================================================================
# Chapter 5. Compiling a Cross-Toolchain
# ===========================================================================
# 5.2. Binutils-2.43.1 - Pass 1
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

# 5.3. GCC-14.2.0 - Pass 1
cd /mnt/lfs/sources/gcc-14.2.0

tar -xf ../mpfr-4.2.1.tar.xz
mv -v mpfr-4.2.1 mpfr
tar -xf ../gmp-6.3.0.tar.xz
mv -v gmp-6.3.0 gmp
tar -xf ../mpc-1.3.1.tar.gz
mv -v mpc-1.3.1 mpc

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac

mkdir -v build
cd       build

../configure                  \
    --target=$LFS_TGT         \
    --prefix=$LFS/tools       \
    --with-glibc-version=2.40 \
    --with-sysroot=$LFS       \
    --with-newlib             \
    --without-headers         \
    --enable-default-pie      \
    --enable-default-ssp      \
    --disable-nls             \
    --disable-shared          \
    --disable-multilib        \
    --disable-threads         \
    --disable-libatomic       \
    --disable-libgomp         \
    --disable-libquadmath     \
    --disable-libssp          \
    --disable-libvtv          \
    --disable-libstdcxx       \
    --enable-languages=c,c++

make
make install

cd ..
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include/limits.h

# 5.4. Linux-6.10.5 API Headers
cd /mnt/lfs/sources/linux-6.10.5

make mrproper

make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr

# 5.5. Glibc-2.40
cd /mnt/lfs/sources/glibc-2.40

case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
    ;;
esac

patch -Np1 -i ../glibc-2.40-fhs-1.patch

mkdir -v build
cd       build

# echo "rootsbindir=/usr/sbin" > configparms
echo "rootsbindir=$LFS/usr/sbin" > configparms

../configure                             \
      --prefix=$LFS/usr                  \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=4.19               \
      --with-headers=$LFS/usr/include    \
      --disable-nscd                     \
      libc_cv_slibdir=/usr/lib

make

make DESTDIR=$LFS install

sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd

echo 'int main(){}' | $LFS_TGT-gcc -xc -
readelf -l a.out | grep ld-linux

rm -v a.out

# 5.6. Libstdc++ from GCC-14.2.0
cd /mnt/lfs/sources/gcc-14.2.0

mkdir -v build
cd       build

../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=$LFS/usr               \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/14.2.0

make
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/lib{stdc++{,exp,fs},supc++}.la

# ===========================================================================
# Chapter 6. Cross Compiling Temporary Tools
# ===========================================================================
# 6.2. M4-1.4.19
cd /mnt/lfs/sources/m4-1.4.19
./configure --prefix=$LFS/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

# 6.3. Ncurses-6.5
cd /mnt/lfs/sources/ncurses-6.5

sed -i s/mawk// configure

mkdir build
pushd build
  ../configure
  make -C include
  make -C progs tic
popd

./configure --prefix=$LFS/usr            \
            --host=$LFS_TGT              \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-normal             \
            --with-cxx-shared            \
            --without-debug              \
            --without-ada                \
            --disable-stripping

make

make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
ln -sv libncursesw.so $LFS/usr/lib/libncurses.so
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
    -i $LFS/usr/include/curses.h

# 6.4. Bash-5.2.32
cd /mnt/lfs/sources/bash-5.2.32

./configure --prefix=$LFS/usr                  \
            --build=$(sh support/config.guess) \
            --host=$LFS_TGT                    \
            --without-bash-malloc              \
            bash_cv_strtold_broken=no

make
make DESTDIR=$LFS install
ln -sv bash $LFS/bin/sh

# 6.5. Coreutils-9.5
cd /mnt/lfs/sources/coreutils-9.5

./configure --prefix=$LFS/usr                 \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime

make

make DESTDIR=$LFS install

mv -v $LFS/usr/bin/chroot              $LFS/usr/sbin
mkdir -pv $LFS/usr/share/man/man8
mv -v $LFS/usr/share/man/man1/chroot.1 $LFS/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/'                    $LFS/usr/share/man/man8/chroot.8

# 6.6. Diffutils-3.10
cd /mnt/lfs/sources/diffutils-3.10

./configure --prefix=$LFS/usr \
            --host=$LFS_TGT \
            --build=$(./build-aux/config.guess)

make

make DESTDIR=$LFS install

# 6.7. File-5.45
cd /mnt/lfs/sources/file-5.45

mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd

./configure --prefix=$LFS/usr --host=$LFS_TGT --build=$(./config.guess)

make FILE_COMPILE=$(pwd)/build/src/file

make DESTDIR=$LFS install

rm -v $LFS/usr/lib/libmagic.la

# 6.8. Findutils-4.10.0
cd /mnt/lfs/sources/findutils-4.10.0

./configure --prefix=$LFS/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

# 6.9. Gawk-5.3.0
cd /mnt/lfs/sources/gawk-5.3.0

sed -i 's/extras//' Makefile.in

./configure --prefix=$LFS/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

# 6.10. Grep-3.11
cd /mnt/lfs/sources/grep-3.11

./configure --prefix=$LFS/usr   \
            --host=$LFS_TGT \
            --build=$(./build-aux/config.guess)

make

make DESTDIR=$LFS install

# 6.11. Gzip-1.13
cd /mnt/lfs/sources/gzip-1.13

./configure --prefix=$LFS/usr --host=$LFS_TGT

make

make DESTDIR=$LFS install

# 6.12. Make-4.4.1
cd /mnt/lfs/sources/make-4.4.1

./configure --prefix=$LFS/usr   \
            --without-guile \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

# 6.13. Patch-2.7.6
cd /mnt/lfs/sources/patch-2.7.6

./configure --prefix=$LFS/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

# 6.14. Sed-4.9
cd /mnt/lfs/sources/sed-4.9

./configure --prefix=$LFS/usr   \
            --host=$LFS_TGT \
            --build=$(./build-aux/config.guess)

make

make DESTDIR=$LFS install

# 6.15. Tar-1.35
cd /mnt/lfs/sources/tar-1.35

./configure --prefix=$LFS/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

# 6.16. Xz-5.6.2
cd /mnt/lfs/sources/xz-5.6.2

./configure --prefix=$LFS/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=$LFS/usr/share/doc/xz-5.6.2

make

make DESTDIR=$LFS install

rm -v $LFS/usr/lib/liblzma.la

# 6.17. Binutils-2.43.1 - Pass 2
cd /mnt/lfs/sources/binutils-2.43.1

sed '6009s/$add_dir//' -i ltmain.sh

mkdir -v build
cd       build

../configure                   \
    --prefix=$LFS/usr          \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --enable-gprofng=no        \
    --disable-werror           \
    --enable-64-bit-bfd        \
    --enable-new-dtags         \
    --enable-default-hash-style=gnu

make

make DESTDIR=$LFS install

rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes,sframe}.{a,la}

# 6.18. GCC-14.2.0 - Pass 2
cd /mnt/lfs/sources/gcc-14.2.0

tar -xf ../mpfr-4.2.1.tar.xz
mv -v mpfr-4.2.1 mpfr
tar -xf ../gmp-6.3.0.tar.xz
mv -v gmp-6.3.0 gmp
tar -xf ../mpc-1.3.1.tar.gz
mv -v mpc-1.3.1 mpc

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

sed '/thread_header =/s/@.*@/gthr-posix.h/' \
    -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in

mkdir -v build
cd       build

../configure                                       \
    --build=$(../config.guess)                     \
    --host=$LFS_TGT                                \
    --target=$LFS_TGT                              \
    LDFLAGS_FOR_TARGET=-L$PWD/$LFS_TGT/libgcc      \
    --prefix=$LFS/usr                              \
    --with-build-sysroot=$LFS                      \
    --enable-default-pie                           \
    --enable-default-ssp                           \
    --disable-nls                                  \
    --disable-multilib                             \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libsanitizer                         \
    --disable-libssp                               \
    --disable-libvtv                               \
    --enable-languages=c,c++

make 

make DESTDIR=$LFS install

ln -sv gcc $LFS/usr/bin/cc
EOF
