{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;
    configDir = ./config;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      libdbusmenu-gtk3
      accountsservice
    ];
  };
}
