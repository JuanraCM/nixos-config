{ config, ... }:

let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  programs.wofi = {
    enable = true;
    style = ''
      window {
      	background-color: transparent;
      }

      #input {
      	margin: 5px;
      	border-radius: 10px;
      	background-color: ${colors.base01};
      	color: ${colors.base05};
        outline-color: ${colors.base00};
      }

      #outer-box {
      	margin: 2px;
      	padding: 10px;
        border-radius: 20px;
      	background-color: ${colors.base00};
      }

      #scroll {
      	margin: 5px;
      }

      #text {
      	padding: 4px;
      	color: ${colors.base05};
      }

      #entry {
      	background-color: ${colors.base00};
        border-radius: 10px;
      }

      #entry:selected {
      	background-color: ${colors.base03};
      }

      #text:selected {
      	background: transparent;
      }
    '';
    settings = {
      width = 350;
      height = 450;
      allow_markup = true;
      allow_images = true;
      prompt = "Search...";
      key_down = "Ctrl-j";
      key_up = "Ctrl-k";
    };
  };
}
