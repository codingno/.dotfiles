return {
	"numToStr/Comment.nvim",
	config = function()
		require('Comment').setup({
			toggler = {
				line = '<leader>c<leader>',
			},
			opleader = {
				line = '<leader>c',
			},
			mappings = {
				extended = true
			}
		})
	end,
	lazy = false,
	keys = {
		{ "<leader>_" , "<ESC><cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Toggle comment", mode = "n" },
		{ "<C-_>" , "<ESC><cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Toggle comment", mode = "n" },
		{ "<C-_>" , "<ESC><cmd>lua require('Comment.api').locked('toggle.linewise')(vim.fn.visualmode())<CR>gv", desc = "Toggle comment all", mode = "v" },
		{ "<leader>_" , "<ESC><cmd>lua require('Comment.api').locked('toggle.linewise')(vim.fn.visualmode())<CR>gv", desc = "Toggle comment all", mode = "v" },
	}
}
