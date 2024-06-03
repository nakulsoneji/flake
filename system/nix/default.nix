{
  imports = [
    ./nh.nix
    ./nixpkgs.nix
    ./substituters.nix
  ];

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };
}

