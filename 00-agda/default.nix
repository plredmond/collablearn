# This is written with the nixos-20.03 builder for agda.
# The builder was reworked in d30e246 which will appear in
# nixos-20.09.

# nix-build: doesn't build, but that's ok b/c we want to use agda
# for interactive development for now; we can fix nix-build later
# on the new builder

# nix-shell: sets up a dev env where you can use
#
# $ agda --compile hello-world.agda
let
  nixpkgs = import <nixpkgs> {};
  drv = nixpkgs.agda.mkDerivation (
    self: rec{
      name = "agda-project";
      src = nixpkgs.nix-gitignore.gitignoreSource [] ./.;
      everythingFile = "hello-world.agda";
      buildDepends = [
        nixpkgs.AgdaStdlib
        (nixpkgs.haskellPackages.ghcWithPackages (p: [ p.ieee ]))
      ];
    }
  );
in
if nixpkgs.lib.inNixShell then drv.env else drv
