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
svn export --force https://github.com/ofmodemsandmen/RooterSource/trunk/package/rooter-builds && mv -n rooter-builds/0protocols rooter-builds/ext-huasifei rooter-builds/ext-huasifei16 rooter-builds/ext-rooter-lite rooter-builds/ext-rooter16 rooter-builds/ext-rooter4 rooter-builds/ext-rooter8-vpn rooter-builds/ext-rooterbcm16 ./ ; rm -rf rooter-builds 
svn export --force https://github.com/ofmodemsandmen/RooterSource/trunk/package/rooter && mv -n rooter/0basicapps rooter/0basicsupport rooter/0drivers rooter/0optionalapps rooter/0routerspecfic rooter/0splash rooter/0themes rooter/0wifi rooter/ext-rooter-basic ./ ; rm -rf rooter
svn export --force https://github.com/ofmodemsandmen/RooterSource/trunk/package/rooter-extra && mv -n rooter-extra/dawn19 rooter-extra/eoip rooter-extra/ext-simple-gps rooter-extra/luci-app-dawn19 rooter-extra/mesh11sd rooter-extra/speedtestpp ./ ;rm -rf rooter-extra
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/network/utils/umbim
svn export --force https://github.com/ofmodemsandmen/ROOterSource2203/trunk/package/network/utils/uqmi



exit 0
