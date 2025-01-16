{pkgs, ...}: let
  wallpaper = "/home/henning/dotfiles/homeModules/hypr/gargantua.jpg";
in {
  home.packages = with pkgs; [
    grim
    slurp
    swappy
    hyprpicker
  ];

  wayland.windowManager.hyprland = {
    enable = true;
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

  services.mako = {
    enable = true;
    extraConfig = ''
# Global configuration options
max-history=5
sort=+time

# Binding options
on-button-left=dismiss
on-button-right=dismiss-all

# Style options
font=Cantarell 10
background-color=#252423
text-color=#d4be98
width=300
height=100
margin=10
padding=15
border-size=0
border-radius=5
icons=1
max-icon-size=128
icon-location=left
markup=1
actions=1
history=1
text-alignment=left
default-timeout=15000
layer=top
anchor=bottom-right

[category=CHANGE_LAYOUT]
font=Cantarell 25
background-color=#252423
text-color=#d4be98
width=300
height=100
margin=300
padding=15
border-size=0
border-radius=5
history=0
text-alignment=center
layer=top
default-timeout=400
anchor=bottom-center
'';
  };
}
