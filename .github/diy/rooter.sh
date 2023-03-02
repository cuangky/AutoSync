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
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter/0basicapps && mvdir 0basicapps
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter/0basicsupport && mvdir 0basicsupport
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter/0drivers && mvdir 0drivers
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter/0optionalapps && mvdir 0optionalapps
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter/0routerspecfic && mvdir 0routerspecfic
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter/0splash && mvdir 0splash
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter/0themes && mvdir 0themes
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter/0wifi && mbdir 0wifi
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter-builds && mv -n rooter-builds/0protocols rooter-builds/ext-huasifei rooter-builds/ext-huasifei16 rooter-builds/ext-rooter-lite rooter-builds/ext-rooter16 rooter-builds/ext-rooter4 rooter-builds/ext-rooter8-vpn rooter-builds/ext-rooterbcm16 rooter-builds/ext-axt1800 ./ ; rm -rf rooter-builds 
#svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter && mv -n rooter/0basicapps rooter/0basicsupport rooter/0drivers rooter/0optionalapps rooter/0routerspecfic rooter/0splash rooter/0themes rooter/0wifi rooter/ext-rooter-basic ./ ; rm -rf rooter
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter-custom-builds/Parts_16 && mv -n Parts_16/ext-custom-level016 Parts_16/ext-custom-level116 Parts_16/ext-custom-level216 Parts_16/ext-custom-level316 Parts_16/ext-custom-level416 Parts_16/ext-custom-level516 ./ ;rm -rf Parts_16
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter-custom-builds/arc-storage
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter-custom-builds/ext-custom-basic
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter-custom-builds/ext-custom-level0
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter-custom-builds/ext-custom-level1
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter-custom-builds/ext-custom-level2
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter-custom-builds/ext-custom-level3
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter-custom-builds/ext-custom-level4
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter-custom-builds/ext-custom-level5
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter-custom-builds/ext-mk01k21
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter-custom-builds/ext-mk01k2116
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/rooter-extra && mv -n rooter-extra/ext-basicmenu rooter-extra/ext-flash rooter-extra/ext-gps rooter-extra/ext-hotspot rooter-extra/ext-l2tp rooter-extra/ext-netselect rooter-extra/ext-remote rooter-extra/ext-repeater rooter-extra/ext-scan rooter-extra/ext-serial rooter-extra/ext-simpin rooter-extra/ext-simplegps rooter-extra/luci-app-vpn-policy-routing rooter-extra/luci-app-vpnbypass rooter-extra/mesh11sd rooter-extra/multi-wifi rooter-extra/netrestart rooter-extra/speedtestpp ./ ; rm -rf rooter-extra
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/network/utils/umbim
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/network/utils/uqmi



exit 0
