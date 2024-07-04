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
      cat = "bat";
    };
    # autostart ssh agent
    initExtra = ''
      if [ $(ps ax | grep "[s]sh-agent" | wc -l) -eq 0 ] ; then
          eval $(ssh-agent -s) > /dev/null
      fi
      autoload -U promptinit; promptinit
      prompt pure

      bindkey '^f' autosuggest-accept
      bindkey '^p' history-substring-search-up
      bindkey '^n' history-substring-search-down

      nitch
    '';
  };
}
