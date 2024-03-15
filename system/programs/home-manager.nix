{inputs, ...}: {
  imports = [
    inputs.hm.nixosModules.default
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  programs = {
    # make HM-managed GTK stuff work
    dconf.enable = true;
  };
}
