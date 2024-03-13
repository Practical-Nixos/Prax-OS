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

  networking.hostName = "PraxBox";

  security.tpm2.enable = true;

  services = {
    # for SSD/NVME
    fstrim.enable = true;

    #     kmonad.keyboards = {
    #       io = {
    #         name = "io";
    #         config = builtins.readFile "${self}/system/services/kmonad/main.kbd";
    #         device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
    #         defcfg = {
    #           enable = true;
    #           fallthrough = true;
    #           allowCommands = false;
    #         };
    #       };
    #     };
  };
}
