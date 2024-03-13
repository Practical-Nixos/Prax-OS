{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./conf
    ./swaylock.nix
    ./wlogout.nix
    ./swayidle.nix

    ../../editors/helix

    ../../programs
    ../../programs/stylix

    ../../services/media/mpd.nix

    ../../services/system/power-monitor.nix
    ../../services/system/udiskie.nix
    ../../services/system/mako.nix

    ../../terminal/emulators/kitty.nix
  ];

  services.poweralertd.enable = true;

  home.packages = with pkgs; [
    # screenshot
    grim
    slurp
    swaybg
    waybar
    rofi
    imv
    swaybg
    poweralertd

    # utils
    wl-clipboard
    wl-screenrec
    wlr-randr
  ];

  # make stuff work on wayland
  home.sessionVariables = {
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
