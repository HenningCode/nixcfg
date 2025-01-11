{
  pkgs,
  ...
}: let
  gruvboxPlus = import ./gruvbox-plus.nix {inherit pkgs;};
in {
  home.file = {
    ".local/share/icons/GruvboxPlus".source = "${gruvboxPlus}";
  };

  gtk = {
    enable = true;

    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };

    iconTheme = {
      name = "GruvboxPlus";
      package = gruvboxPlus;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

}
