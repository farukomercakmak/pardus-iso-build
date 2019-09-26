#!/bin/bash

## ISO oluşturmak içn gerekli paket bağımlılıkları kurulur.
apt install wget xorriso isolinux -y

## Baz alınacak Pardus imajı indirilir.
wget http://indir.pardus.org.tr/ISO/Pardus19/Pardus-19.0-XFCE-amd64.iso

echo "ISO dosyalarının oluşturulacağı dizin /opt altına oluşturuluyor..."
mkdir -p /opt/pardusiso

echo "Pardus Pardus-19.0-XFCE isosu açılıyor..."
xorriso -osirrox on -indev Pardus-19.0-XFCE-amd64.iso -extract / /opt/pardusiso

echo "Konfigurasyon dosyaları kopyalanıyor..."
cp menu.cfg menu_tr.cfg /opt/pardusiso/isolinux/
cp preseed.cfg /opt/pardusiso/

echo "Kurulum seçeneklerine preseed.cfg satırı ekleniyor..."
sed -i 's+append vga=788  --- quiet+append file=/cdrom/preseed.cfg vga=788  --- quiet+g' /opt/pardusiso/isolinux/install.cfg
sed -i 's+append video=vesa:ywrap,mtrr vga=788  --- quiet+append file=/cdrom/preseed.cfg video=vesa:ywrap,mtrr vga=788  --- quiet+g' /opt/pardusiso/isolinux/install.cfg

echo "ISO oluşturuluyor..."
DATE=`date +%y%m%d%H%M`
xorriso -as mkisofs -o Pardus-19.0-XFCE-amd64-$DATE.iso -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin -c isolinux/boot.cat -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table  /opt/pardusiso/

#echo "ISO için oluşturulan dizin siliniyor..."
rm -rf /opt/pardusiso

yer=$(pwd)
iso="Pardus-19.0-XFCE-amd64-"$DATE".iso"
echo "ISO " $yer "dizini altına " $iso "ismi ile oluşturuldu.."
