{
  imports = [
    ./fonts.nix
    ./home-manager.nix
    ./zsh.nix
    ./xdg.nix
  ];

  programs.dconf.enable = true;
}
