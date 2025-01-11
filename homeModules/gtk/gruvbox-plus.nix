{pkgs}: let
  link = "https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v6.1.0/gruvbox-plus-icon-pack-6.1.0.zip";
in
  pkgs.stdenv.mkDerivation {
    name = "gruvbox-plus";

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
