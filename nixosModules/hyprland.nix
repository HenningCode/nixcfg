{
  pkgs,
  inputs,
  ...
}: let
  sddmTheme = import ./sddm-theme.nix {inherit pkgs;};
in {
  services.xserver.enable = true;
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "henning";
    };
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${sddmTheme}";
    };
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    withUWSM = true;
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
