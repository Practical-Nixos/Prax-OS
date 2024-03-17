{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.kmonad.nixosModules.default
  ];

  # keyboard remapping
  services.kmonad = {
    enable = true;
    package = inputs.kmonad.packages.${pkgs.system}.default;
    keyboards = {
      one2mini = {
        device = "/dev/input/by-id/usb-HS6209_2.4G_Wireless-Receiver_No.161-0047-5-event-kbd";
        defcfg = {
          enable = true;
          fallthrough = true;
          allowCommands = false;
        };
        config = builtins.readFile (./. + "/main.kbd");
      };
    };
  };
}
