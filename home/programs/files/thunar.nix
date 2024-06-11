{pkgs, ...}: {
  home.packages = with pkgs.xfce; [
    (thunar.override {
      thunarPlugins = with pkgs; [
        xfce.thunar-volman
        xfce.thunar-archive-plugin
        gnome.gvfs
      ];
    })
  ];
}
