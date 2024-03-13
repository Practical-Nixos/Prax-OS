{
  self,
  inputs,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    # shorten paths
    inherit (inputs.nixpkgs.lib) nixosSystem;
    mod = "${self}/system";

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
    PraxBox = nixosSystem {
      inherit specialArgs;
      modules = [
        "${mod}"
        ./PraxBox

        #Steam, Fufexan's GameMode, Emulators. Very Optional.
        "${mod}/programs/gaming"

        "${mod}/desktops/plasma.nix"

        {
          home-manager = {
            users.cmde.imports = homeImports."cmde@PraxBox";
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    };

    thinkpad = nixosSystem {
      inherit specialArgs;

      modules = [
        "${mod}"
        ./thinkpad

        "${mod}/desktops/plasma.nix"

        {
          home-manager = {
            users.cmde.imports = homeImports."cmde@thinkpad";
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    };
  };
}
