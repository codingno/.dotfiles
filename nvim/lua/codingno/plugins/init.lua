return {
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	"rktjmp/lush.nvim",
	-- { 
		-- "codingno",
		-- dir = "~/personal/colorscheme/codingno", 
		-- lazy = false,
	-- },
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
  { "christoomey/vim-tmux-navigator" , lazy = false },
  {
    "codingno/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} },
    config= function ()
      local harpoon = require("harpoon")
      harpoon:setup({
        projects = {
          save_on_toggle = true,
        },
      })
     vim.keymap.set("n", "<leader>a", function() harpoon:list():append()  end)
     vim.keymap.set("n", "<A-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list())  end)
     vim.keymap.set("n", "<A-u>", function() harpoon:list():select(1)  end)
     vim.keymap.set("n", "<A-i>", function() harpoon:list():select(2)  end)
     vim.keymap.set("n", "<A-o>", function() harpoon:list():select(3)  end)
     vim.keymap.set("n", "<A-;>", function() harpoon:list():select(4)  end)
    end,
  },
  {
     "folke/trouble.nvim",
     lazy = false,
     dependencies = { "nvim-tree/nvim-web-devicons" },
     opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      },
      keys = {
        { "<leader>t" , "<cmd> TroubleToggle <CR>", desc = "Search current word" },
      }
  },
}
