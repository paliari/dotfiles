# CONVERTE INSTALAÇÃO DO YOSEMITE BAIXADA PELA APPLE STORE, EM UM ARQUIVO BOOTÁVEL Yosemite.iso para utilizar no VirtualBox
set -e

# trocar baseado na versão do instalador
NAME=Yosemite

# caminho da instalação do OSX: /Applications/Install\ OS\ X\ Yosemite.app
INSTALLER=$1

# Mount the installer image
hdiutil attach "$INSTALLER/Contents/SharedSupport/InstallESD.dmg" -noverify -nobrowse -mountpoint /Volumes/install_app

# Convert the boot image to a sparse bundle
hdiutil convert /Volumes/install_app/BaseSystem.dmg -format UDSP -o /tmp/$NAME

# Increase the sparse bundle capacity to accommodate the packages
hdiutil resize -size 8g /tmp/$NAME.sparseimage

# Mount the sparse bundle for package addition
hdiutil attach /tmp/$NAME.sparseimage -noverify -nobrowse -mountpoint /Volumes/install_build

# Remove Package link and replace with actual files
rm -f /Volumes/install_build/System/Installation/Packages
cp -rp /Volumes/install_app/Packages /Volumes/install_build/System/Installation/

# Unmount the installer image
hdiutil detach /Volumes/install_app

# Unmount the sparse bundle
hdiutil detach /Volumes/install_build

# Resize the partition in the sparse bundle to remove any free space
hdiutil resize -size `hdiutil resize -limits /tmp/$NAME.sparseimage | tail -n 1 | awk '{ print $1 }'`b /tmp/$NAME.sparseimage

# Convert the sparse bundle to ISO/CD master
hdiutil convert /tmp/$NAME.sparseimage -format UDTO -o /tmp/$NAME

# Remove the sparse bundle
rm -f /tmp/$NAME.sparseimage

# Rename the ISO and move it to the desktop
mv /tmp/$NAME.cdr ~/Desktop/$NAME.iso

# TODO: trocar no virtualbox Chipset para PIIX3 (System > Motherboard)
