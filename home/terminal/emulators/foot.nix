{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font-13:demibold";
        font-bold = "JetBrainsMono Nerd Font-13:bold";
        font-italic = "JetBrainsMono Nerd Font-13:demibold:italic";
      };
      cursor = {
        style = "block";
        unfocused-style = "hollow";
      };
      key-bindings = {
        scrollback-up-page = "Control+Page_Up";
        scrollback-down-page = "Control+Page_Down";
        scrollback-up-half-page = "Control+u";
        scrollback-down-half-page = "Control+d";
        scrollback-up-line = "Control+k";
        scrollback-down-line = "Control+j";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      scrollback = {
        indicator-position = "none";
      };
      colors = {
        foreground = "cdd6f4";
        background = "1e1e2e";

        regular0 = "45475a";
        regular1 = "f38ba8";
        regular2 = "a6e3a1";
        regular3 = "f9e2af";
        regular4 = "89b4fa";
        regular5 = "f5c2e7";
        regular6 = "94e2d5";
        regular7 = "bac2de";

        bright0 = "585b70";
        bright1 = "F38ba8";
        bright2 = "A6e3a1";
        bright3 = "F9e2af";
        bright4 = "89b4fa";
        bright5 = "F5c2e7";
        bright6 = "94e2d5";
        bright7 = "A6adc8";

        selection-foreground = "cdd6f4";
        selection-background = "414356";

        search-box-no-match = "11111b f38ba8";
        search-box-match = "cdd6f4 313244";

        jump-labels = "11111b fab387";
        urls = "89b4fa";
      };
    };
  };
}
