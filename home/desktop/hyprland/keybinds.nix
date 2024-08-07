{pkgs, ...}: {
  "$mod" = "SUPER";

  bind = [
    "$mod SHIFT, P, exec, ${pkgs.hyprpicker}/bin/hyprpicker -a"
    "$mod SHIFT, S, exec, wayland-screenshot r"
    "$mod, Print, exec, wayland-screenshot f"
    "$mod SHIFT, Print, exec, bash -c printenv &> '/home/nakul/logenv'"
    "$mod SHIFT, R, exec, wayland-record r"
    # "$mod SHIFT, Print, wayland-record f"
    "$mod, N, exec, dunstctl context"
    "$mod SHIFT, N, exec, dunstctl close-all"
    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    "$mod, Q, exec, footclient"
    "$mod, C, killactive,"
    "$mod SHIFT, W, movetoworkspace, special:scratchpad"
    "$mod, W, togglespecialworkspace, scratchpad"
    "$mod, M, exit,"
    "$mod, E, exec, thunar"
    "$mod, V, togglefloating,"
    "$mod, R, exec, pkill -x fuzzel || fuzzel"
    "$mod, P, pseudo,"
    "$mod, S, togglesplit,"
    "$mod, F, fullscreen,"

    "$mod, h, movefocus, l"
    "$mod, j, movefocus, d"
    "$mod, k, movefocus, u"
    "$mod, l, movefocus, r"
    "$mod SHIFT, h, movewindow, l"
    "$mod SHIFT, j, movewindow, d"
    "$mod SHIFT, k, movewindow, u"
    "$mod SHIFT, l, movewindow, r"

    "$mod, 1, workspace, 1"
    "$mod, 2, workspace, 2"
    "$mod, 3, workspace, 3"
    "$mod, 4, workspace, 4"
    "$mod, 5, workspace, 5"
    "$mod, 6, workspace, 6"
    "$mod, 7, workspace, 7"
    "$mod, 8, workspace, 8"
    "$mod, 9, workspace, 9"
    "$mod, 0, workspace, 10"
    "$mod SHIFT, 1, movetoworkspace, 1"
    "$mod SHIFT, 2, movetoworkspace, 2"
    "$mod SHIFT, 3, movetoworkspace, 3"
    "$mod SHIFT, 4, movetoworkspace, 4"
    "$mod SHIFT, 5, movetoworkspace, 5"
    "$mod SHIFT, 6, movetoworkspace, 6"
    "$mod SHIFT, 7, movetoworkspace, 7"
    "$mod SHIFT, 8, movetoworkspace, 8"
    "$mod SHIFT, 9, movetoworkspace, 9"
    "$mod SHIFT, 0, movetoworkspace, 10"
    "$mod, mouse_down, workspace, e+1"
    "$mod, mouse_up, workspace, e-1"
  ];

  binde = [
    ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
    ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
  ];

  bindm = [
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];
}
