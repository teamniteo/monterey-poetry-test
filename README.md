# Testing various features of poetry2nix on Monterey

Use this repo to create MREs (minimal reproducible example) to showcase various
features and problems with poetry2nix.


## Example: installing isort fails

```bash
# Enter nix-shell
$ nix-shell
error: value is null while a set was expected

       at /nix/store/i3hrzfn5l4402xminf93mspv06llhggh-source/default.nix:140:19:

          139|
          140|       poetryPkg = poetry.override { inherit python; };
             |                   ^
          141|
(use '--show-trace' to show detailed location information)
```

## We're hiring!

At Niteo we regularly contribute back to the Open Source community. If you do too, we'd like to invite you to [join our team](https://niteo.co/careers)!
