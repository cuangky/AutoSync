#!/bin/bash
function git_sparse_clone() {
branch="$1" rurl="$2" localdir="$3" && shift 3
curl -s $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
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
rm -r *
curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/aarch64_cortex-a53 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P aarch64_cortex-a53/

exit 0

