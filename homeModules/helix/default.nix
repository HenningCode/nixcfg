{pkgs, ...}: {
  home.file = {
    ".config/helix/themes".source = ./gruvbox_material_dark_medium.toml;
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox";
      editor = {
        line-number = "relative";
        lsp = {
          display-messages = true;
        };
        soft-wrap = {
          enable = true;
        };
      };
      keys.normal = {
        C-s = ":w";
        C-h = "jump_view_left";
        C-j = "jump_view_down";
        C-k = "jump_view_up";
        C-l = "jump_view_right";
      };
      keys.normal.space = {
        "=" = ":format";
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          language-servers = ["nixd"];
          formatter = {
            command = "alejandra";
          };
        }
      ];
    };
    extraPackages = with pkgs; [
      typescript-language-server
      nixd
      lua-language-server
      stylua
      alejandra
    ];
  };
}
