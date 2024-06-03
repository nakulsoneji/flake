{ pkgs, ... }: {
  imports = [
    ./hyprland-env.nix
  ];
  
  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    hyprpicker
    hyprpaper
    brightnessctl
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = false;
    };
  };
  
  home.file.".config/hypr" = { 
    source = ./config;
    recursive = true;
  };
}
