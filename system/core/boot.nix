{pkgs, ...}: {
  boot = {
    initrd.verbose = false;
    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
    ];
    loader = {
      # systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub = {
        efiSupport = true;
        useOSProber = true;
        device = "nodev";
        theme = pkgs.catppuccin-grub;
        splashImage = ../../home/desktop/hyprland/wallpapers/nix-black-4k.png;
      };
    };
    plymouth = {
      enable = true;
      themePackages = with pkgs; [
        (catppuccin-plymouth.override {
          variant = "mocha";
        })
      ];
      theme = "catppuccin-mocha";
    };
    tmp = {
      cleanOnBoot = true;
    };
  };
}
