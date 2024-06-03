{ pkgs, ... }: {
  home.packages = with pkgs; [
    pure-prompt
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    localVariables = {
      ZSH_AUTOSUGGEST_STRATEGY = [ "history" "completion" ];
    };
    shellAliases = {
      vim = "nvim";
    };
    initExtra = ''
      bindkey '^f' autosuggest-accept
      bindkey '^p' history-substring-search-up
      bindkey '^n' history-substring-search-down
      autoload -U promptinit; promptinit
      prompt pure
    '';
  };
  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      "ssh-agent"
    ];
  };
}
