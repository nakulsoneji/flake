{pkgs, ...}: {
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 21;
  };

  # makes the theme light for some reason (maybe bc default dark theme isn't installed?), dont do this.
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      # they done broke catppuccin :sob; (the theme straight up doesnt work anymore)
      # name = "Catppuccin-Mocha-Standard-Blue-Dark";
      # package = pkgs.catppuccin-gtk.override {
      #   variant = "mocha";
      # };
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita-dark";
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
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };
}
