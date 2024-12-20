return {
  -- "codingno/harpoon",
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  requires = { {"nvim-lua/plenary.nvim"} },
  lazy = false,
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
}
