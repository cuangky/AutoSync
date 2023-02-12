#!/bin/bash


function git_sparse_clone() {
branch="$1" rurl="$2" localdir="$3" && shift 3
curl -s  $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
cd $localdir
git sparse-checkout init --cone
git sparse-checkout set $@
mv -n $@ ../
cd ..
#rm -rf $localdir
}
megadl "https://mega.nz/folder/gzowSKZY#w3WbxnVMbjuWK6rkh4Volw" --path=pub/stable
megadl "https://mega.nz/folder/h6QwzbrQ#o6QIn86FlSQi0XOGV8jz3g" --path=pub/stable
megadl "https://mega.nz/folder/g2In3Aga#8V7arYzBTxH-pJBjlwy96g" --path=pub/stable
megadl "https://mega.nz/folder/ZzR1WRbD#zbsSMSkKIV10HBTPnpULFA" --path=pub/stable
megadl "https://mega.nz/folder/NzhnAaJI#ISss_STBsgOTH2L3jn5PGw" --path=pub/stable

svn export --force https://github.com/lynxnexy/openwrt/trunk/include/kernel pub/stable 
svn export --force https://github.com/kzer00/k3rnel/trunk/pub/stable pub/stable 
curl -s https://api.github.com/repos/kzer00/amlogic-s9xxx-openwrt/releases/latest | grep "browser_download_url.*.tar.gz" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P  pub/stable  && cd pub/stable  && ls *tar.gz | xargs -n 1 tar -zxvf && rm -r *tar.gz
exit 0
