#!/bin/bash
set -e

echo "Installing gaming dependencies and Windows support..."

# Update package lists
apt-get update

# Install Wine and winetricks
apt-get install -y \
  wine \
  wine32 \
  wine64 \
  winetricks \
  zenity

# Install Vulkan support (crucial for gaming)
apt-get install -y \
  vulkan-tools \
  vulkan-loader \
  libvulkan1 \
  libvulkan-dev \
  mesa-vulkan-drivers

# Install Mesa utilities and GPU drivers
apt-get install -y \
  mesa-utils \
  libgl1-mesa-glx \
  libgl1-mesa-dri \
  libglx0 \
  libxrender1

# Install additional gaming libraries
apt-get install -y \
  libsdl2-2.0-0 \
  libsdl2-dev \
  libopenal1 \
  libopenal-dev \
  libpulse0 \
  libdbus-1-3 \
  libfreetype6 \
  libx11-6 \
  libxcursor1 \
  libxext6 \
  libxinerama1 \
  libxi6 \
  libxrandr2 \
  libxss1 \
  libxt6 \
  libxtst6

# Install audio support (PulseAudio)
apt-get install -y \
  pulseaudio \
  pavucontrol

# Install 32-bit support for Wine
dpkg --add-architecture i386
apt-get update
apt-get install -y \
  libc6:i386 \
  libncurses6:i386 \
  libstdc++6:i386

# Install essential development tools
apt-get install -y \
  build-essential \
  git \
  curl \
  wget \
  nano \
  vim

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "Gaming dependencies installed successfully!"