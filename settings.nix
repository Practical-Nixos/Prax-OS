{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./modules/settings];

  config.prax = {
    desktop = "hyprland";
    form = "desktop";
  };
}
