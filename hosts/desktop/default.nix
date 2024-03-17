{
  pkgs,
  self,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.kmonad.nixosModules.default
    ./hardware-configuration.nix
 ];

  networking.hostName = "Prax-OS";

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;

  hardware = {
    opentabletdriver.enable = true;
  };

  security.tpm2.enable = true;

  services = {
       kmonad.keyboards = {
      desktop = {
        name = "desktop";
        config = builtins.readFile "${self}/system/services/kmonad/main.kbd";
        device = "/dev/input/by-path/pci-0000:0a:00.3-usb-0:4:1.0-event-kbd";
        defcfg = {
          enable = true;
          fallthrough = true;
          allowCommands = false;
        };
      };
    };

 #for SSD/NVME
    fstrim.enable = true;
  };
}
