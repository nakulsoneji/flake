{inputs, ...}: {
  imports = [
    ./terminal
    inputs.nix-index-database.hmModules.nix-index
  ];

  home.sessionVariables = {
    MY_TEST_HOME = "test";
  };

  home = {
    username = "nakul";
    homeDirectory = "/home/nakul";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
