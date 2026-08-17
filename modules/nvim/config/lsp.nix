{ ... }:
{
  programs.neovim.extraLuaConfig = ''
    vim.lsp.config("lua_ls", {})
    vim.lsp.config("nil_ls", {})
    vim.lsp.config("pyright", {})
    vim.lsp.config("rust_analyzer", {})
    vim.lsp.config("gopls", {})
    vim.lsp.config("ts_ls", {})
    vim.lsp.config("jdtls", {})

    vim.lsp.enable("lua_ls")
    vim.lsp.enable("nil_ls")
    vim.lsp.enable("pyright")
    vim.lsp.enable("rust_analyzer")
    vim.lsp.enable("gopls")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("jdtls")
  '';
}
