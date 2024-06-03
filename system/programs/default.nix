{
  imports = [
    ./fonts.nix
    ./home-manager.nix
    ./zsh.nix
  ];

  programs.dconf.enable = true;
}
