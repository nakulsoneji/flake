{pkgs, ...}: {
  imports = [
    ./hyprland-env.nix
    ./hyprpaper.nix
    ./swappy.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

  home.packages = with pkgs; [
    grim
    slurp
    wf-recorder
    swappy
    wl-clipboard
    hyprpicker
    hyprpaper
    brightnessctl
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings =
      (import ./catppuccin-hyprland.nix)
      // (import ./keybinds.nix)
      // {
        monitor = ",highres,auto,1";

        exec-once = [
          "brightnessctl set 50%"
          "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%"
          "blueman-applet"
          "waybar"
          "dunst"
          "hyprpaper"
        ];
        debug.disable_logs = false;
        windowrulev2 = [
          "float, class:^(org.kde.polkit-kde-authentication-agent-1)$"
          "float, title:^(glfw_window.*)$"
          "float, title:^(QEMU)$"
          "float, class:^(pavucontrol|.blueman-manager-wrapped)$"
          "size 40% 40%, class:^(pavucontrol|.blueman-manager-wrapped)$"
        ];
        layerrule = [
          "animation popin,selection"
          "animation popin,launcher"
          "noanim,hyprpicker"
        ];
        workspace = [
          "1, on-created-empty: firefox"
          "special:scratchpad, on-created-empty: discord"
        ];
        input = {
          kb_layout = "us";
          follow_mouse = 1;
          touchpad = {
            natural_scroll = "yes";
            disable_while_typing = "yes";
            scroll_factor = 0.2;
          };
          sensitivity = 0;
        };
        gestures = {
          workspace_swipe = true;
        };
        general = {
          gaps_in = 3;
          gaps_out = 6;
          border_size = 2;
          "col.active_border" = "$blue 45deg";
          "col.inactive_border" = "$surface2";
          no_border_on_floating = false;
          layout = "dwindle";
        };
        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          animate_manual_resizes = true;
          enable_swallow = true;
          swallow_regex = "^(kitty|footclient)$";
        };
        decoration = {
          rounding = 0;
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          blur = {
            enabled = true;
            size = 8;
            passes = 2;
            new_optimizations = true;
            xray = true;
            noise = 0;
            ignore_opacity = true;
            contrast = 0.95;
          };
        };
        animations = {
          enabled = true;
          # animations stolen from end-4 dots
          bezier = [
            # "wind, 0.05, 0.9, 0.1, 1.05"
            # "winIn, 0.1, 1.1, 0.1, 1.1"
            # "winOut, 0.3, -0.3, 0, 1"
            # "liner, 1, 1, 1, 1"
            "linear, 0, 0, 1, 1"
            "md3_standard, 0.2, 0, 0, 1"
            "md3_decel, 0.05, 0.7, 0.1, 1"
            "md3_accel, 0.3, 0, 0.8, 0.15"
            "overshot, 0.05, 0.9, 0.1, 1.1"
            "crazyshot, 0.1, 1.5, 0.76, 0.92 "
            "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
            "menu_decel, 0.1, 1, 0, 1"
            "menu_accel, 0.38, 0.04, 1, 0.07"
            "easeInOutCirc, 0.85, 0, 0.15, 1"
            "easeOutCirc, 0, 0.55, 0.45, 1"
            "easeOutExpo, 0.16, 1, 0.3, 1"
            "softAcDecel, 0.26, 0.26, 0.15, 1"
            "md2, 0.4, 0, 0.2, 1 # use with .2s duration"
          ];
          animation = [
            # "windows, 1, 6, wind, slide"
            # "windowsIn, 1, 6, winIn, slide"
            # "windowsOut, 1, 5, winOut, slide"
            # "windowsMove, 1, 5, wind, slide"
            # "border, 1, 1, liner"
            # "borderangle, 1, 30, liner, loop"
            # "fade, 1, 10, default"
            # "workspaces, 1, 5, wind"
            "windows, 1, 3, md3_decel, popin 60%"
            "windowsIn, 1, 3, md3_decel, popin 60%"
            "windowsOut, 1, 3, md3_accel, popin 60%"
            # "border, 1, 10, default"
            "fade, 1, 3, md3_decel"
            # animation = layers, 1, 2, md3_decel, slide
            "layersIn, 1, 3, menu_decel, slide"
            "layersOut, 1, 1.6, menu_accel"
            "fadeLayersIn, 1, 2, menu_decel"
            "fadeLayersOut, 1, 4.5, menu_accel"
            "workspaces, 1, 7, menu_decel, slide"
            # animation = workspaces, 1, 2.5, softAcDecel, slide
            # animation = workspaces, 1, 7, menu_decel, slidefade 15%
            # animation = specialWorkspace, 1, 3, md3_decel, slidefadevert 15%
            "specialWorkspace, 1, 3, md3_decel, slidevert"
          ];
        };
        dwindle = {
          no_gaps_when_only = false;
          pseudotile = true;
          preserve_split = true;
        };
      };
  };

  home.file."Pictures/wallpapers" = {
    source = ./wallpapers;
  };

  xdg.configFile."hypr/scripts" = {
    source = ./scripts;
  };
}
