let
  nixpkgs = builtins.fetchTarball {
    # https://status.nixos.org/ -> nixos-22.05 on 2022-10-04
    url = "https://github.com/nixos/nixpkgs/archive/81a3237b64e67b66901c735654017e75f0c50943.tar.gz";
  };
  pkgs = import nixpkgs {};
  poetry2nix = import (fetchTarball {
    # https://github.com/nix-community/poetry2nix/pull/736/commits on 2022-10-06
    url = "https://github.com/nix-community/poetry2nix/archive/79f166b7eed97151e61028e78ad5bfb090b591d7.tar.gz";
  }) {
    pkgs = pkgs;
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
