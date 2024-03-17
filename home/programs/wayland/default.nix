{
  pkgs,
  self,
  ...
}:
# Wayland config
{
  imports = [
    ./hyprlock.nix
    ./wlogout.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    # screenshot
    grim
    slurp
    rofi-wayland
    waybar

    # utils
    self.packages.${pkgs.system}.wl-ocr

    wl-clipboard
    wl-screenrec
    wlr-randr
  ];

  # make stuff work on wayland
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
