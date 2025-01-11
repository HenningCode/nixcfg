{
  pkgs,
  inputs,
  ...
}: {
  programs.ags = {
    enable = true;
    configDir = ./shell;

    # additional packages to add to gjs's runtime
    extraPackages = [
      inputs.ags.packages.${pkgs.system}.astal3
      inputs.ags.packages.${pkgs.system}.apps
      inputs.ags.packages.${pkgs.system}.mpris
      inputs.ags.packages.${pkgs.system}.hyprland
      inputs.ags.packages.${pkgs.system}.tray
    ];
  };
}
