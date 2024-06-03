{
  self,
  inputs,
  ...
}: let
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "nakul@muse" = [
      ../.
      ./muse
    ];
  };

  inherit (inputs.home-manager.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  # this is here not to pass the input to hm, but rather the file that makes the hm configs
  _module.args = {inherit homeImports;};

  flake = {
    # note: this essentially does nothing, as we are using home-manager module, not standalone (see system/programs/home-manager.nix).
    # because of this, if you try to do `nix run nixpkgs#home-manager -- switch --flake .#nakul@muse` it will only apply until next reboot
    homeConfigurations = {
      "nakul@muse" = homeManagerConfiguration {
        modules = homeImports."nakul@muse";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
