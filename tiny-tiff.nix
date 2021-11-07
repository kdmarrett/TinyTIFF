{ nixpkgs, ... }:
let
  pkgs = import nixpkgs {
    system = "x86_64-linux";
  };
in
  with pkgs;
  stdenv.mkDerivation {
    name = "tinyTIFF";
    version = "3.0.0";

  # https://nixos.org/nix/manual/#builtin-filterSource
  src = builtins.filterSource
  (path: type: lib.cleanSourceFilter path type
  && baseNameOf path != "build") ./.;

  enableParallelBuilding = true;

  cmakeFlags = ["-DTinyTIFF_BUILD_STATIC_LIBS=ON"];

  nativeBuildInputs = [ cmake ];

  # more debug info
  dontStrip = true;
  enableDebugging = true;
}
