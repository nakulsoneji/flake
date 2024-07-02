{pkgs, ...}: {
  home.packages = with pkgs; [
    (discord.override {
      # withOpenASAR = true;
    })
  ];

  xdg.configFile."discord/settings.json".text = ''
    {
      "SKIP_HOST_UPDATE": true,
      "openasar": {
        "setup": true,
        "quickstart": true,
        "css": "@import url(\"https://catppuccin.github.io/discord/dist/catppuccin-mocha-blue.theme.css\");",
        "themeSync": true
      },
      "IS_MAXIMIZED": false,
      "IS_MINIMIZED": false,
      "WINDOW_BOUNDS": {
        "x": 8,
        "y": 53,
        "width": 1904,
        "height": 1019
      },
      "trayBalloonShown": true,
      "chromiumSwitches": {}
    }
  '';
}
