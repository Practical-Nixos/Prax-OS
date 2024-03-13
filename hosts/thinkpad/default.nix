{
  config,
  pkgs,
  self,
  ...
}: {
  imports = [./hardware-configuration.nix];

  # kernel
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [acpi_call];
    kernelModules = ["acpi_call"];
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.hostName = "thinkpad";

  services = {
    kmonad.keyboards = {
      rog = {
        device = "/dev/input/by-path/pci-0000:00:14.0-usb-0:8:1.0-event-kbd";
        defcfg = {
          enable = true;
          fallthrough = true;
          allowCommands = false;
        };
        config = builtins.readFile "${self}/system/services/kmonad/main.kbd";
      };
    };

    xserver.videoDrivers = ["nvidia"];
  };
}
