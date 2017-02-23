#!/bin/bash
cross=/home/serge/intel-sdk/sdk/coh/toolchain/arc_gnu_2016.09_prebuilt_uclibc_le_archs_linux_install/bin/arc-linux-uclibc-
export ARCH=arc

kwauth --url https://klocwork-ir4.devtools.intel.com:8090
make clean
../../build.sh prepare
kwinject -w --output "kwinject.out" make CROSS_COMPILE=$cross uImage.gz -j16
kwbuildproject --force --url https://klocwork-ir4.devtools.intel.com:8090/coh_sw-linux_kernel --tables-directory kw_tables kwinject.out
kwadmin --url https://klocwork-ir4.devtools.intel.com:8090 load coh_sw-linux_kernel kw_tables
