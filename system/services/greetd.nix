{
  pkgs,
  lib,
  config,
  ...
}: {
  services.greetd = let
    tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
    tuigreet-theme = "border=blue;text=white;prompt=blue;time=blue;action=blue;button=yellow;container=black;input=white";
    tuigreet-time-format = "%a, %b %-d %-I:%m %p";
    hyprland-session = "${config.programs.hyprland.package}/share/wayland-sessions";
    command = "${tuigreet} -r --time-format ${tuigreet-time-format} --issue --remember-session --theme ${tuigreet-theme} -s ${hyprland-session}";
    session = {
      inherit command;
      user = "greeter";
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
    fprintAuth = false;
  };
}
