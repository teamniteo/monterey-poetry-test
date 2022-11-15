let
  nixpkgs = builtins.fetchTarball {
    #    -> nixos-22.05 on 2022-10-23
    url = "https://github.com/nixos/nixpkgs/archive/3933d8bb9120573c0d8d49dc5e890cb211681490.tar.gz";
  };
  poetry2nixsrc = builtins.fetchTarball {
    # https://github.com/nix-community/poetry2nix/commits/master on 2022-10-23
    url = "https://github.com/nix-community/poetry2nix/archive/3b9040d19e18db212f8f83cb9241f8102b519f94.tar.gz";
  };


  pkgs = import nixpkgs {};
  poetry2nix = import poetry2nixsrc {
    inherit pkgs;
    inherit (pkgs) poetry;
  };

  env = poetry2nix.mkPoetryEnv {
    pyproject = ./pyproject.toml;
    poetrylock = ./poetry.lock;
    # editablePackageSources = {
    #   trivial = ./src;
    # };
  };
in

pkgs.mkShell {
  name = "dev-shell";
  buildInputs = [
    env
    pkgs.poetry
  ];

}
