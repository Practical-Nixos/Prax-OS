{pkgs, ...}: {
  imports = [
    ../../editors/helix

    ../../programs

    ../../services/media/mpd.nix

    ../../services/system/kdeconnect.nix
  ];

  home.packages = with pkgs; [
    libsForQt5.kontact
  ];
}
