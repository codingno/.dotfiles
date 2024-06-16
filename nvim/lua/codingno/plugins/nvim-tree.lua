return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        relativenumber = true,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          }
        }
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeFindFileToggle <CR>", { desc = "Toggle file explorer on current file" })
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus <CR>", { desc = "File explorer focus" })

  end,
}
