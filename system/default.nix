let
  core = [
    ./core/boot.nix
    ./core/security.nix
    ./core/users.nix
    ./core/default.nix

    ./hardware/bluetooth.nix
    ./hardware/opengl.nix
    ./hardware/specializations.nix
    ./hardware/keyboard/colemak.nix

   # ./network/avahi.nix
    ./network/network.nix
   # ./network/nfs.nix
   # ./network/tailscale.nix

    ./programs/gaming/retroarch.nix
    ./programs/gaming/gamemode.nix
    ./programs/gaming/steam.nix

    ./programs/fonts.nix
    ./programs/home-manager.nix
    ./programs/xdg.nix

    ./services
    ./services/location.nix
    ./services/pipewire.nix

  ];

  laptop =
    [
      ./hardware/bluetooth.nix
      ./services/backlight.nix
      ./services/power.nix
    ];
  gnome =
    core
    ++ [
    ./desktops/gnome.nix
    ];
 plasma =
    core
    ++ [
    ./desktops/plasma.nix
    ];
   hyprland =
    core
    ++ [
    ./desktops/hyprland.nix
    ./services/gnome-services.nix
    ./services/greetd.nix
    ];
in {
  inherit core laptop gnome plasma hyprland;
}
