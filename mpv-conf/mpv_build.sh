#!/bin/bash

sudo apt install -y \
  build-essential meson ninja-build pkg-config \
  libvulkan-dev \
  libplacebo-dev \
  libwayland-dev wayland-protocols \
  libxkbcommon-dev libdrm-dev \
  libegl-dev libgl-dev \
  libass-dev \
  libpipewire-0.3-dev \
  libasound2-dev \
  libpulse-dev \
  libjpeg-dev \
  libbluray-dev \
  libcdio-paranoia-dev \
  libdvdnav-dev \
  libxpresent-dev \
  libxv-dev \
  libzimg-dev \
  liblua5.2-dev

mkdir -p ~/projects
cd ~/projects
git clone https://github.com/mpv-player/mpv.git
cd mpv
git checkout v0.41.0

rm -rf build

meson setup build \
  -Dvulkan=enabled \
  -Dwayland=enabled \
  -Dlua=enabled \
  -Dpipewire=enabled

ninja -C build
sudo ninja -C build install

echo -e "Finished\n"

mpv --vo=help
mpv --ao=help

