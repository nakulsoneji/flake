{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden-desktop
    bitwarden-cli
  ];

  # rbw is currently bugged, using official cli for now (https://github.com/doy/rbw/issues/182)
  # this should be fixed when https://github.com/NixOS/nixpkgs/pull/321427 is merged
  programs.rbw = {
    enable = true;
    settings = {
      email = "nakulsoneji@gmail.com";
      base_url = "https://vault.bitwarden.com";
      identity_url = "https://identity.bitwarden.com";
      notifications_url = "https://notifications.bitwarden.com";
      lock_timeout = 3600;
      sync_interval = 3600;
      pinentry = pkgs.pinentry-tty;
    };
  };
}
