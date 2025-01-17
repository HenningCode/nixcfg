{pkgs, ...}: let
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
    xwayland.enable = true;
    withUWSM = true;
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
