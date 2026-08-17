{ ... }:
{
  programs.neovim.extraLuaConfig = ''
    local ok, ts = pcall(require, "nvim-treesitter.configs")
    if ok then
      ts.setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  '';
}
