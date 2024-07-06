{
  pkgs,
  config,
  ...
}: {
  services.greetd = let
    tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
    tuigreet-theme = "border=blue;text=white;prompt=blue;time=blue;action=blue;button=yellow;container=black;input=white";
    tuigreet-time-format = "%a, %b %-d %-I:%m %p";
    # apparently this exists and shows all x11 and wayland sessions (https://ryjelsum.me/homelab/greetd-session-choose/)
    sessions = "${config.services.xserver.displayManager.sessionData.desktops}/share/xsessions:${config.services.xserver.displayManager.sessionData.desktops}/share/wayland-sessions";
    command = "${tuigreet} -r --asterisks --time --time-format '${tuigreet-time-format}' --remember-session --theme ${tuigreet-theme} -s ${sessions}";
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
