{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
  ];

  xdg.configFile."vesktop/settings/quickCss.css".text = ''
    @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha-blue.theme.css");
  '';
}
