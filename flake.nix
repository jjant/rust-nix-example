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

      # pkgs.callPackage automatically passes arguments to ./. (i.e, `default.nix`)
      # See nix-pills 13: https://nixos.org/guides/nix-pills/callpackage-design-pattern.html
      # (though the callPackage function used here seems a bit more magical)
      code = pkgs.callPackage ./. {
        # inherit is shorthand for `{ pkg-config = pkg-config, naersk = naersk }`
        inherit pkg-config naersk;
      };
    in { packages.aarch64-darwin.default = code.app; };
}
