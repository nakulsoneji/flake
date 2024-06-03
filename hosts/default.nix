{ self, inputs, homeImports, ... }: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    specialArgs = { inherit inputs self; };
  in {
    "muse" = nixosSystem {
      inherit specialArgs;
      modules = [
        ./muse
        ../system
        ../system/programs/sddm.nix
        {
          home-manager = {
            users.nakul.imports = homeImports.muse;
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    };
  };
}
