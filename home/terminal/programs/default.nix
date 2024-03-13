{
  pkgs,
  self,
  ...
}: {
  imports = [
    ./bat.nix
    #./btop.nix
    ./cli.nix
    ./git.nix
    ./nix.nix
    ./skim.nix
    ./transient-services.nix
    ./yazi
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    tmux
    self.packages.${pkgs.system}.nvchad
  ];
}
