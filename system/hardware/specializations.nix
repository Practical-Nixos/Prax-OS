{inputs, ...}:

{
imports = [inputs.matugen.nixosModules.default];
      specialisation = {
    light = {
      inheritParentConfig = true;
      configuration.programs.matugen.variant = "light";
    };
    dark = {
      inheritParentConfig = true;
      configuration.programs.matugen.variant = "dark";
    };
  };
}
