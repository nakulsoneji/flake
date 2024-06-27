{
  lib,
  pkgs,
  ...
}: {
  # can put in startup if i want to
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  networking.networkmanager.enable = true;

  services = {
    openssh.enable = true;
  };

  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
}
