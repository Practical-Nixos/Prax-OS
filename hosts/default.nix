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

        "${mod}/desktops/gnome.nix"

        inputs.hm.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            #users.cmde.imports = homeImports."cmde@PraxBox";
            users.cmde.imports = [../home/default.nix];
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    };

    # rog = nixosSystem {
    #   inherit specialArgs;
    #   modules =
    #     laptop
    #     ++ [
    #       ./rog
    #       "${mod}/core/lanzaboote.nix"

    #       "${mod}/programs/gamemode.nix"
    #       "${mod}/programs/hyprland.nix"
    #       "${mod}/programs/steam.nix"

    #       "${mod}/services/kmonad"
    #       {home-manager.users.cmde.imports = homeImports."cmde@rog";}
    #     ];
    # };
  };
}
