#!/bin/bash

echo "building debian package"
mkdir -p package/usr/share/cinnamon/applets
cp -r LukaMenu@luka package/usr/share/cinnamon/applets
ver="$(cat DEBIAN/control | grep -Po '(?<=Version: ).+')"
echo building version: $ver
sed -i s/REPLACEVERSION/$ver/ package/usr/share/cinnamon/applets/LukaMenu@luka/metadata.json
cp -r DEBIAN package
dpkg-deb --root-owner-group --build "package" > /dev/null
mv package.deb luka-menu.deb
rm -rf package
unset ver
