# NixOS Configuration

My daily driver NixOS configuration.

## Hardware Limitations

- **AMD GPUs only** - This configuration is set up specifically for AMD graphics cards using the `amdgpu` driver.

## Installation

### On a machine with NixOS already installed

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

Replace `<hostname>` with either `desktop` or `slim7`.

### On a fresh installation

```bash
sudo nixos-install --flake .#<hostname>
```

Replace `<hostname>` with either `desktop` or `slim7`.
