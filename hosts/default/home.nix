{
  pkgs,
  ...
}: {
  imports = [
    ../../homeModules/nvim.nix
    ../../homeModules/hyprland.nix
    ../../homeModules/alacritty.nix
    ../../homeModules/yazi.nix
    ../../homeModules/firefox.nix
    ../../homeModules/ghostty.nix
    ../../homeModules/gtk
    ../../homeModules/rofi
    ../../homeModules/starship.nix
    ../../homeModules/vscode.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "henning";
  home.homeDirectory = "/home/henning";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
  ];

  programs.git = {
    enable = true;
    userName = "HenningCode";
    userEmail = "henningwilmer@yahoo.de";
  };

  programs.mangohud.enable = true;

  # programs.

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
