{pkgs, ...}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };
    languages = {
      language = [
      {
        name ="nix";
        language-servers = ["nixd"];
        formatter = {
          command="alejandra";
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
