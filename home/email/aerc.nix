{pkgs, ...}: {
  programs.aerc = {
    enable = true;
    extraConfig = {
      general.unsafe-accounts-conf = true;
      filters = {
        "text/html" = "html";
        "text/plain" = "colorize";
      };
      ui = {
        border-char-vertical = "│";
        border-char-horizontal = "─";
        styleset-name = "catppuccin-mocha";
      };
    };
  };

  # theme
  xdg.configFile = {
    "aerc/stylesets/catppuccin-mocha".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/aerc/b6f347d302f96ceff1263cca8fbbc20d57c63444/dist/catppuccin-mocha";
      hash = "sha256-5KuWbFwG0Duw7Dx36qlE8PcX3Rtlf4aFMRXOuG4G0bo=";
    };
  };
}
