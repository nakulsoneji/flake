{lib, ...}: {
  imports = [
    ./boot.nix
    ./users.nix
    ./security.nix
  ];

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  time.timeZone = lib.mkDefault "America/Los_Angeles";

  # slightly modified version of catppuccin's own 16 terminal colors from their terminal themes
  console.colors = [
    "1e1e2e" # 0 base
    "f38ba8" # 1 red
    "a6e3a1" # 2 green
    "f9e2af" # 3 yellow
    "89b4fa" # 4 blue
    "f5c2e7" # 5 pink
    "94e2d5" # 6 teal
    "9399b2" # 7 overlay2
    "585b70" # 8 surface2
    "f38ba8" # 9 red
    "a6e3a1" # 10 green
    "f9e2af" # 11 yellow
    "89b4fa" # 12 blue
    "f5c2e7" # 13 pink
    "94e2d5" # 14 cyan
    "cdd6f4" # 15 text
  ];

  system.stateVersion = lib.mkDefault "23.11";

  zramSwap.enable = true;
}
