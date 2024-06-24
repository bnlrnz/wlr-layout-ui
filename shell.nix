with import <nixpkgs> {};

pkgs.mkShell {

  nativeBuildInputs = with pkgs; [
    poetry
    python311Packages.ipdb
    python311Packages.pyglet
    python311Packages.tomli
    python311Packages.tomli-w
    wlr-randr
    libGL
    xorg.libX11
    freetype
    fontconfig
    xorg.xrandr # for X11 support
  ];

  LD_LIBRARY_PATH = lib.makeLibraryPath [ libGL xorg.libX11 freetype fontconfig ];

  shellHook = ''
    echo "Install dependencies: poetry install"
    echo "Build: poetry build"
    echo "Run: poetry run wlrlui"
  '';
}
