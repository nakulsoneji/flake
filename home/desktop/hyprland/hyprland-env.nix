{ pkgs, ... }: {
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XCURSOR_SIZE = 10;
    };
  };
}

