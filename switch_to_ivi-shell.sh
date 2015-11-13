#!/bin/sh
cd /etc/xdg/weston
mv weston.ini weston.ini.desktop-shell
cp /opt/AGL/CES2016/weston.ini.ivi-shell .
ln -sf weston.ini.ivi-shell weston.ini
systemctl restart weston.service
