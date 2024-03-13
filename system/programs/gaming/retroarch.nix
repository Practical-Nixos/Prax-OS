{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (retroarch.override {
      cores = with libretro; [
        atari800
        beetle-lynx
        beetle-ngp
        beetle-pce
        beetle-pcfx
        beetle-supergrafx
        beetle-vb
        beetle-wswan
        blastem
        bluemsx
        bsnes
        bsnes-mercury-performance
        desmume
        fbneo
        flycast
        fuse
        genesis-plus-gx
        mame
        melonds
        mesen
        mgba
        mupen64plus
        neocd
        nestopia
        parallel-n64
        pcsx-rearmed
        play
        sameboy
        snes9x
        smsplus-gx
        stella
        swanstation
        yabause
      ];
    })
  ];
}
