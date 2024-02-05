rm -rf compile/crtree_0.1.0_amd64.deb
rm -rf compile/crtree
rm -rf crtree
crystal build src/crtree.cr
bash compile/debian.sh
rm -rf crtree