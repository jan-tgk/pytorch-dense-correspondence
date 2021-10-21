#!/bin/bash

set -euxo pipefail

apt-get update
apt install --no-install-recommends \
  terminator \
  tmux \
  vim \
  gedit \
  git \
  openssh-client \
  unzip \
  htop \
  libopenni-dev \
  apt-utils \
  usbutils \
  dialog \
  python-pip \
  python-dev \
  ffmpeg \
  nvidia-settings \
  cmake-curses-gui \
  libyaml-dev

pip install --upgrade pip==9.0.3
pip install -U setuptools

apt-get -y install ipython ipython-notebook
pip install \
  jupyter \
  opencv-python==4.1.0.25\
  plyfile \
  pandas \
  tensorflow \
  future \
  typing \
  qtconsole==4.5.3 \
  nbconvert==5.4.0 \
  jsonschema==2.6.0