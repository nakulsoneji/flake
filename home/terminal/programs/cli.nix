{
  programs.git = {
    enable = true;
    userName = "nakulsoneji";
    userEmail = "nakulsoneji@gmail.com";
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    colors = {
      bg = "#1e1e2e";
      "bg+" = "#313244";
      hl = "#f38ba8";
      "hl+" = "#f38ba8";
      fg = "#cdd6f4";
      "fg+" = "#cdd6f4";

      spinner = "#f5e0dc";
      header = "#f38ba8";
      info = "#cba6f7";
      pointer = "#f5e0dc";
      marker = "#f5e0dc";
      prompt = "#cba6f7";
    };
    defaultCommand = "fd --type f";
    changeDirWidgetCommand = "fd --type d";
    fileWidgetCommand = "fd --type f";
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd j"
    ];
  };

  programs.fd = {
    enable = true;
    hidden = true;
  };

  programs.fastfetch = {
    enable = true;
  };
}
