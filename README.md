# NimsForest NixOS

NixOS configurations for NimsForest distributed architecture.

## Quick Start - Body Machine (Pi 5)

```bash
# Build and flash
nixos-generate -f sd-aarch64 -c ./body/pi5/configuration.nix
dd if=result/sd-image/*.img of=/dev/sdX
```

## Architecture

- **body/**: Orchestration nodes (Pi 5)
- **muscle/**: Gaming + AI inference (coming soon)  
- **memory/**: Storage systems (coming soon)

## Directory Structure

```
nimsforestnixos/
├── body/pi5/          # Pi 5 body machine configs
├── pkgs/nimsforest/   # NimsForest package definition
└── README.md          # This file
```

## Development

This repo contains the infrastructure-as-code definitions for deploying NimsForest on various hardware configurations. Each machine type (body/muscle/memory) has its own optimized NixOS configuration.
