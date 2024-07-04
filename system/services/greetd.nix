{
  lib,
  config,
  ...
}: {
  services.greetd = let
    command = "${lib.getExe config.programs.hyprland.package}";
    session = {
      inherit command;
      user = "nakul";
    };
  in {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = session;
    };
  };

  security.pam.services.greetd = {
    enableGnomeKeyring = true;
  };
}
