{pkgs, ...}: {
  imports = [
    ./imv.nix
    ./mpv.nix
    ./spotify.nix
  ];

  home.packages = with pkgs; [
    pavucontrol
  ];
}
