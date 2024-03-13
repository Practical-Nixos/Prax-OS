{
  lib,
  pkgs,
  ...
}:
# networking configuration
{
  imports = [
    ./avahi.nix
    ./tailscale.nix
    #./nfs.nix
  ];

  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    wifi.powersave = true;
  };

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };

    # DNS resolver
    resolved.enable = true;
  };
  networking.firewall = {
    enable = true;
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
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce true;
}
