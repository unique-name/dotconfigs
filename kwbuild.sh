#!/bin/bash
kwauth --url https://klocwork-ir4.devtools.intel.com:8090
make clean
../../build.sh prepare
source ../../set_env.script
kwinject -w --output "kwinject.out" make CROSS_COMPILE=$CROSS_COMPILE_1 uImage.gz -j16
#kwinject --update --output "kwinject.out" make CROSS_COMPILE=$CROSS_COMPILE_1 uImage.gz -j16
kwbuildproject --force --url https://klocwork-ir4.devtools.intel.com:8090/coh_sw-linux_kernel --tables-directory kw_tables kwinject.out
kwadmin --url https://klocwork-ir4.devtools.intel.com:8090 load coh_sw-linux_kernel kw_tables
