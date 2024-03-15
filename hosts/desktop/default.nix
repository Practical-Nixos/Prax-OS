{
  pkgs,
  self,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../system/core/boot.nix
    ../../system/core/security.nix
    ../../system/core/users.nix
    ../../system/core/default.nix

    ../../system/hardware/bluetooth.nix
    ../../system/hardware/opengl.nix
    ../../system/hardware/specializations.nix

    ../../system/network/avahi.nix
    ../../system/network/network.nix
    ../../system/network/nfs.nix
    ../../system/network/tailscale.nix

    ../../system/programs/gaming/retroarch.nix
    ../../system/programs/gaming/gamemode.nix
    ../../system/programs/gaming/steam.nix

    ../../system/programs/fonts.nix
    ../../system/programs/home-manager.nix

    ../../system/services
    ../../system/services/location.nix
    ../../system/services/pipewire.nix
  ];

  networking.hostName = "Prax-OS";

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;

  hardware = {
    opentabletdriver.enable = true;
  };



  security.tpm2.enable = true;

  services = {
    # for SSD/NVME
    fstrim.enable = true;
  };
}
