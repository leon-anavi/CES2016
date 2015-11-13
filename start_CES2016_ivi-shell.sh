#!/bin/sh

#the following value shall be modified for your display side
SCREEN_W=1080
SCREEN_H=1920

#Demo is configured to FullHD
QT_W=1080
QT_H=1920

#To cut off window title bar.
WIN_TITLE_H=30

#invoke demo apps
systemctl restart weston
sleep 2
LD_PRELOAD=/usr/lib/libEGL.so /usr/bin/qt5/qmlscene -I imports Main.qml &
layer-add-surfaces 1000 1
/usr/bin/LayerManagerControl set surface 2147483648 destination region 0 0 $SCREEN_W $SCREEN_H
/usr/bin/LayerManagerControl set surface 2147483648 source region 0 $WIN_TITLE_H $QT_W $QT_H
