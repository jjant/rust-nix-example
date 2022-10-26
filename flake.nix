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
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        code =
          pkgs.callPackage ./. { inherit nixpkgs system rust-overlay naersk; };
      in rec {
        packages = { app = code.app; };
        default = packages.all;
      });
}
