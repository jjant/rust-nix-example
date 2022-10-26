let naerskLib = pkgs.callPackage naersk { };
in {
  app = naerskLib.buildPackage {
    name = "hello-random";
    src = ./.;
    cargoBuildOptions = x: x;
    nativeBuildInputs = [ pkgs.pkg-config ];
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}
