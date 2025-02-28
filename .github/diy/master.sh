#!/bin/bash
#link1="https://github.com/koshev-msk/modemfeed/trunk/packages/net"

function git_sparse_clone() {
branch="$1" rurl="$2" localdir="$3" && shift 3
git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
cd $localdir
git sparse-checkout init --cone
git sparse-checkout set $@
mv -n $@ ../
cd ..
rm -rf $localdir
}

function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}


git clone https://github.com/rufengsuixing/luci-app-zerotier
#svn export https://github.com/v2rayA/v2raya-openwrt/trunk/luci-app-v2raya
git clone https://github.com/4IceG/luci-app-3ginfo op3ginfo  && mv -n op3ginfo/{3ginfo,luci-app-3ginfo} ./;rm -rf op3ginfo distributor
git clone --depth 1 -b main https://github.com/xiaorouji/openwrt-passwall passwall1 && mv -n passwall1/luci-app-passwall  ./; rm -rf passwall1
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 passwall2 && mv -n passwall2/luci-app-passwall2 ./;rm -rf passwall2
git clone --depth 1 https://github.com/fw876/helloworld && mv -n helloworld/{luci-app-ssr-plus,tuic-client,shadow-tls} ./ ; rm -rf helloworld
#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages passwall-packages && mv -n passwall-packages/{sing-box,shadowsocks-rust} ./; rm -rf passwall-packages
git clone https://github.com/koshev-msk/modemfeed && mv -n modemfeed/*/*/* ./ && rm -rf modemfeed
git clone https://github.com/4IceG/luci-app-3ginfo-lite
git clone https://github.com/4IceG/luci-app-lite-watchdog tes && mv tes/* ./ && rm -rf tes
git clone https://github.com/4IceG/luci-app-3ginfo
git clone https://github.com/4IceG/luci-app-atinout-mod
git clone https://github.com/4IceG/luci-app-sms-tool smstool && mvdir smstool
git clone https://github.com/4IceG/luci-app-modemband modemb  && mv -n modemb/* ./;rm -rf modemb
git clone https://github.com/derisamedia/luci-theme-alpha
#svn export https://github.com/nosignals/neko/branches/luci-app-neko/luci-app-neko
#svn export https://github.com/lynxnexy/packages/trunk/luci-theme-tano
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config
git clone --depth 1 https://github.com/thinktip/luci-theme-neobird
git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb
git clone https://github.com/gSpotx2f/luci-app-internet-detector 1 && mv -n 1/* ./ ;rm -rf 1 screenshots LISENCE README.MD
#git clone --depth 1 https://github.com/lisaac/luci-app-dockerman dockerman && mv -n dockerman/applications/* ./; rm -rf dockerman
git clone --depth 1 -b luci https://github.com/xiaorouji/openwrt-passwall passwall && mv -n passwall/luci-app-passwall ./;rm -rf passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 passwall2 && mv -n passwall2/luci-app-passwall2 ./;rm -rf passwall2
git clone --depth 1 https://github.com/ophub/luci-app-amlogic amlogic && mv -n amlogic/luci-app-amlogic ./;rm -rf amlogic
git clone --depth 1 https://github.com/vernesong/OpenClash && mv -n OpenClash/luci-app-openclash ./; rm -rf OpenClash
#git clone --depth 1 https://github.com/fw876/helloworld && mv -n helloworld/luci-app-ssr-plus helloworld/naiveproxy ./ ; rm -rf helloworld
#git clone --depth 1 https://github.com/kenzok8/wall && mv -n wall/alist wall/gost wall/smartdns wall/adguardhome wall/filebrowser wall/lua-neturl wall/sagernet-core wall/tcping wall/redsocks2  wall/microsocks ./ ; rm -rf wall
git clone --depth 1 https://github.com/helmiau/helmiwrt-packages && mvdir helmiwrt-packages
git clone --depth 1 https://github.com/kzer00/shc
git clone --depth 1 https://github.com/kenzok8/small && mvdir small
git clone --depth 1 https://github.com/gSpotx2f/luci-app-internet-detector

sed -i \
-e 's?include \.\./\.\./\(lang\|devel\)?include $(TOPDIR)/feeds/packages/\1?' \
-e 's?2. Clash For OpenWRT?3. Applications?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
-e 's/ca-certificates/ca-bundle/' \
*/Makefile

#sed -i 's/luci-lib-ipkg/luci-base/g' luci-app-store/Makefile
sed -i 's/+dockerd/+dockerd +cgroupfs-mount/' luci-app-docker*/Makefile
sed -i '$i /etc/init.d/dockerd restart &' luci-app-docker*/root/etc/uci-defaults/*
sed -i 's/+libcap /+libcap +libcap-bin /' luci-app-openclash/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-argon/' luci-app-argon-config/Makefile
#sed -i 's/\(+luci-compat\)/\1 +luci-theme-argonne/' luci-app-argonne-config/Makefile
#sed -i "s/nas/services/g" `grep nas -rl luci-app-fileassistant`
#sed -i "s/NAS/Services/g" `grep NAS -rl luci-app-fileassistant`

rm -rf ./*/.git & rm -rf ./*/.gitattributes
rm -rf ./*/.svn & rm -rf ./*/.github & rm -rf ./*/.gitignore
find -type f -name Makefile -exec sed -ri  's#mosdns[-_]neo#mosdns#g' {} \;

rm -rf create_acl_for_luci.err & rm -rf create_acl_for_luci.ok
rm -rf create_acl_for_luci.warn


exit 0

