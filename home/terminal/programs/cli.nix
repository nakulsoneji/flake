{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "nakulsoneji";
    userEmail = "nakulsoneji@gmail.com";
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    colors = {
      bg = "#1e1e2e";
      "bg+" = "#313244";
      hl = "#f38ba8";
      "hl+" = "#f38ba8";
      fg = "#cdd6f4";
      "fg+" = "#cdd6f4";

      spinner = "#f5e0dc";
      header = "#f38ba8";
      info = "#cba6f7";
      pointer = "#f5e0dc";
      marker = "#f5e0dc";
      prompt = "#cba6f7";
    };
    defaultCommand = "fd --type f";
    changeDirWidgetCommand = "fd --type d";
    fileWidgetCommand = "fd --type f";
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd j"
    ];
  };

  programs.fd = {
    enable = true;
    hidden = true;
  };

  programs.fastfetch = {
    enable = true;
  };

  programs.bat = {
    enable = true;
    themes = {
      catppuccin = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "d714cc1d358ea51bfc02550dabab693f70cccea0";
          sha256 = "sha256-Q5B4NDrfCIK3UAMs94vdXnR42k4AXCqZz6sRn8bzmf4=";
        };
        file = "themes/Catppuccin Mocha.tmTheme";
      };
    };
    config = {
      theme = "catppuccin";
    };
    extraPackages = with pkgs.bat-extras; [
      batman
    ];
  };

  programs.btop = {
    enable = true;
    settings.color_theme = "catppuccin_mocha";
  };

  xdg.configFile = {
    "btop/themes/catppuccin_mocha.theme".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/btop/7109eac2884e9ca1dae431c0d7b8bc2a7ce54e54/themes/catppuccin_mocha.theme";
      hash = "sha256-KnXUnp2sAolP7XOpNhX2g8m26josrqfTycPIBifS90Y=";
    };
  };
}
