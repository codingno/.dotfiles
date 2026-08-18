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
      modes = {
        preview_float = {
          preview = {
            type = "main",
            check_dry_run = true,
          },
        },
      },
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      -- { "<leader>t" , "<cmd> TroubleToggle document_diagnostics severity=ERROR <CR>", desc = "Toggle Trouble Error" },
      {
        "<leader>t",
        function()
          local trouble = require("trouble")
          if trouble.is_open() then
            -- Jika kita sudah berada di dalam jendela trouble, maka tutup
            if vim.bo.filetype == "Trouble" then
              vim.cmd("TroubleToggle document_diagnostics")
            else
              -- Jika terbuka tapi kita di luar, panggil open lagi untuk pindah fokus
              -- Untuk v2, memanggil open saat sudah terbuka akan memindahkan kursor ke sana
              vim.cmd("Trouble document_diagnostics focus=true")
            end
          else
            -- Jika tertutup, buka dengan filter ERROR
            -- Catatan: v2 menggunakan string mode, v3 menggunakan tabel
            vim.cmd("TroubleToggle document_diagnostics severity=ERROR")
          end
        end,
        desc = "Smart Toggle/Focus Trouble",
      },
      {
        "<leader>k",
        function()
          local trouble = require("trouble")
          if trouble.is_open() then
            -- Jika kita sudah berada di dalam jendela trouble, maka tutup
            if vim.bo.filetype == "Trouble" then
              vim.cmd("TroubleToggle workspace_diagnostics")
            else
              -- Jika terbuka tapi kita di luar, panggil open lagi untuk pindah fokus
              -- Untuk v2, memanggil open saat sudah terbuka akan memindahkan kursor ke sana
              vim.cmd("Trouble workspace_diagnostics focus=true")
            end
          else
            -- Jika tertutup, buka dengan filter ERROR
            -- Catatan: v2 menggunakan string mode, v3 menggunakan tabel
            vim.cmd("TroubleToggle workspace_diagnostics severity=ERROR")
          end
        end,
        desc = "Smart Toggle/Focus Trouble Workspace Diagnostics",
      },
    }
  },
}
