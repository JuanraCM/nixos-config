{ inputs, username, ... }:

{
  imports = [ inputs.nix-amd-ai.nixosModules.default ];

  hardware.amd-npu = {
    enable = true;
    enableNPU = true;
    enableFastFlowLM = true;
    enableLemonade = true;
    enableROCm = false;
    enableVulkan = false;
    enableImageGen = false;
    lemonade.user = username;
  };

  users.users.${username}.extraGroups = [
    "video"
    "render"
  ];
}
