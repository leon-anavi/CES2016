#!/bin/sh

AGL_NAVI=TRUE
export AGL_NAVI

#the following value shall be modified for your display resolution
SCREEN_W=1080
SCREEN_H=480

#Demo is configured to FullHD
QT_W=1080
QT_H=480

# surface IDs. This is automatically assigned by wl-shell-emulator.so
# from base 2147483648(0x80000000) and incremented.
# This expects navi application will create wl_surface faster than qmlscene.
SURFACE_ID_NAVI=2147483648
SURFACE_ID_QML=2147483649
NAVI_APP=/home/navi

# Layer ID to contain applicatons
LAYER_ID=1000

#To cut off window title bar.
WIN_TITLE_H=30

#reboot weston for clean up
systemctl restart weston
sleep 2
systemctl restart weston
sleep 2

#invoke Demo applications
export XDG_RUNTIME_DIR=/run/user/0
export LD_PRELOAD=/usr/lib/libEGL.so
/usr/bin/qt5/qmlscene -I imports Main.qml &
$NAVI_APP &
layer-add-surfaces $LAYER_ID 2
/usr/bin/LayerManagerControl set surface $SURFACE_ID_QML destination region 0 0 $SCREEN_W $SCREEN_H
/usr/bin/LayerManagerControl set surface $SURFACE_ID_QML source region 0 $WIN_TITLE_H $QT_W $QT_H

#set offset to position of navi
/usr/bin/LayerManagerControl set surface $SURFACE_ID_NAVI position 0 120


