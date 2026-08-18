local function populate_quickfix_with_git_status()
  -- Get the list of changed files using git diff --name-only
  local files = vim.fn.systemlist("git diff --name-only")

  if vim.v.shell_error ~= 0 or #files == 0 then
    vim.notify("No changes detected in Git.", vim.log.levels.INFO)
    return
  end

  -- Prepare quickfix items
  local qf_list = {}
  for _, file in ipairs(files) do
    table.insert(qf_list, { filename = file, text = "Git diff file" })
  end

  -- Set the quickfix list and open it
  vim.fn.setqflist(qf_list, "r")
  vim.cmd("copen") -- Open the quickfix list window
end

-- Set a keybinding to trigger the quickfix list population
vim.keymap.set("n", "<leader>dd", function()
  populate_quickfix_with_git_status()
end)
