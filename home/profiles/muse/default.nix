{
  imports = [
    ../../desktop/hyprland
    ../../desktop/dunst
    ../../desktop/ags
    ../../desktop/rofi
    ../../desktop/waybar

    ../../programs
    ../../programs/files/thunar.nix

    ../../services/polkit-gnome.nix
    ../../services

    ../../email/default.nix

    ../../terminal/programs
    ../../terminal/shell/zsh.nix
    ../../terminal/emulators/kitty
    ../../terminal/emulators/alacritty.nix

    ../../editors/nixvim.nix
    ../../editors/rstudio.nix
    ../../editors/vscode.nix
  ];
}
