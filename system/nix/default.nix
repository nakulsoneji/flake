{
  imports = [
    ./nh.nix
    ./nixpkgs.nix
    ./substituters.nix
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };
}

