return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            opts.silent = true
            opts.nowait = true -- This is the key to ignore 'gbc'
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', 'gp', gs.preview_hunk, { desc = "Preview Hunk" })
          map('n', 'gb', function() gs.blame_line{full=true} end, { desc = "Blame Line" })
        end
      })
    end
  },
}
