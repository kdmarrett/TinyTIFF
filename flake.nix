{
  description = "TinyTIFF";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs: {

    defaultPackage.x86_64-linux = import ./tiny-tiff.nix {
      nixpkgs = inputs.nixpkgs;
    };
  };
}
