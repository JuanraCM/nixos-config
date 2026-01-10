let
  makeWebApp = appName: appUrl: imagePath: {
    ".local/share/applications/${appName}.desktop".text = ''
      [Desktop Entry]
      Version=1.0
      Name=${appName}
      Comment=${appName}
      Exec=chromium --app=${appUrl}
      Terminal=false
      Type=Application
      Icon=${imagePath}
    '';
  };
in
{
  home.file =
    makeWebApp "WhatsApp" "https://web.whatsapp.com/" ./whatsapp.png
    // makeWebApp "DeepL" "https://www.deepl.com/es/translator" ./deepl.png
    // makeWebApp "Netflix" "https://www.netflix.com/browse" ./netflix.png;
}
