{
  config,
  pkgs,
  self,
  ...
}: {
  imports = [./hardware-configuration.nix];
  networking.hostName = "thinkpad";
}
