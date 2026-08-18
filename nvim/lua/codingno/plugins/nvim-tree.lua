return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      sort = {
        sorter = function(nodes)
          table.sort(nodes, function(a, b)
            -- 1. Keep folders above files
            if a.type ~= b.type then
              return a.type < b.type
            end

            -- 2. Sort the names in descending order (Z -> A)
            return a.name > b.name
          end)
        end,
      },
      view = {
        relativenumber = true,
        width = 40,
        side = "right",
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

    vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle <CR>", { desc = "Toggle file explorer on current file", noremap = true, silent = true })
    vim.keymap.set("n", "<Space>e", function() vim.cmd("NvimTreeFocus") end, { desc = "File explorer focus", noremap = true, silent = true})

  end,
}
