{pkgs, ...}: {
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 21;
  };

  # makes the theme light for some reason (maybe bc default dark theme isn't installed?), dont do this.
  # dconf.settings = {
  #   "org/gnome/desktop/interface" = {
  #     color-scheme = "prefer-dark";
  #     gtk-theme = "Catppuccin-Mocha-Standard-Blue-Dark";
  #   };
  # };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
      };
    };
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders;
      name = "Papirus";
    };
    font = {
      package = pkgs.noto-fonts;
      name = "Noto Sans";
      size = 11;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gtk2";
  };
}
