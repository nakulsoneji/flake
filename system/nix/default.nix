{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./nh.nix
    ./nixpkgs.nix
    ./substituters.nix
  ];

  # git is needed for flakes
  environment.systemPackages = with pkgs; [
    git
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  nix.optimise = {
    automatic = true;
    dates = ["weekly"];
  };
}
