{pkgs, ...}: {
  imports = [
    #./browsers/chromium.nix
    ./browsers/firefox.nix
    ./media
    ./gtk.nix
    ./office
    #./stylix
  ];
}
