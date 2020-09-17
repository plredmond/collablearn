module hello-world where

-- 11:31:32$ nix-shell -p haskellPackages.Agda AgdaStdlib ghc
-- export AGDA_DIR=$PWD/agda_dir/
-- nix-shell -p AgdaStdlib 'haskellPackages.ghcWithPackages (p: [p.ieee754 p.Agda])'


open import IO

main = run (putStrLn "Hello, World!")
