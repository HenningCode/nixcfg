{pkgs, ...}: let
  wallpaper = "/home/henning/dotfiles/modules/hypr/gargantua.jpg";
in {
  home.packages = with pkgs; [
    rofi-wayland
    grim
    slurp
    swappy
    hyprpicker
  ];

  xdg = {
    configFile."hypr" = {
      source = ./hypr;
      recursive = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
  };

  programs.hyprlock.enable = true;

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      preload = [wallpaper];

      wallpaper = [
        "DP-4, ${wallpaper}"
        "DP-5,${wallpaper}"
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
      };

      listener = [
        {
          timeout = 600;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 610;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1800;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
