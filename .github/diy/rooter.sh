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
svn export https://github.com/ofmodemsandmen/RooterSource/trunk/package/rooter-builds && mv -n rooter-builds/0protocols rooter-builds/ext-huasifel rooter-builds/ext-huasifel16 rooter-builds/ext-rooter-lite rooter-builds/ext-rooter16 rooter-builds/ext-rooter4 rooter-builds/ext-rooter8-vpn rooter-builds/ext-rooterbcm16 ./ ;rm -r rooter-builds 






exit 0
