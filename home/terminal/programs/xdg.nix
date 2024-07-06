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
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = ["thunar.desktop"];
        "text/html" = ["firefox.desktop"];
      };
    };
  };

  home.packages = with pkgs; [
    xdg-utils
  ];
}
