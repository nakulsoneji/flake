{inputs, ...}: {
  imports = [
    ./terminal
    inputs.nix-index-database.hmModules.nix-index
  ];

  home = {
    username = "nakul";
    homeDirectory = "/home/nakul";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
