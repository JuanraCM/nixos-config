{ username, ... }:

{
  virtualisation.vmVariant = {
    virtualisation.qemu.options = [
      "-device virtio-vga-gl"
      "-display gtk,gl=on"
    ];

    users.users.${username}.initialPassword = "test";
  };
}
