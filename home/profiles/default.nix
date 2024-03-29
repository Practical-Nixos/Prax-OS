{
  self,
  inputs,
  ...
}: let
  # get these into the module system
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    desktop = [
      ../.
      ./desktop
    ];
    laptop = [
      ../.
      ./laptop
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  # we need to pass this to NixOS' HM module
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {
      "desktop" = homeManagerConfiguration {
        modules = homeImports.desktop;
        inherit pkgs extraSpecialArgs;
      };
    };
    homeConfigurations = {
      "laptop" = homeManagerConfiguration {
        modules = homeImports.laptop;
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
