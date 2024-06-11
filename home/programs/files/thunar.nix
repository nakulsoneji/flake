{pkgs, ...}: {
  home.packages = with pkgs.xfce; [
    (thunar.override {
      thunarPlugins = with pkgs.xfce; [
        thunar-volman
        thunar-archive-plugin
      ];
    })
  ];
}
