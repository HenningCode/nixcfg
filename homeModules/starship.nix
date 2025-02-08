{...}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 1000;

      format = ''
        $hostname$directory$git_branch$git_commit$git_status$nix_shell
        $character
      '';

      character = {
        error_symbol = "[  ✗](bold red)";
        success_symbol = "[  ](bold red)";
      };

      directory = {
        truncation_length = 5;
        format = "[$path]($style)[$lock_symbol]($lock_style) ";
        style = "bold yellow";
        read_only = "🔒";
        read_only_style = "bold white";
      };

      hostname = {
        ssh_only = false;
        disabled = false;
        style = "bold italic green";
      };
      git_commit = {
        commit_hash_length = 8;
        style = "bold white";
      };

      nix_shell = {
        format = "in [nix-shell]($style)";
      };
    };
  };
}
