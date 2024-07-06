{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      fontSize = "12";
    })
    bibata-cursors
  ];

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    theme = "catppuccin-mocha";
    settings = {
      Theme = {
        CursorTheme = "Bibata-Modern-Classic";
        CursorSize = 22;
      };
    };
  };

  security.pam.services.sddm = {
    enableGnomeKeyring = true;
    fprintAuth = false;
  };

  security.pam.services.login = {
    enableGnomeKeyring = true;
    fprintAuth = false;
  };
}
