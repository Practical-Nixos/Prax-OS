{
  imports = [
    ./gamemode.nix
    ./retroarch.nix
    ./steam.nix
  ];

  programs = {
    # make HM-managed GTK stuff work
    dconf.enable = true;
  };
}
