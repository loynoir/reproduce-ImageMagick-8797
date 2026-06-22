#!/usr/bin/env bash

mkdir -p ./generated

magick \
  -background white \
  -fill black \
  -font Noto-Serif-CJK-JP-Regular \
  -family 'Noto Serif CJK JP' \
  -pointsize 72 label:门 \
  ./generated/host.system.JP.png

magick \
  -background white \
  -fill black \
  -font Noto-Serif-CJK-SC-Regular \
  -family 'Noto Serif CJK SC' \
  -pointsize 72 label:门 \
  ./generated/host.system.SC.png

echo OK
