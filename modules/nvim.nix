{ config, pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		withNodeJs = true;
		
		extraPackages = with pkgs; [
			ripgrep
			fd
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

		plugins = with pkgs.vimPlugins; [
			# --- UI CONFIGURATION --- #
			lualine-nvim
			vim-surround
			vim-commentary
			vim-repeat
			which-key-nvim

			# --- FILE NAVIGATION SEARCH --- #
			nvim-tree-lua
			telescope-nvim
			telescope-fzf-native-nvim
			plenary-nvim

			# --- GIT --- # 
			gitsigns-nvim

			# --- SYNTAX AND TEXT OBJECTS --- #
			#nvim-treesitter.withAllGrammars
			nvim-treesitter

			# COMPLETION AND LSP
			nvim-lspconfig
			nvim-cmp
			cmp-nvim-lsp
			cmp-buffer
			cmp-path
			luasnip
			cmp_luasnip
			nvim-web-devicons
			nvim-autopairs
		];

		initLua = ''
			--- Basic options
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

			--- Keymaps	
			vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
      			vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
		      	vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
      			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
      			vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
      			vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
      			vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

			--- lualine
      			require("lualine").setup()

      			--- gitsigns
      			require("gitsigns").setup()

      			-- nvim-tree
      			require("nvim-tree").setup()

      			-- treesitter
     			local ok, ts = pcall(require, "nvim-treesitter.configs")
			if ok then
  			 ts.setup({
    				highlight = { enable = true },
    				indent = { enable = true },
  			 })
			end

			require("nvim-autopairs").setup({})

			-- optional: integrate with nvim-cmp confirm
			local cmp_ok, cmp = pcall(require, "cmp")
			if cmp_ok then
  			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end

      			-- LSP setup
			vim.lsp.config("lua_ls", {})
			vim.lsp.config("nil_ls", {})
			vim.lsp.config("pyright", {})
			vim.lsp.config("rust_analyzer", {})
			vim.lsp.config("gopls", {})
			vim.lsp.config("ts_ls", {})

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("nil_ls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("gopls")
			vim.lsp.enable("ts_ls")

      			-- nvim-cmp setup
      			local cmp = require("cmp")
      				cmp.setup({
        			snippet = {
          			expand = function(args)
            			require("luasnip").lsp_expand(args.body)
         			end,
        			},
        			mapping = cmp.mapping.preset.insert({
          			["<C-Space>"] = cmp.mapping.complete(),
          			["<CR>"] = cmp.mapping.confirm({ select = true }),
          			["<Tab>"] = cmp.mapping.select_next_item(),
          			["<S-Tab>"] = cmp.mapping.select_prev_item(),
        			}),
        			sources = cmp.config.sources({
          			{ name = "nvim_lsp" },
          			{ name = "luasnip" },
          			{ name = "path" },
         	 		{ name = "buffer" },
        			}),
      			})
   	 	'';
	};
}
