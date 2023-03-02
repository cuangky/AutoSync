
#!/bin/bash
NOW="$(date +"%m/%d/%Y")"
#nw="$(date +"%m/%d_%Y_%H/%M")"
nw="02/18_2023_06/22"
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

curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_aarch64_cortex-a53 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P aarch64_cortex-a53/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_aarch64_cortex-a72 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P aarch64_cortex-a72/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_x86_64 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P x86_64/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_mipsel_24kc | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P mipsel_24kc/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_mips_24kc | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P mips_24kc/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_i386_pentium4 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P i386_pentium4/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_arm_xscale | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P arm_xscale/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_arm_cortex-a15_neon-vfpv4 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P arm_cortex-a15_neon-vfpv4/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_arm_cortex-a9 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P arm_cortex-a9/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_arm_cortex-a9_vfpv3-d16 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P arm_cortex-a9_vfpv3-d16/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_arm_cortex-a7 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P arm_cortex-a7/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_arm_cortex-a7_neon-vfpv4 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P arm_cortex-a7_neon-vfpv4/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_arm_cortex-a5_vfpv4 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P arm_cortex-a5_vfpv4/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_arm_arm1176jzf-s_vfp | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P arm_arm1176jzf-s_vfp/
curl -s https://api.github.com/repos/cuangky/Zzz/releases/tags/"$NOW"_aarch64_generic | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P aarch64_generic/

#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_aarch64_cortex-a53 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/aarch64_cortex-a53/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_aarch64_cortex-a72 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/aarch64_cortex-a72/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_x86_64 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/x86_64/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_mipsel_24kc | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/mipsel_24kc/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_mips_24kc | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/mips_24kc/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_i386_pentium4 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/i386_pentium4/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_arm_xscale | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/arm_xscale/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_arm_cortex-a15_neon-vfpv4 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/arm_cortex-a15_neon-vfpv4/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_arm_cortex-a9 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/arm_cortex-a9/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_arm_cortex-a9_vfpv3-d16 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/arm_cortex-a9_vfpv3-d16/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_arm_cortex-a7 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/arm_cortex-a7/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_arm_cortex-a7_neon-vfpv4 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/arm_cortex-a7_neon-vfpv4/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_arm_cortex-a5_vfpv4 | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/arm_cortex-a5_vfpv4/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_arm_arm1176jzf-s_vfp | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/arm_arm1176jzf-s_vfp/
#curl -s https://api.github.com/repos/kzer00/packages-compile/releases/tags/"$nw"_aarch64_generic | grep "browser_download_url.*" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P oui/aarch64_generic/

exit 0
