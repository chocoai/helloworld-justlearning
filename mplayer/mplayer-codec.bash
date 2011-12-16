#!/bin/bash
install -v -d -m755 /usr/lib/mplayer/codecs &&
tar -xvf all-20061022.tar.bz2 \
    -C /usr/lib/mplayer/codecs --strip-components=1 &&
chown -v -R root:root /usr/lib/mplayer/codecs

