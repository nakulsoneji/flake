{pkgs, ...}: {
  imports = [
    ./social/discord.nix
    ./browsers/firefox.nix
  ];
}
