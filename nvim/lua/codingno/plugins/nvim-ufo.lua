return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  lazy = false,
  config = function()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Set folding method to use nvim-ufo
    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = 'v:lua.require("ufo").foldexpr()'

    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = "Open all folds" })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = "Close all folds" })
    vim.keymap.set('n', 'ze', require('ufo').enableFold, { desc = "Enable Ufo fold" })
    vim.keymap.set('n', 'zK', function()
      local winid = ufo.peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Peek Fold" })

    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'lsp', 'indent' }
      end
    })
  end
}
