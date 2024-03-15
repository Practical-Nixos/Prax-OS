{
  config,
  pkgs,
  self,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../system/core
    ../../system/core/boot.nix
    ../../system/core/security.nix
    ../../system/core/users.nix

    ../../system/hardware/bluetooth.nix
    ../../system/hardware/opengl.nix
    ../../system/hardware/specializations.nix

    ../../system/network/avahi.nix
    ../../system/network/network.nix
    ../../system/network/nfs.nix
    ../../system/network/tailscale.nix

    ../../system/programs/gaming/gamemode.nix
    ../../system/programs/gaming/steam.nix

    ../../system/programs/fonts.nix
    ../../system/programs/home-manager.nix

    ../../system/services
    ../../system/services/backlight.nix
    ../../system/services/greetd.nix
    ../../system/services/gnome-services.nix
    ../../system/services/location.nix
    ../../system/services/pipewire.nix
    ../../system/services/power.nix
  ];

  networking.hostName = "Prax-OS";

  services = {
    # for SSD/NVME
    fstrim.enable = true;
  };
}
