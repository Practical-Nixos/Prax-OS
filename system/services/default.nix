{pkgs, ...}: {
  imports = [
    ./location.nix
    ./pipewire.nix
  ];

  services = {
    dbus.implementation = "dbus";

    # profile-sync-daemon
    psd = {
      enable = true;
      resyncTimer = "10m";
    };
  };
}
