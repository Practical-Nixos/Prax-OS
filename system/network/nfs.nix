{
  lib,
  pkgs,
  ...
}:
# networking configuration
{
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
}
