{pkgs, ...}: {
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      NIXOS_OZONE_WL = 1;
    };
  };
}
