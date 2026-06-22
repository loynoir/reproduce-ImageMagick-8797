#!/usr/bin/env bash
set -euo pipefail

img='public.ecr.aws/docker/library/archlinux:latest@sha256:ff410a88e200b133e577f5730b7bfa324e26a333075ee056bf45e911c6ac5671'

docker run \
  --rm -it \
  -v "${PWD:?}":/tmp/reproduce \
  -e X_ImageMagick_8797=1 \
  -w /tmp/reproduce \
  "${img:?}" \
  "$@"
