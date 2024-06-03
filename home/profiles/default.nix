{ self, inputs, ... }: 
let 
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
  _module.args = { inherit homeImports; };

  flake = {
    homeConfigurations = {
      "nakul@muse" = homeManagerConfiguration {
        modules = homeImports."nakul@muse";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}

