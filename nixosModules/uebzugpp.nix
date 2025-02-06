{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation {
  name = "ueberzugpp_new";
  version = "master";

  src = pkgs.fetchFromGitHub {
    owner = "jstkdng";
    repo = "ueberzugpp-new";
    rev = "08f337c6abe3f0d5fc5d4b258e653f5aaa37466c";
    hash = "sha256-ufILtiIDx7N5sOsS49+9SaI4NaABhi0URpZgofTJz1o=";
    fetchSubmodules = true;
  };

  buildInputs = with pkgs; [
    openssl
    vips
    pcre
    util-linux
    pcre2
    libselinux
    libsepol
    spdlog
    cli11
    glaze
    libarchive
    fftw
    cfitsio
    cgif
    libimagequant
    libexif
    libjpeg
    libspng
    pango
    libthai
    libdatrie
    xorg.libXdmcp
    libtiff
    lerc
    librsvg
    openjpeg
    libhwy
    matio
    hdf5
    lcms2
    openexr
    fribidi
    libwebp
    expat
    wayland
    wayland-protocols
    wayland-scanner
    libsysprof-capture
    extra-cmake-modules
  ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DENABLE_X11=OFF"
    "-DUSE_BUNDLED_LIBRARIES=OFF"
  ];
}
