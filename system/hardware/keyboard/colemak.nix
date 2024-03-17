{

  ...
}: {

  services = {
    keyd = {
    enable = true;
    keyboards.default.ids = [ "*" ];
    keyboards.default.settings = {
      main = {
        capslock = "backspace";

        e = "f";
        r = "p";
        t = "b";
        y = "j";
        u = "l";
        i = "u";
        o = "y";
        p = ";";
        
        s = "r";
        d = "s";
        f = "t";
        h = "m";
        j = "n";
        k = "e";
        l = "i";
        ";" = "o";
        v = "d";
        b = "v";
        n = "k";
        m = "h";
        };
      };
    };
  };
}

