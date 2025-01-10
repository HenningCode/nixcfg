{
  config,
  lib,
  ...
}: let
  session = {
    command = "${lib.getExe config.programs.uwsm.package} start hyprland-uwsm.desktop";
    user = "henning";
  };
in {
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = session;
  #     initial_session = session;
  #   };
  # };

  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    # theme = "";
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}
