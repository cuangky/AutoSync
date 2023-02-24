#!/bin/bash


function git_sparse_clone() {
branch="$1" rurl="$2" localdir="$3" && shift 3
git clone -b  $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
cd $localdir
git sparse-checkout init --cone
git sparse-checkout set $@
mv -n $@ ../
cd ..
rm -rf $localdir
}

git clone --depth 1 https://github.com/SSHSEDANG4/iptv

exit 0
