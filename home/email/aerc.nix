{
  programs.aerc = {
    enable = true;
    extraConfig = {
      general.unsafe-accounts-conf = true;
      filters = {
        "text/html" = "html";
        "text/plain" = "colorize";
      };
    };
  };
}
