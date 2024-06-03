{ pkgs, ... }: {
  users.users.nakul = {
    isNormalUser = true;
    description = "Nakul";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}

