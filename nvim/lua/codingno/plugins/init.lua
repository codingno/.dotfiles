return {
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  "rktjmp/lush.nvim",
  "neovim/nvim-lspconfig",
  -- "hrsh7th/cmp-nvim-lsp",
  { "christoomey/vim-tmux-navigator" , lazy = false },
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
