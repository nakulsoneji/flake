{
  pkgs,
  inputs,
  ...
}: let
  system = "x86_64-linux";
  extensions = inputs.nix-vscode-extensions.extensions.${system};
  vsc-extensions = extensions.vscode-marketplace;
in {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      ms-python.python
      ms-python.vscode-pylance
      vscodevim.vim
    ];

    userSettings = {
      "extensions.autoCheckUpdates" = false;
      "update.mode" = "none";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.fontSize" = 13;
      "terminal.integrated.fontSize" = 13;
      "window.zoomLevel" = 1;
      "editor.fontLigatures" = true;
    };
  };
}
