{
  self,
  inputs,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    specialArgs = {inherit inputs self;};
  in {
    "muse" = nixosSystem {
      inherit specialArgs;
      modules = [
        ./muse
        ../system
        ../system/programs/hyprland.nix
        ../system/programs/steam.nix
        ../system/programs/gamemode.nix
        ../system/services/greetd.nix
        {
          home-manager = {
            users.nakul.imports = homeImports."nakul@muse";
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    };
  };
}
