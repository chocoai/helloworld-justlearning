#!/bin/bash
./configure --prefix=/usr \
            --yasm='' \
            --codecsdir=/usr/lib/mplayer/codecs \
            --confdir=/etc/mplayer \
            --datadir=/usr/share/mplayer \
            --enable-gui \
            --enable-menu \
            --enable-largefiles \
            --enable-dynamic-plugins \
            --enable-freetype
## some tips ##
##read  ./ect/example.conf for basic settings afer install
## minimal settings
##fontconfig=no
##subcp=cp936
##0 exact 1 match 3 all
##sub-fuzziness=1
#make
#make install
##install -d /usr/bin /etc/mplayer /usr/lib
##install -m 755 -s mplayer /usr/bin
##ln -sf mplayer /usr/bin/gmplayer
##install -d /usr/share/mplayer/skins /usr/share/pixmaps /usr/share/applications
##install -m 644 etc/mplayer.xpm /usr/share/pixmaps/
##install -m 644 etc/mplayer.desktop /usr/share/applications/
##install -m 755 -s mencoder /usr/bin
##install -d /usr/share/man/zh_CN/man1
##install -m 644 DOCS/man/zh_CN/mplayer.1 /usr/share/man/zh_CN/man1/
##cd /usr/share/man/zh_CN/man1 && ln -sf mplayer.1 mencoder.1