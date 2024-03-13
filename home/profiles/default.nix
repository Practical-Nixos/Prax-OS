{
  self,
  inputs,
  ...
}: let
  # get these into the module system
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "cmde@PraxBox" = [
      ../.
      ./PraxBox
    ];
    "cmde@thinkpad" = [
      ../.
      ./thinkpad
    ];
    server = [
      ../.
      ./server
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  # we need to pass this to NixOS' HM module
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {
      "cmde_PraxBox" = homeManagerConfiguration {
        modules = homeImports."cmde@PraxBox";
        inherit pkgs extraSpecialArgs;
      };

      "cmde_thinkpad" = homeManagerConfiguration {
        modules = homeImports."cmde@thinkpad";
        inherit pkgs extraSpecialArgs;
      };

      server = homeManagerConfiguration {
        modules = homeImports.server;
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
