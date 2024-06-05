{pkgs, ...}: {
  home.packages = with pkgs; [
    zsh-powerlevel10k
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
    };
    initExtra = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ~/.p10k.zsh
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
  home.file.".p10k.zsh".source = ./zsh/p10k.zsh;
}
