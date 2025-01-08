{...}: {
  imports = [
    ../../modules/nvim.nix
    ../../modules/hyprland.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "henning";
  home.homeDirectory = "/home/henning";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.git = {
    enable = true;
    userName = "HenningCode";
    userEmail = "henningwilmer@yahoo.de";
  };

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
