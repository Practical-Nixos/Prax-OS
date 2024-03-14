{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.prax;
  directionArg =
    if cfg.direction == ""
    then ""
    else "--direction=${cfg.direction}";
in {
  options.prax = {
    desktop = lib.mkOption {
      default = "gnome";
      type = lib.types.str;
    };
    form = lib.mkOption {
      default = "desktop";
      type = lib.types.str;
    };

  };
}
