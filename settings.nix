{ config, lib, pkgs, ... }:

{
  imports = [./modules/settings];

  config.prax = {
    desktop = "plasma";
    form = "desktop";
  };
}
