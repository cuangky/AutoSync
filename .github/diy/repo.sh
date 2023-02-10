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
curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/02%2F10_2023_13%2F26_x86_64 | grep "browser_download_url.*.ipk" | cut -d : -f 2,3 | tr -d \" | wget -qi -


exit 0

