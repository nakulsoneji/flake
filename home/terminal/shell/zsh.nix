{pkgs, ...}: {
  home.packages = with pkgs; [
    pure-prompt
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    localVariables = {
      ZSH_AUTOSUGGEST_STRATEGY = ["history" "completion"];
    };
    shellAliases = {
      vim = "nvim";
      v = "fd --hidden --type f --exclude .git | fzf --height 40% --reverse | xargs nvim";
    };
    initExtra = ''
      autoload -U promptinit; promptinit
      prompt pure

      bindkey '^f' autosuggest-accept
      bindkey '^p' history-substring-search-up
      bindkey '^n' history-substring-search-down
    '';
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      "ssh-agent"
    ];
  };
}
