{
  description = "A flake for building hello-random";

  inputs = {
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.follows = "rust-overlay/flake-utils";
    nixpkgs.follows = "rust-overlay/nixpkgs";
    naersk.url = "github:nix-community/naersk";
  };

  outputs = inputs:
    with inputs;

    let
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      pkg-config = pkgs.pkg-config;

      code = pkgs.callPackage ./. { inherit pkg-config naersk; };
    in { packages.aarch64-darwin.default = code.app; };
}
