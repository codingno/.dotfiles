return {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
  lazy = false,
	dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["C-k>"] = actions.move_selection_previous,
            ["C-j"] = actions.move_selection_next,
            ["C-q"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })
  end,
	keys = {
		{ "<leader>ff" , "<cmd> Telescope find_files <CR>", desc = "Find files" },
		{ "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", desc = "Find all" },
		{ "<leader>fw", "<cmd> Telescope live_grep <CR>", desc = "Live grep" },
		{ "<leader>fc", "<cmd> Telescope grep_string <CR>", desc = "Find string under cursor in cwd" },
		{ "<leader>fb", "<cmd> Telescope buffers <CR>", desc = "Find buffers" },
		{ "<leader>fh", "<cmd> Telescope help_tags <CR>", desc = "Help page" },
		{ "<leader>fo", "<cmd> Telescope oldfiles <CR>", desc = "Find oldfiles" },
		{ "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", desc = "Find in current buffer" },
	}
}
