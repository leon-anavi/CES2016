#!/bin/sh

/opt/AGL/CES2016/switch_to_ivi-shell.sh

mkdir -p $HOME/.config/systemd/user
cp /opt/AGL/CES2016/scripts/demohmi.service $HOME/.config/systemd/user
systemctl --user enable demohmi.service

echo Setting Done.
echo Rebooting system...

sleep 3
systemctl reboot
