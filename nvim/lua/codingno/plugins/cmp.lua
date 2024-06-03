return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require('cmp')

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

		cmp.setup({
			snippet = {
				expand = function(args)
					-- You may want to use a different snippet engine here
					vim.fn['vsnip#anonymous'](args.body)
				end,
			},
			mapping = {
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.close(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
			},
			window = {
				completion = {
					border = border "CmpBorder"
				}
			}
		})
	end,
	keys = {
		{ "<Tab>", function()
			cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif require("luasnip").expand_or_jumpable() then
					vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
				else
					fallback()
				end
			end, {
			"i",
			"s",
		}) 
	end
},
    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif require("luasnip").jumpable(-1) then
    --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
    --   else
    --     fallback()
    --   end
    -- end, {
    --   "i",
    --   "s",
    -- }),
	}
}
