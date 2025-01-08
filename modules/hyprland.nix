{
  pkgs,
  ...
}: {

  home.packages = with pkgs; [
    rofi-wayland
    grim
    slurp
    swappy
    hyprpicker
  ];

  wayland.windowManager.hyprland.enable = true; 
  programs.hyprlock.enable = true;
  services.hyprpaper.enable = true;
  services.hypridle.enable = true;
  
  xdg = {
    configFile."hypr" = {
      source = ./hypr;
      recursive = true;
    };
  };

}
