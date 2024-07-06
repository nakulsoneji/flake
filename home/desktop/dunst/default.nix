{pkgs, ...}: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        # TODO: get dynamic width to work (aka port back to dunstrc)
        ### Display ###;
        monitor = 0;
        follow = "none";
        ### Geometry ###;
        width = 300;
        height = 300;
        origin = "top-right";
        offset = "6x6";
        scale = 0;
        notification_limit = 20;
        ### Progress bar ###;
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = 0;
        icon_corner_radius = 0;
        indicate_hidden = "yes";
        transparency = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 2;
        frame_color = "#89B4FA";
        gap_size = 10;
        separator_color = "frame";
        sort = "yes";
        ### Text ###;
        font = "JetBrainsMono Nerd Font 11";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        ### Icons ###;
        enable_recursive_icon_lookup = true;
        icon_theme = "Papirus";
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 128;
        ### History ###;
        sticky_history = "yes";
        history_length = 20;
        ### Misc/Advanced ###;
        dmenu = "${pkgs.fuzzel}/bin/fuzzel -w 50 -l 5 --dmenu";
        browser = "${pkgs.xdg-utils}/bin/xdg-open";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 0;
        ignore_dbusclose = false;
        ### Wayland ###;
        force_xwayland = false;
        ### Legacy;
        force_xinerama = false;
        ### mouse;
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };
      experimental = {
        per_monitor_dpi = false;
      };
      urgency_low = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
      };
      urgency_normal = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
      };
      urgency_critical = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
        frame_color = "#FAB387";
      };
    };
  };

  # xdg.configFile."dunst".source = ./config;
}
