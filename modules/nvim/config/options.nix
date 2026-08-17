{ ... }:
{
  programs.neovim.extraLuaConfig = ''
    vim.g.mapleader = " "

    vim.o.number = true
    vim.o.relativenumber = true
    vim.o.mouse = "a"
    vim.o.clipboard = "unnamedplus"
    vim.o.termguicolors = true
    vim.o.signcolumn = "yes"
    vim.o.updatetime = 250
    vim.o.timeoutlen = 400
    vim.o.splitright = true
    vim.o.splitbelow = true
    vim.o.cursorline = true

    vim.o.tabstop = 2
    vim.o.shiftwidth = 2
    vim.o.expandtab = true
    vim.o.smartindent = true

    vim.o.ignorecase = true
    vim.o.smartcase = true

    vim.o.scrolloff = 8
    vim.o.sidescrolloff = 8
  '';
}
