{
  xdg.configFile."swappy/config".text = ''
    [Default]
    save_dir=$XDG_SCREENSHOTS_DIR
    save_filename_format=screenshot-%s.png
    show_panel=false
    line_size=5
    text_size=20
    text_font=JetBrainsMono Nerd Font
    paint_mode=brush
    early_exit=false
    fill_shape=false
  '';
}
