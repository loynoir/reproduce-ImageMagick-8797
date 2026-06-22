# related

https://github.com/ImageMagick/ImageMagick/issues/8797

## requirements

bash + docker

## reproduce

on host machine, use docker for reproducible environment

```console
$ bash ./container.sh bash ./guest.archlinux.sh
```

If already within archlinux container

```console
$ bash ./guest.archlinux.sh
```

Optional, on nixos machine, run below to get compare group

```console
$ bash ./host.nixos.sh
OK
```

## compare group

On nixos host machine

```console
$ bash ./host.nixos.sh
OK
```

Which generate correct image with system font

[./generated/host.system.JP.png](./generated/host.system.JP.png)

[./generated/host.system.SC.png](./generated/host.system.SC.png)

Within archlinux guest container

```console
$ bash ./container.sh bash ./guest.archlinux.sh generate_system_font_image
...
installing noto-fonts...
...
installing noto-fonts-cjk...
...
removing noto-fonts-cjk...
removing noto-fonts...
...
OK
```

Which generate correct image with system font

[./generated/guest.system.EN.png](./generated/guest.system.EN.png)

[./generated/guest.system.JP.png](./generated/guest.system.JP.png)

[./generated/guest.system.SC.png](./generated/guest.system.SC.png)


## expected

Within archlinux guest container

- `imagick_type_gen` works correctly

- `magick` works correctly

```console
$ bash ./container.sh bash ./guest.archlinux.sh generate_user_font_image
...
installing noto-fonts...
...
installing noto-fonts-cjk...
...
copy system fonts to user fonts
removing noto-fonts-cjk...
removing noto-fonts...
...
generate type.xml
...
grep type.xml
  <type
     format="ttf"
     name="NotoSerif"
     fullname="Noto Serif Regular"
     family="Noto Serif"
     glyphs="/root/fonts/noto/NotoSerif-Regular.ttf"
     />
...
OK
```

Which generate correct image with user font

[./generated/guest.user.EN.png](./generated/guest.user.EN.png)

[./generated/guest.user.JP.png](./generated/guest.user.JP.png)

[./generated/guest.user.SC.png](./generated/guest.user.SC.png)

## actual

Within archlinux guest container

- `imagick_type_gen` not works correctly

- `magick` fail user EN font, fail user CJK JP font, fail user CJK SC font

```console
$ bash ./container.sh bash ./guest.archlinux.sh generate_user_font_image
...
installing noto-fonts...
...
installing noto-fonts-cjk...
...
copy system fonts to user fonts
removing noto-fonts-cjk...
removing noto-fonts...
...
generate type.xml
TTF Version mismatch, not a basic TrueType font file: /root/fonts/noto/NotoSansDuployan-Bold.ttf at ./generated/imagick_type_gen.pl line 163, <> line 125.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 244, <> line 125.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 245, <> line 125.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 246, <> line 125.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 247, <> line 125.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 248, <> line 125.
Use of uninitialized value $family in substitution (s///) at ./generated/imagick_type_gen.pl line 250, <> line 125.
Use of uninitialized value $family in substitution (s///) at ./generated/imagick_type_gen.pl line 251, <> line 125.
Use of uninitialized value $family in substitution (s///) at ./generated/imagick_type_gen.pl line 251, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 264, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 265, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 266, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 267, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 268, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 269, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 270, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 271, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 272, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 273, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 274, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 275, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 276, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 277, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 279, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 280, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 281, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 282, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 284, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 285, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 286, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 287, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 288, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 289, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 290, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 291, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 292, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 293, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 294, <> line 125.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 296, <> line 125.
Use of uninitialized value $name in string eq at ./generated/imagick_type_gen.pl line 299, <> line 125.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 301, <> line 125.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 302, <> line 125.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 303, <> line 125.
TTF Version mismatch, not a basic TrueType font file: /root/fonts/noto/NotoSansDuployan-Regular.ttf at ./generated/imagick_type_gen.pl line 163, <> line 126.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 244, <> line 126.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 245, <> line 126.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 246, <> line 126.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 247, <> line 126.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 248, <> line 126.
Use of uninitialized value $family in substitution (s///) at ./generated/imagick_type_gen.pl line 250, <> line 126.
Use of uninitialized value $family in substitution (s///) at ./generated/imagick_type_gen.pl line 251, <> line 126.
Use of uninitialized value $family in substitution (s///) at ./generated/imagick_type_gen.pl line 251, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 264, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 265, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 266, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 267, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 268, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 269, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 270, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 271, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 272, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 273, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 274, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 275, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 276, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 277, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 279, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 280, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 281, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 282, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 284, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 285, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 286, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 287, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 288, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 289, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 290, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 291, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 292, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 293, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 294, <> line 126.
Use of uninitialized value $name in substitution (s///) at ./generated/imagick_type_gen.pl line 296, <> line 126.
Use of uninitialized value $name in string eq at ./generated/imagick_type_gen.pl line 299, <> line 126.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 301, <> line 126.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 302, <> line 126.
Use of uninitialized value $fullname in substitution (s///) at ./generated/imagick_type_gen.pl line 303, <> line 126.
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSansCJK-Black.ttc" skipped, unknown suffix
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSansCJK-Bold.ttc" skipped, unknown suffix
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSansCJK-DemiLight.ttc" skipped, unknown suffix
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSansCJK-Light.ttc" skipped, unknown suffix
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSansCJK-Medium.ttc" skipped, unknown suffix
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSansCJK-Regular.ttc" skipped, unknown suffix
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSansCJK-Thin.ttc" skipped, unknown suffix
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSerifCJK-Black.ttc" skipped, unknown suffix
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSerifCJK-Bold.ttc" skipped, unknown suffix
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSerifCJK-ExtraLight.ttc" skipped, unknown suffix
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSerifCJK-Light.ttc" skipped, unknown suffix
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSerifCJK-Medium.ttc" skipped, unknown suffix
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSerifCJK-Regular.ttc" skipped, unknown suffix
imagick_type_gen.pl: "/root/fonts/noto-cjk/NotoSerifCJK-SemiBold.ttc" skipped, unknown suffix
grep type.xml
  <type
     format="ttf"
     name="NotoSerif"
     fullname="Noto Serif Regular"
     family="Noto Serif"
     glyphs="/root/fonts/noto/NotoSerif-Regular.ttf"
     />
magick: unable to read font `NotoSerif' @ warning/annotate.c/RenderType/1026.
magick: unable to read font `NotoSerif (invalid stream operation)' @ error/annotate.c/RenderFreetype/1660.
magick: unable to read font `NotoSerif' @ warning/annotate.c/RenderType/1026.
magick: unable to read font `NotoSerif (invalid stream operation)' @ error/annotate.c/RenderFreetype/1660.
magick: unable to read font `NotoSerif' @ warning/annotate.c/RenderType/1026.
magick: unable to read font `NotoSerif (invalid stream operation)' @ error/annotate.c/RenderFreetype/1660.
(exit 1)
```

Fail to generate image with user font

[./generated/guest.user.EN.png](./generated/guest.user.EN.png)

[./generated/guest.user.JP.png](./generated/guest.user.JP.png)

[./generated/guest.user.SC.png](./generated/guest.user.SC.png)
