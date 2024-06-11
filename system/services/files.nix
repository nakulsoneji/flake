{pkgs, ...}: {
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  # for ios devices https://nixos.wiki/wiki/IOS
  services.usbmuxd.enable = true;

  environment.systemPackages = with pkgs; [
    libimobiledevice
    ifuse
  ];
}
