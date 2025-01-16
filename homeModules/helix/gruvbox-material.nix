{pkgs}: let
  link = "https://github.com/CptPotato/helix-themes/releases/tag/latest/helix-themes-latest.zip";
in
  pkgs.stdenv.mkDerivation {
    name = "gruvbox-material-helix";

    src = pkgs.fetchurl {
      url = link;
      sha256 = "sha256-i/AzhYz/ACeXsG5j0kDVfvfA4TwxA3KZJTPwCO4BKmc=";
    };

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out
      ${pkgs.unzip}/bin/unzip $src -d $out/
    '';
  }
