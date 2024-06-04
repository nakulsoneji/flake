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
