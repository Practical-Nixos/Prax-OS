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

    inherit (import "${self}/system") core laptop gnome plasma hyprland;

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
    Prax-OS = nixosSystem {
      inherit specialArgs;
      modules =
        hyprland
          ++
          [
        ./desktop

        "${mod}/services/kmonad"

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
