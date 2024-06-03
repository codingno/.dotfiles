return {
    "ThePrimeagen/vim-apm",
    -- lazy = false,
    config = function()
      -- Define a command that sets up a Lua module
      local apm = require("vim-apm")
      apm:setup({})
      apm:toggle_monitor()
     vim.keymap.set("n", "<A-t>", function() apm:toggle_monitor() end)
      -- vim.cmd [[
      --   command! -nargs=* SetupVimApm lua require('vim-apm'):setup({})
      -- ]]
    end,
  }
