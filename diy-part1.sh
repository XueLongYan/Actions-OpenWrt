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
#增加Nailink
git clone --recurse-submodules https://github.com/slobys/NaiLink.git /mnt/workdir/openwrt/package/luci-app-daed-router
make /mnt/workdir/openwrt/package/luci-app-daed-router/download V=s
cd /mnt/workdir/openwrt/package/luci-app-daed-router
# 激活并安装前端依赖
corepack enable
corepack prepare pnpm@10.24.0 --activate
pnpm install --frozen-lockfile

# 执行 OpenWrt 专用增量与前端构建脚本
pnpm build --filter=daed
python3 openwrt/prepare-wing.py wing

cd /mnt/workdir/openwrt

