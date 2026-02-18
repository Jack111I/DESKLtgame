#!/bin/bash
set -e

echo "Setting up vscode user with sudo privileges..."

# Ensure vscode user exists and has sudo privileges
if ! groups vscode | grep -q sudo; then
  usermod -aG sudo vscode
  echo "vscode" | sudo -S usermod -aG sudo vscode
  echo "vscode added to sudo group"
fi

# Allow sudo without password for vscode user (convenient for Codespace)
echo "vscode ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/vscode > /dev/null
chmod 0440 /etc/sudoers.d/vscode

# Initialize Wine prefix for the vscode user
sudo -u vscode WINEARCH=win64 WINEPREFIX=/home/vscode/.wine64 wineboot --init

# Create desktop directories
mkdir -p /home/vscode/Desktop
mkdir -p /home/vscode/.wine64/drive_c/Program\ Files
chown -R vscode:vscode /home/vscode

# Configure noVNC and desktop display
cat > /home/vscode/.bashrc << 'EOF'
# Gaming and Wine environment variables
export WINEARCH=win64
export WINEPREFIX=/home/vscode/.wine64
export DXVK_HUD=fps
export STAGING_SHARED_MEMORY=1

# DISPLAY for X11
export DISPLAY=:1

# Vulkan and GPU optimizations
export VK_ICD_FILENAMES=/etc/vulkan/icd.d/intel_icd.x86_64.json:/etc/vulkan/icd.d/nvidia_icd.x86_64.json

alias wine64='wine'
alias winetricks64='WINEPREFIX=/home/vscode/.wine64 winetricks'
EOF

chown vscode:vscode /home/vscode/.bashrc

# Configure desktop environment preferences
mkdir -p /home/vscode/.config

cat > /home/vscode/.config/xfce4-panel.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<channel name="xfce4-panel" version="1.0">
  <property name="panels" type="array">
    <value type="int" value="1"/>
  </property>
  <property name="panel-1" type="channel">
    <property name="position" type="string" value="p=10;x=0;y=0"/>
    <property name="length" type="uint" value="100"/>
    <property name="position-locked" type="bool" value="true"/>
    <property name="autohide" type="bool" value="false"/>
    <property name="mode" type="uint" value="0"/>
  </property>
</channel>
EOF

chown -R vscode:vscode /home/vscode/.config

echo "User setup completed successfully!"
echo ""
echo "Desktop environment ready! Access noVNC at: http://localhost:6080"
echo "Wine Prefix: /home/vscode/.wine64"
echo "Desktop Games Directory: /home/vscode/Desktop"