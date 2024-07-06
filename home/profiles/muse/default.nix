{
  imports = [
    ../../desktop/hyprland
    ../../desktop/dunst
    ../../desktop/waybar
    ../../desktop/fuzzel

    ../../programs
    ../../programs/files/ghdesktop.nix

    ../../services/polkit-gnome.nix
    ../../services

    ../../email/default.nix

    ../../terminal/programs
    ../../terminal/programs/scripts/wayland.nix
    ../../terminal/shell/zsh.nix
    ../../terminal/emulators/foot.nix

    ../../editors/nixvim.nix
    ../../editors/rstudio.nix
    ../../editors/vscode.nix
    ../../editors/unity.nix
  ];
}
