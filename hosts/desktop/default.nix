{
  pkgs,
  self,
  # inputs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;

  hardware = {
    opentabletdriver.enable = true;
  };

  networking.hostName = "Prax-OS";

  security.tpm2.enable = true;

  services = {
    # for SSD/NVME
    fstrim.enable = true;
  };
}
