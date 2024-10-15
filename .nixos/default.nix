# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  where-is-my-sddm-theme = pkgs.callPackage ./where-is-my-sddm-theme.nix { };
}
