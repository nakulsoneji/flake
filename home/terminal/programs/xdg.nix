{
  pkgs,
  config,
  ...
}: {
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
        XDG_RECORDINGS_DIR = "${config.xdg.userDirs.videos}/Recordings";
      };
    };
  };

  home.packages = with pkgs; [
    xdg-utils
  ];
}
