{
  flake.nixosModules = {
    theme = import ./theme;
    settings = import ./settings;
    variables = import ./variables;
  };
}
