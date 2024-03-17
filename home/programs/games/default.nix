{
  pkgs,
  inputs,
  ...
}:
# games
{
  home.packages = with pkgs; [
    #inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    gamescope
    mangohud
    #prismlauncher
    (lutris.override {extraPkgs = p: [p.wine];})
    winetricks
    wine
  ];
}
