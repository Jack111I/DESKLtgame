<img width="734" height="241" alt="Untitled-9 (1)" src="https://github.com/user-attachments/assets/535842aa-f40e-4631-b907-ecd1620b4046" />


# Cloud Desktop Gaming Codespace

This Codespace provides a full XFCE desktop environment with gaming and Windows application support.

## Features

- **XFCE Desktop**: Full graphical desktop environment
- **noVNC**: Access via web browser on port 6080
- **Wine 64-bit**: Run Windows .exe applications and games
- **Vulkan Support**: Modern graphics API for gaming
- **Mesa Drivers**: GPU acceleration support
- **Gaming Libraries**: SDL2, OpenAL, PulseAudio, and more

## Quick Start

1. Create a Codespace from this repository
2. Wait for the devcontainer to build (installation takes ~5-10 minutes)
3. Once ready, port 6080 will be available
4. Click on the forwarded port 6080 link in VS Code to access the desktop

## Accessing the Desktop

- **noVNC URL**: `http://localhost:6080`
- **VNC Viewer Clients**: You can also use traditional VNC viewers pointing to `localhost:6080`

## Running Applications

### Linux Games
```bash
# Games available via native Linux support
wine /path/to/game.exe
