{pkgs, ...}: {
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        ControllerMode = "bredr";
        FastConnectable = true;
        JustWorksRepairing = "always";
        Experimental = true;
      };
    };
  };

  services.blueman.enable = true;

  # https://github.com/NixOS/nixpkgs/issues/114222
  systemd.user.services.telephony_client.enable = false;
}
