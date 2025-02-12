{pkgs, inputs, ...}: let
  wallpaper = "/home/henning/dotfiles/homeModules/hypr/mountain.jpg";
in {
  home.packages = with pkgs; [
    grim
    slurp
    swappy
    hyprpicker
    radeontop
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    extraConfig = builtins.readFile (builtins.path {
      path = ./hypr/hyprland.conf;
    });
  };

  programs.hyprlock = {
    enable = true;
    extraConfig = builtins.readFile (builtins.path {
      path = ./hypr/hyprlock.conf;
    });
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      preload = [wallpaper];

      wallpaper = [
        "DP-4,${wallpaper}"
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

  xdg.configFile."swaync" = {
    source = ./swaync;
    recursive = true;
  };

  services.swaync.enable = true;

  xdg.configFile."waybar" = {
    source = ./waybar;
    recursive = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
}
