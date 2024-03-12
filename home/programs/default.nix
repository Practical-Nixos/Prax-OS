{pkgs, ...}: {
  imports = [
    #./browsers/chromium.nix
    #./browsers/firefox.nix
    ./media
    ./gtk.nix
    ./office
    ./stylix
  ];

  home.packages = with pkgs; [
    brave

   # overskride
   # mission-center
  ];
}
