local state = {
  buf = -1,
  win = -1,
}
local function create_floating_window(width, height)

  if vim.api.nvim_buf_is_valid(state.buf) and vim.api.nvim_win_is_valid(state.win)  then
    vim.api.nvim_win_close(state.win, true)
    vim.api.nvim_buf_delete(state.buf, { force = true })
    return { buf = -1, win = -1}
  end

  -- Default values
  width = width or vim.o.columns -- Fullscreen width
  height = height or 10 

  -- Get the current window size
  local col = 0
  local row = vim.o.lines - height - 1 -- Place at the bottom of the editor

  -- Define border style and other window properties
  local border_opts = {
    border = "rounded",  -- You can change this to "rounded", "double", etc.
    style = "minimal",  -- Minimized style, no extra UI elements
    relative = "editor", -- Position relative to the editor
    width = width,
    height = height,
    col = col,
    row = row,
  }

  -- Create the floating window with a buffer
  local buf = vim.api.nvim_create_buf(false, true)  -- Create a new empty buffer
  local win = vim.api.nvim_open_win(buf, true, border_opts)

  local files = vim.fn.systemlist("git diff --name-only")

  -- Optionally, you can modify the buffer with content here
  -- Example: setting some text
  -- vim.api.nvim_buf_set_lines(buf, 0, -1, false, files)

  -- Define a highlight group for yellow text
  vim.api.nvim_command("highlight YellowText guifg=#FFFF00")

  -- Create a table to store the lines with yellow-colored file names and real paths
  local lines = {}
  for _, file in ipairs(files) do
    local filename = vim.fn.fnamemodify(file, ":t")  -- Get the file name without the path
    local real_path = vim.fn.fnameescape(file)  -- Get the real path of the file
    table.insert(lines, string.format("%s // %s", filename, real_path))  -- Set the file name in yellow and real path after #
  end

  -- Set the buffer content with the formatted file names
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Apply the yellow highlight to the filenames (before the #)
  for i, line in ipairs(lines) do
    local filename = line:match("^(.-) //")  -- Extract filename before the #

    -- Apply the comment highlight to the # and real path (after the #)
    local real_path = line:match("// (.+)$")
    if real_path then
      vim.api.nvim_buf_add_highlight(buf, -1, "Comment", i - 1, #filename + 1, #line)  -- Highlight the real path with the Comment group
    end
  end

  -- Set the key mapping for selecting files from the sidebar
  vim.api.nvim_buf_set_keymap(buf, 'n', '<CR>', ":lua _G.open_file_in_main_buffer()<CR>", { noremap = true, silent = true })

  -- Function to open the selected file in the main buffer
  function _G.open_file_in_main_buffer()
    -- Get the current buffer and the selected line (file)
    local bufnr = vim.api.nvim_get_current_buf()
    local file = vim.api.nvim_buf_get_lines(bufnr, vim.fn.line('.') - 1, vim.fn.line('.'), false)[1]

    -- Extract the real path from the line (after #)
    local real_path = file:match("// (.+)$")

    -- Open the selected file in the main buffer (no Gvdiffsplit)
    vim.cmd('GD')  -- Open the file normally
    -- Check if diff mode is active
    local is_diff = vim.api.nvim_exec("echo &diff", true) == "1"

    -- If diff mode is active, close the diff window
    if is_diff then
      -- Close the current diff window
      vim.cmd("q")
    end
    vim.cmd('edit ' .. vim.fn.fnameescape(real_path))  -- Open the file normally
    vim.cmd('Gvdiffsplit')  -- Open the file normally

  end

  return { buf = buf, win = win }
end

-- Call the function with optional width and height
vim.api.nvim_create_user_command("GD", function()
  state = create_floating_window()
end, {})

vim.keymap.set("n", "<leader>d", function()
  state = create_floating_window()
end)
