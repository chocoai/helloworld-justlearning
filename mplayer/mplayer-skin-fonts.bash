#!/bin/bash
install -v -d -m755 /usr/share/mplayer/Skin &&
tar -xvf Blue-1.7.tar.bz2 \
    -C /usr/share/mplayer/Skin &&
chown -v -R root:root /usr/share/mplayer/Skin/Blue &&
chmod -v 755 /usr/share/mplayer/Skin/Blue{,/icons} &&
ln -sfv Blue /usr/share/mplayer/Skin/default
install -v -m750 -d ~/.mplayer &&
ln -v -sf /usr/share/fonts/winfonts/yaheiconsolashybrid.ttf \
    ~/.mplayer/subfont.ttf