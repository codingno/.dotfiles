return {
  "codingno/copy-context.nvim",
  opts = {
    path_style = "absolute",
    include_content = true,
  },
  keys = {
    {
      "<C-l>",
      function()
        require("copy-context").copy_visual()
      end,
      mode = "v",
      desc = "Copy selected code context",
    },
    {
      "<leader>l",
      function()
        require("copy-context").copy_visual()
      end,
      mode = "v",
      desc = "Copy selected code context",
    },
  },
}
