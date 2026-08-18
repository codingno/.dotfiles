return {
  "tpope/vim-fugitive",
  config = function ()
    -- Highlight added lines with a light green background
    -- local bg = "#161415"
    -- local bg_dark = "#101010"
    -- local bg_highlight = "#282627"
    -- local bg_search = "#C3542B"
    -- -- local bg_visual = "#C3542B"
    -- local bg_visual = "#413200"
    -- local fg = "#F7BC13"
    vim.cmd("highlight DiffAdd guibg=#363436")

    -- Highlight removed lines with a light red background
    vim.cmd("highlight DiffDelete guibg=#660000")

    -- Highlight changed lines with a light blue background
    -- vim.cmd("highlight DiffChange guibg=#b6d4f2")

    vim.cmd("highlight DiffText guibg=#d1e0f5 guifg=#161415") -- Darker blue for inline modifications


--     vim.cmd [[
--   " Define colors for DiffAdd, DiffChange, and DiffDelete
--   highlight DiffAdd    ctermfg=NONE ctermbg=22 guifg=NONE guibg=#144212
--   highlight DiffChange ctermfg=NONE ctermbg=58 guifg=NONE guibg=#452700
--   highlight DiffDelete ctermfg=NONE ctermbg=52 guifg=NONE guibg=#610b10
--
--   " Ensure the colors apply correctly for both GUI and terminal
--   if !has("gui_running")
--   highlight DiffAdd    ctermbg=22 ctermfg=NONE
--   highlight DiffChange ctermbg=58 ctermfg=NONE
--   highlight DiffDelete ctermbg=52 ctermfg=NONE
--   endif
-- ]]
--
    -- Optional: Configure diff options for better display
    vim.opt.fillchars:append { diff = ' ' }
    vim.opt.diffopt:append { 'vertical', 'filler', 'iwhite' }

    -- Optional: Ensure splits are clear and easy to differentiate
    vim.opt.fillchars:append { diff = ' ' }
    vim.opt.diffopt:append { 'vertical' }

    -- Define a custom keymap for Fugitive's Gvdiffsplit command
    -- vim.api.nvim_set_keymap('n', '<leader>gd', '', { noremap = true, silent = true, desc = "Git diff" })
    -- vim.api.nvim_set_keymap('n', '<leader>gd', ':echo "Git diff placeholder (does nothing)"<CR>', { noremap = true, silent = true, desc = "Git diff" })
    -- vim.api.nvim_set_keymap('n', '<leader>gdd', '<cmd>Gvdiffsplit<CR>', { noremap = true, silent = true, desc = "Open Git diff split" })
    -- vim.api.nvim_set_keymap('n', '<leader>gda', '<cmd>Git diff<CR>:lua vim.cmd("wincmd _")<CR>', { noremap = true, silent = true, desc = "Open Git diff" })
    vim.api.nvim_set_keymap('n', '<leader>gl', '<cmd>Git log<CR>:lua vim.cmd("wincmd _")<CR>', { noremap = true, silent = true, desc = "Open Git log" })


  end,
	-- keys = {
	-- 	{ "<leader>gd", "<cmd> Gvdiffsplit <CR>", desc = "Telescope Git Status" },
	-- }
}
