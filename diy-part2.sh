#!/bin/bash

# 后台IP：192.168.10.1
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 主机名：NbWrt
sed -i 's/OpenWrt/NbWrt/g' package/base-files/files/bin/config_generate

# 开启WiFi
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 2.4G名称：NbWrt-888
sed -i 's/ssid=OpenWrt/ssid=NbWrt-888/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 5G名称：NbWrt-888-5G
sed -i '/set wireless.default_radio0.ssid/a set wireless.default_radio1.ssid=NbWrt-888-5G' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# WiFi密码：123321123
sed -i 's/encryption=none/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/encryption=psk2/a set wireless.default_radio${devidx}.key=123321123' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 默认主题：argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 后台登录密码：password
sed -i 's/root:[^:]*:/root:$1$xyz$VqLrX7k4F2iGzQ1aB3c5:/g' package/base-files/files/etc/shadow
