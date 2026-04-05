#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改后台IP为 192.168.10.1
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 修改主机名
sed -i 's/OpenWrt/NbWrt/g' package/base-files/files/bin/config_generate

# 启用WiFi
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 设置2.4G WiFi名称
sed -i 's/ssid=OpenWrt/ssid=NbWrt-888/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 设置5G WiFi名称
sed -i '/set wireless.default_radio1/a set wireless.default_radio1.ssid=NbWrt-888-5G' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 设置WiFi加密方式为WPA2
sed -i 's/encryption=none/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 设置WiFi统一密码 123321123
sed -i '/encryption=psk2/a set wireless.default_radio${devidx}.key=123321123' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 设置默认主题为 luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
