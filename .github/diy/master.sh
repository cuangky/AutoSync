#!/bin/bash
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
git_clone https://github.com/4IceG/luci-app-3ginfo op3ginfo  && mv -n op3ginfo/{3ginfo,luci-app-3ginfo} ./;rm -rf op3ginfo
git_clone https://github.com/koshev-msk/modemfeed && mv -n modemfeed/*/*/* ./ && rm -rf modemfeed
git_clone https://github.com/4IceG/luci-app-sms-tool smstool && mvdir smstool
git_clone https://github.com/4IceG/luci-app-modemband modemb  && mv -n modemb/* ./;rm -rf modemb
#git clone --depth 1 https://github.com/sirpdboy/luci-app-lucky
#git clone --depth 1 https://github.com/kiddin9/luci-app-dnsfilter
#git clone --depth 1 https://github.com/yaof2/luci-app-ikoolproxy
#git clone --depth 1 https://github.com/tty228/luci-app-serverchan
#git clone --depth 1 https://github.com/ntlf9t/luci-app-easymesh
#git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config
git clone --depth 1 https://github.com/jerrykuku/luci-app-vssr
#git clone --depth 1 https://github.com/sirpdboy/luci-app-advanced
#git clone --depth 1 https://github.com/sirpdboy/luci-theme-opentopd
#git clone --depth 1 https://github.com/jefferymvp/luci-app-koolproxyR
#git clone --depth 1 https://github.com/hubbylei/luci-app-clash
#git clone --depth 1 https://github.com/QiuSimons/openwrt-mos && mv -n openwrt-mos/*mosdns ./ ; rm -rf openwrt-mos
#git clone --depth 1 https://github.com/kenzok8/luci-theme-ifit ifit && mv -n ifit/luci-theme-ifit ./;rm -rf ifit
#git clone --depth 1 https://github.com/kenzok78/luci-theme-argonne
#git clone --depth 1 https://github.com/kenzok78/luci-app-argonne-config
git clone --depth 1 https://github.com/thinktip/luci-theme-neobird
#git clone --depth 1 -b lede https://github.com/pymumu/luci-app-smartdns
#git clone --depth 1 https://github.com/Huangjoe123/luci-app-eqos
git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb
#git clone --depth 1 -b master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic
git clone --depth 1 https://github.com/lisaac/luci-app-dockerman dockerman && mv -n dockerman/applications/* ./; rm -rf dockerman
git clone --depth 1 -b luci https://github.com/xiaorouji/openwrt-passwall passwall1 && mv -n passwall1/luci-app-passwall  ./; rm -rf passwall1
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 passwall2 && mv -n passwall2/luci-app-passwall2 ./;rm -rf passwall2
git clone --depth 1 https://github.com/ophub/luci-app-amlogic amlogic && mv -n amlogic/luci-app-amlogic ./;rm -rf amlogic
#git clone --depth 1 https://github.com/linkease/istore && mv -n istore/luci/* ./; rm -rf istore
#git clone --depth 1 https://github.com/linkease/nas-packages && mv -n nas-packages/network/services/ddnsto ./; rm -rf nas-packages
#git clone --depth 1 https://github.com/linkease/nas-packages-luci && mv -n nas-packages-luci/luci/luci-app-ddnsto ./; rm -rf nas-packages-luci
#git clone --depth 1 https://github.com/messense/aliyundrive-webdav aliyundrive && mv -n aliyundrive/openwrt/* ./ ; rm -rf aliyundrive
#git clone --depth 1 https://github.com/honwen/luci-app-aliddns
#git clone --depth 1 https://github.com/sbwml/luci-app-alist openwrt-alist && mv -n openwrt-alist/luci-app-alist ./ ; rm -rf openwrt-alist
#git clone --depth 1 https://github.com/Hyy2001X/AutoBuild-Packages && mv -n AutoBuild-Packages/luci-app-adguardhome ./; rm -rf AutoBuild-Packages
git clone --depth 1 https://github.com/vernesong/OpenClash && mv -n OpenClash/luci-app-openclash ./; rm -rf OpenClash
#git clone --depth 1 https://github.com/kenzok8/litte && mv -n litte/luci-theme-atmaterial_new litte/luci-theme-mcat litte/luci-theme-tomato ./ ; rm -rf litte
git clone --depth 1 https://github.com/kiddin9/openwrt-packages && mv -n openwrt-packages/luci-app-bypass openwrt-packages/luci-app-fileassistant ./ ; rm -rf openwrt-packages
git clone --depth 1 https://github.com/fw876/helloworld && mv -n helloworld/luci-app-ssr-plus helloworld/naiveproxy ./ ; rm -rf helloworld
git clone --depth 1 https://github.com/kenzok8/wall && mv -n wall/alist wall/gost wall/smartdns wall/adguardhome wall/filebrowser wall/lua-neturl wall/sagernet-core wall/tcping wall/redsocks2  wall/microsocks ./ ; rm -rf wall
git clone --depth 1 https://github.com/immortalwrt/luci && mv -n luci/applications/luci-app-gost luci/applications/luci-app-filebrowser ./ ; rm -rf luci
git clone --depth 1 https://github.com/kzer00/luci && mvdir luci
git clone --depth 1 https://github.com/kzer00/shc
git clone --depth 1 https://github.com/kenzok8/small && mvdir small
#svn export https://github.com/coolsnowwolf/luci/trunk/libs/luci-lib-ipkg
svn export https://github.com/gSpotx2f/trunk/luci-app-internet-detector
svn export https://github.com/gSpotx2f/trunk/internet-detector

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
s#ed -i "s/nas/services/g" `grep nas -rl luci-app-fileassistant`
s#ed -i "s/NAS/Services/g" `grep NAS -rl luci-app-fileassistant`

rm -rf ./*/.git & rm -rf ./*/.gitattributes
rm -rf ./*/.svn & rm -rf ./*/.github & rm -rf ./*/.gitignore
find -type f -name Makefile -exec sed -ri  's#mosdns[-_]neo#mosdns#g' {} \;

rm -rf create_acl_for_luci.err & rm -rf create_acl_for_luci.ok
rm -rf create_acl_for_luci.warn


exit 0

