{pkgs, ...}: {
  # can potentially add spotify-player or spotify-tui
  home.packages = with pkgs; [
    spotify
  ];
}
