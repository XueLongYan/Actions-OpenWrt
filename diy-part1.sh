#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git daed https://github.com/daeuniverse/daed.git' >>feeds.conf.default
sed -i 's/--set=llvm.download-ci-llvm=true/--set=source.crates-io.replace-with=mirror \\\
        --set=source.mirror.registry=sparse+https:\/\/mirrors.bfsu.edu.cn\/crates.io-index\/ \\\
        --set=llvm.download-ci-llvm=false/' ./package/feeds/packages/rust/Makefile
