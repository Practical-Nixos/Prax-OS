{
  lib,
  self,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.matugen.nixosModules.default
    inputs.nix-index-db.hmModules.nix-index
    inputs.hyprlock.homeManagerModules.default
    inputs.hypridle.homeManagerModules.default
    self.nixosModules.theme

    # editors
    ./editors/helix
    ./editors/neovim
    ./editors/vscode

    # programs
    ./programs

    ./desktops/gnome

    # media services
    ./services/media/playerctl.nix

    # system services
    ./services/system/power-monitor.nix

    # terminal emulators
    ./specialisations.nix
    ./terminal
  ];

  home = {
    username = "cmde";
    homeDirectory = "/home/cmde";
    stateVersion = "23.11";
    extraOutputsToInstall = ["doc" "devdoc"];
  };

  # disable manuals as nmd fails to build often
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  # let HM manage itself when in standalone mode
  programs.home-manager.enable = true;

  nixpkgs.overlays = [
    (final: prev: {
      lib = prev.lib // {colors = import "${self}/lib/colors" lib;};
    })
  ];
}
