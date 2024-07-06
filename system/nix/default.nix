{pkgs, ...}: {
  imports = [
    ./nh.nix
    ./nixpkgs.nix
    ./substituters.nix
  ];

  # git is needed for flakes
  environment.systemPackages = with pkgs; [
    git
  ];

  environment.variables = {
    MY_TEST = "hello";
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  nix.optimise = {
    automatic = true;
    dates = ["weekly"];
  };
}
