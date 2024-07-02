{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 5;
      };
      background = [
        {
          path = "~/Pictures/wallpapers/nix-black-4k.png";
          blur_passes = 3;
          blur_size = 5;
        }
      ];
      label = [
        {
          text = "cmd[update:1000] echo \"<span foreground='##cdd6f4'>$(date +'%-I:%M %p')</span>\"";
          font_family = "JetBrainsMono Nerd Font";
          font_size = 60;
          text_align = "center";
          position = "0, 40";
          valign = "center";
          halign = "center";
        }
        {
          text = "<span foreground='##cdd6f4'>Hello, <span foreground='##89b4fa'>$USER</span></span>";
          text_align = "center";
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 0";
          font_size = 35;
          valign = "center";
          halign = "center";
        }
      ];
      input-field = [
        {
          size = "250, 50";
          position = "0, -80";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(30, 30, 46)";
          inner_color = "rgb(205, 214, 244)";
          outer_color = "rgb(137, 180, 250)";
          check_color = "rgb(137, 180, 250)";
          fail_color = "rgb(243, 139, 168)";
          outline_thickness = 0;
          placeholder_text = "<i><span foreground='##6c7086'>Enter Password...</span></i>";
          rounding = -1;
          font_size = 35;
          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
