mkdir crtree_0.1.0_deb
mkdir -p crtree_0.1.0_deb/usr/local/bin
cp crtree crtree_0.1.0_deb/usr/local/bin
mkdir -p crtree_0.1.0_deb/DEBIAN
touch crtree_0.1.0_deb/DEBIAN/control
echo "Package: crtree" >> crtree_0.1.0_deb/DEBIAN/control
echo "Version: 0.1.0" >> crtree_0.1.0_deb/DEBIAN/control
echo "Architecture: amd64" >> crtree_0.1.0_deb/DEBIAN/control
echo "Maintainer: Lylian Guerra--Rgo" >> crtree_0.1.0_deb/DEBIAN/control
echo "Description: A simple tree command" >> crtree_0.1.0_deb/DEBIAN/control
dpkg-deb --build crtree_0.1.0_deb
mv crtree_0.1.0_deb.deb crtree_0.1.0_amd64.deb
rm -rf crtree_0.1.0_deb