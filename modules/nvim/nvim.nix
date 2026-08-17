{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;

    extraPackages = with pkgs; [
      ripgrep
      fd
      git
      stylua
      lua-language-server
      nil
      nixfmt
      pyright
      rust-analyzer
      gopls
      typescript-language-server
      prettier
      tree-sitter
      jdk21
      maven
      gradle
      jdt-language-server
    ];
  };
}
