{lib, pkgs, ...}:
# default configuration shared by all hosts
{
  imports = [
    ../nix
    ../programs/zsh.nix
  ];

  i18n = {
    defaultLocale = "en_US.UTF-8";
    # saves space
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
    ];
  };

  environment.systemPackages = with pkgs; [
    cmake
    gcc
    gnumake
    libtool
  ];
  # don't touch this
  system.stateVersion = lib.mkDefault "23.11";

  time.timeZone = lib.mkDefault "America/Los_Angeles";

  # compresses half the ram for use as swap
  zramSwap.enable = true;
}
