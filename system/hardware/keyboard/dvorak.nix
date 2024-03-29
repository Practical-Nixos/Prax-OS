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

        q = "'"
        w = ","
        e = ".";
        r = "p";
        t = "y";
        y = "f";
        u = "g";
        i = "c";
        o = "r";
        p = "l";
        
        s = "o";
        d = "e";
        f = "u";
        g = "i";
        h = "d";
        j = "h";
        k = "t";
        l = "n";
        ";" = "s";
        
        z = ";";
        x = "q";
        c = "j";
        v = "k";
        b = "x";
        n = "b";
        m = "m";
        "," = "w";
        "." = "v";
        "/" = "z";
        };
      };
    };
  };
}

