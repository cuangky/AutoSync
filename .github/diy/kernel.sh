
#!/bin/bash
function git_sparse_clone() {
branch="$1" rurl="$2" localdir="$3" && shift 3
curl -s  $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
cd $localdir
git sparse-checkout init --cone
git sparse-checkout set $@
mv -n $@ ../
cd ..
rm -rf $localdir
}
curl -s https://api.github.com/repos/kzer00/amlogic-s9xxx-openwrt/releases/latest | grep "browser_download_url.*.tar.gz" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P kernel  && cd kernel && ls *tar.gz | xargs -n 1 tar -zxvf && rm -r *tar.gz
 
exit 0
