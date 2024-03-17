{pkgs, ...}: {

  home.packages = with pkgs; [
    libreoffice
    xournalpp
    zoom-us
    nextcloud-client
  ];
}
