{
  lib,
  pkgs,
  ...
}:
# networking configuration
{
  networking.networkmanager = {
    enable = false;
    #dns = "systemd-resolved";
    #wifi.powersave = true;
  };
  networking.wireless.enable = true;
  networking.wireless.networks.Ziply-B460.pskRaw = "69b1c7ad9376ac73216a21a55f50f3f143c3ec4f4811f9a0eceed6e8a087b78d";

  services = {
    openssh = {
      enable = true;
      #settings.UseDns = true;
    };

    # DNS resolver
    resolved.enable = true;
  };
  networking.firewall = {
    enable = false;
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
  };
  # wait for network startup
  # systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
}
