{
  lib,
  pkgs,
  ...
}:
# networking configuration
{
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    wifi.powersave = true;
  };

  # nfs
  environment.systemPackages = with pkgs; [nfs-utils];
  boot.initrd = {
    supportedFilesystems = ["nfs"];
    kernelModules = ["nfs"];
  };
  fileSystems."/mnt/share" = {
    device = "192.168.254.200:/Mega-Archive";
    fsType = "nfs";
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
