{
  pkgs,
  lib,
  ...
}: {
  xdg = {
    configFile."nvim" = {
      source = ./nvim;
      recursive = true;
    };

    desktopEntries."nvim" = lib.mkIf pkgs.stdenv.isLinux {
      name = "NeoVim";
      comment = "Edit text files";
      icon = "nvim";
      exec = "xterm -e ${pkgs.neovim}/bin/nvim %F";
      categories = ["TerminalEmulator"];
      terminal = false;
      mimeType = ["text/plain"];
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;

    plugins = [
      {
        plugin = pkgs.vimPlugins.sqlite-lua;
        config = "let g:sqlite_clib_path = '${pkgs.sqlite.out}/lib/libsqlite3.so'";
      }
    ];
    extraPackages = with pkgs; [
      # utils
      gcc
      ripgrep
      fd
      fzf

      # formatter's and lsp's
      nixd
      lua-language-server
      stylua
      alejandra
    ];
  };
}
