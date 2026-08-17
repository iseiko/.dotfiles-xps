{ ... }:
{
  imports = [
    ./nvim.nix
    ./plugins.nix
    ./config/options.nix
    ./config/keymaps.nix
    ./config/ui.nix
    ./config/treesitter.nix
    ./config/cmp.nix
    ./config/lsp.nix
  ];
}
