{pkgs, lib, ...}: let
  gruvboxPlus = import ./gruvbox-plus.nix {inherit pkgs;};
in {
  home.file = {
    ".local/share/icons/GruvboxPlus".source = "${gruvboxPlus}/Gruvbox-Plus-Dark";
  };

  gtk = {
    enable = true;

    # theme = {
    #   name = "adw-gtk3";
    #   package = pkgs.adw-gtk3;
    # };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = lib.mkForce "gtk";
  };
}
