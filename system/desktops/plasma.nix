{
  pkgs,
  lib,
  ...
}: {
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      plasma5.enable = true;
    };
    displayManager = {
      defaultSession = "plasmawayland";
      sddm.enable = true;
    };
  };

  qt.platformTheme = lib.mkForce "kde";

  environment.plasma6.excludePackages = with pkgs.libsForQt5; [
    kdeconnect-kde
  ];
}
