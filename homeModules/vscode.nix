{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-dotnettools.csharp
      ms-dotnettools.csdevkit
    ];
  };
}
