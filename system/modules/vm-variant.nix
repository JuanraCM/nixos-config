{ inputs, ... }:

{
  imports = [ "${inputs.nixpkgs}/nixos/modules/virtualisation/qemu-vm.nix" ];

  virtualisation.vmVariant = {
    virtualisation.qemu.options = [
      "-device virtio-vga-gl"
      "-display gtk,gl=on"
    ];
  };
}
