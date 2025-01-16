{pkgs}: let
  link = "https://github.com/CptPotato/helix-themes/releases/tag/latest/build.tar.gz";
in
  pkgs.stdenv.mkDerivation {
    name = "gruvbox-material-helix";

    src = pkgs.fetchurl {
      url = link;
      sha256 = "sha256-4FQgqHCXcZXokUuE2OMFBshXBzaab3UlR1Po/3GTu3Q=";
    };

    unpackPhase = ''
      mkdir -p $out
      tar -xzf $src -C $out
    '';
  }
