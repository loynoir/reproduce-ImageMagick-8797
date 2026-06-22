#!/usr/bin/env bash
set -euo pipefail

generate_system_font_image() {
  # install magick and system fonts
  pacman --noconfirm --needed -Syu imagemagick noto-fonts noto-fonts-cjk

  if [ ! -e /usr/share/fonts/noto/NotoSerif-Regular.ttf ]; then
    exit 1
  fi

  if [ ! -e /usr/share/fonts/noto-cjk/NotoSerifCJK-Regular.ttc ]; then
    exit 1
  fi

  mkdir -p ./generated

  magick -size 500x500 -background skyblue -fill black -pointsize 24 \
    -font Noto-Serif-Regular \
    caption:"TestingTesting Testing\ndoor = [门]" \
    ./generated/guest.system.EN.png

  magick \
    -background white \
    -fill black \
    -font Noto-Serif-CJK-JP \
    -family 'Noto Serif CJK JP' \
    -pointsize 72 label:门 \
    ./generated/guest.system.JP.png

  magick \
    -background white \
    -fill black \
    -font Noto-Serif-CJK-SC \
    -family 'Noto Serif CJK SC' \
    -pointsize 72 label:门 \
    ./generated/guest.system.SC.png

  echo OK
}

generate_user_font_image() {
  # install magick and system fonts
  pacman --noconfirm --needed -Syu imagemagick noto-fonts noto-fonts-cjk

  if [ ! -e /usr/share/fonts/noto/NotoSerif-Regular.ttf ]; then
    exit 1
  fi

  if [ ! -e /usr/share/fonts/noto-cjk/NotoSerifCJK-Regular.ttc ]; then
    exit 1
  fi

  echo copy system fonts to user fonts
  mkdir -p ~/fonts
  cp -Trap /usr/share/fonts ~/fonts
  # uninstall system fonts
  pacman --noconfirm -Rns noto-fonts noto-fonts-cjk

  if [ ! -e ./generated/imagick_type_gen ]; then
    curl \
      -fsSLo ./generated/imagick_type_gen \
      https://raw.githubusercontent.com/ImageMagick/Usage/088ad0ff4f66549ef2bbe68122b9f9a105f7d70e/docs/scripts/imagick_type_gen
  fi

  echo generate type.xml
  pacman --noconfirm --needed -Syu perl locate
  mkdir -p ~/.magick
  rm ~/.magick/type-myfonts.xml || :
  find ~/fonts -type f -name '*.*' \
    | perl -w ./generated/imagick_type_gen -f - >~/.magick/type-myfonts.xml

  echo grep type.xml
  cat ~/.magick/type-myfonts.xml | grep -B 5 -A 1 NotoSerif-Regular.ttf
  if ! grep -F 'name="NotoSerif"' ~/.magick/type-myfonts.xml; then
    exit 1
  fi

  mkdir -p ./generated

  # `Noto-Serif-Regular` in archlinux system font
  # `NotoSerif` in imagick_type_gen user font
  magick -size 500x500 -background skyblue -fill black -pointsize 24 \
    -font NotoSerif \
    caption:"TestingTesting Testing\ndoor = [门]" \    
    ./generated/guest.user.EN.png

  magick \
    -background white \
    -fill black \
    -font Noto-Serif-CJK-JP \
    -family 'Noto Serif CJK JP' \
    -pointsize 72 label:门 \
    ./generated/guest.user.JP.png

  magick \
    -background white \
    -fill black \
    -font Noto-Serif-CJK-SC \
    -family 'Noto Serif CJK SC' \
    -pointsize 72 label:门 \
    ./generated/guest.user.SC.png

  echo OK
}

case "${1-default}" in
  generate_system_font_image)
    generate_system_font_image
    ;;
  generate_user_font_image)
    generate_user_font_image
    ;;
  default)
    generate_system_font_image
    generate_user_font_image
    ;;
esac
