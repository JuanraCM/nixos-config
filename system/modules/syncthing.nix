{ username, ... }:

{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = username;
    group = "users";
    dataDir = "/home/${username}";
    settings = {
      gui.user = username;
      devices = {
        "pixel" = {
          id = "KS2H6XY-INZD4FT-KFUSA5U-NMNDDJS-V5OUQUD-VIK2QEX-5OL4R27-QBXSCQH";
        };
      };
      folders = {
        "KnowledgeBase" = {
          path = "~/KnowledgeBase";
          devices = [ "pixel" ];
        };
      };
    };
  };
}
