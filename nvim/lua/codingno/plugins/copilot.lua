return {
  'github/copilot.vim',
  config = function()
    -- Disable Copilot for specific file types
    vim.g.copilot_filetypes = {
      ['markdown'] = true,
      ['text'] = false,
      ['help'] = false,
      ['gitcommit'] = false,
      ['gitrebase'] = false,
      ['diff'] = false,
      ['TelescopePrompt'] = false,
      ['qf'] = false,
      ['Trouble'] = false,
    }

    -- Set up key mappings for Copilot
    vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false
    })
    vim.g.copilot_no_tab_map = true
    vim.keymap.set('i', '<C-K>', '<Plug>(copilot-dismiss)', {
      silent = true,
      noremap = true
    })
  end 
}

