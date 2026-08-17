 { pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # Core UI
    gruvbox-nvim
    lualine-nvim
    bufferline-nvim
    nvim-web-devicons
    which-key-nvim
    indent-blankline-nvim
    noice-nvim
    nui-nvim

    # Navigation / search
    nvim-tree-lua
    telescope-nvim
    telescope-fzf-native-nvim
    plenary-nvim

    # Editing helpers
    vim-surround
    vim-commentary
    vim-repeat
    nvim-autopairs

    # Git
    gitsigns-nvim

    # Syntax
    nvim-treesitter

    # LSP + completion
    nvim-lspconfig
    nvim-cmp
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-nvim-lua
    luasnip
    cmp_luasnip
    friendly-snippets
    lspkind-nvim
  ];
}
