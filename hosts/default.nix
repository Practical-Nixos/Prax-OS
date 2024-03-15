{
  self,
  config,
  inputs,
  homeImports,
  lib,
  ...
}: {
  imports = [../settings.nix];
  flake.nixosConfigurations = let
    # shorten paths
    inherit (inputs.nixpkgs.lib) nixosSystem;
    mod = "${self}/system";

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
    desktop = nixosSystem {
      inherit specialArgs;
      modules = [
        ./desktop

        "${mod}/desktops/${config.prax.desktop}.nix"

        {
          home-manager = {
            users.cmde.imports = homeImports.desktop;
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    };
    laptop = nixosSystem {
      inherit specialArgs;
      modules = [
        ./laptop

        "${mod}/desktops/${config.prax.desktop}.nix"

        {
          home-manager = {
            users.cmde.imports = homeImports.desktop;
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    };
  };
}
