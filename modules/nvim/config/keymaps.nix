{ ... }:
{
  programs.neovim.extraLuaConfig = ''
    -- set leader here too, so mappings always use the expected key
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- basic
    map("n", "<leader>w", "<cmd>w<cr>", vim.tbl_extend("force", opts, { desc = "Save file" }))
    map("n", "<leader>q", "<cmd>q<cr>", vim.tbl_extend("force", opts, { desc = "Quit window" }))

    -- file tree
    map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", vim.tbl_extend("force", opts, { desc = "Toggle file tree" }))

    -- telescope
    map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", vim.tbl_extend("force", opts, { desc = "Find files" }))
    map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", vim.tbl_extend("force", opts, { desc = "Live grep" }))
    map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", vim.tbl_extend("force", opts, { desc = "Buffers" }))
    map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", vim.tbl_extend("force", opts, { desc = "Help tags" }))

    -- buffers
    map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
    map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", vim.tbl_extend("force", opts, { desc = "Prev buffer" }))
    map("n", "<leader>bd", "<cmd>bdelete<cr>", vim.tbl_extend("force", opts, { desc = "Delete buffer" }))

    -- java
    map("n", "<leader>jr", function()
      local dir = vim.fn.expand("%:p:h")
      local cls = vim.fn.expand("%:t:r")
      vim.cmd("split | terminal cd " .. dir .. " && javac " .. cls .. ".java && java " .. cls)
    end, vim.tbl_extend("force", opts, { desc = "Java: compile & run current file" }))
  '';
}
