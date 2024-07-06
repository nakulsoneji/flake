{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "nakulsoneji";
    userEmail = "nakulsoneji@gmail.com";
  };

  # only using this to create repos through cli tbh
  programs.gh = {
    enable = true;
    # we are using ssh, this is not needed
    gitCredentialHelper = {
      enable = false;
      # this might be unnecessary, but whatever
      hosts = [];
    };
    settings = {
      git_protocol = "ssh";
      editor = "vim";
      prompt = "enable";
      aliases = {
        rc = "repo create";
      };
    };
  };
}
