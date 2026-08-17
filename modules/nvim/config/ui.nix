{ ... }:
{
  programs.neovim.extraLuaConfig = ''
    vim.cmd.colorscheme("gruvbox")

    require("lualine").setup({
      options = {
        theme = "gruvbox",
        globalstatus = true,
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
      },
    })

    require("gitsigns").setup()

    require("nvim-tree").setup({
      view = { width = 34 },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
    })

    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        separator_style = "thin",
      },
    })

    require("ibl").setup({
      indent = { char = "│" },
      scope = { enabled = false },
    })

    require("which-key").setup({})

    require("noice").setup({
      lsp = {
        progress = { enabled = true },
        hover = { enabled = true },
        signature = { enabled = true },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    })
  '';
}
