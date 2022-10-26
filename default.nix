{ naersk, pkg-config, targetPlatform }: {
  app = naersk.lib."${targetPlatform.system}".buildPackage rec {
    name = "hello-random";
    src = ./.;
    cargoBuildOptions = x: x;
    nativeBuildInputs = [ pkg-config ];
  };
}
