return {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
  lazy = false,
	dependencies = { 'nvim-lua/plenary.nvim', 'ThePrimeagen/git-worktree.nvim' },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    require('git-worktree').setup()
    telescope.load_extension("git_worktree")

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

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>gs", function()
      builtin.git_status({
        initial_mode = "normal", -- Open in normal mode by default
      })
    end, { desc = "Telescope Git Status in Normal Mode" })

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
		{ "<leader>gwt", "<cmd> Telescope git_worktree git_worktree <CR>", desc = "Git worktree list" },
		{ "<leader>gwc", "<cmd> Telescope git_worktree create_git_worktree <CR>", desc = "Create git worktree" },
	}
}
