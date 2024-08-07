{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    defaultProfiles = ["high-quality"];
    scripts = with pkgs.mpvScripts; [
      mpris
      modernx-zydezu
      thumbfast
    ];
    config = {
      osd-bar = "no";
    };
  };

  home.packages = with pkgs; [
    yt-dlp
  ];
}
