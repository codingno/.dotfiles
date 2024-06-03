return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local bg = "#161415"
    local bg_dark = "#101010"
    local bg_highlight = "#282627"
    local bg_search = "#C3542B"
    -- local bg_visual = "#C3542B"
    local bg_visual = "#413200"
    local fg = "#F7BC13"
    local fg_dark = "#C3542B"
    -- local fg_gutter = "#627E97"
    local border = "#131313"

    require("tokyonight").setup({
      style = "night",
      on_colors = function(colors)
        colors.bg = bg
        colors.bg_dark = bg_dark
        colors.bg_float = bg_dark
        colors.bg_highlight = bg_highlight
        colors.bg_popup = bg_dark
        colors.bg_search = bg_search
        colors.bg_sidebar = bg_dark
        colors.bg_statusline = bg
        colors.bg_visual = bg_visual
    --     -- colors.border = border
        colors.fg = fg
        colors.fg_dark = "#018F8C"
        colors.fg_float = fg
        -- colors.fg_gutter = fg
        colors.fg_sidebar = fg
        colors.comment = "#804F08"
        colors.magenta = "#65386F"
        -- colors.cyan = "#5A3362"
        colors.magenta = "#1BC35E"
        colors.blue = "#018F8C"
        colors.green = "#C3542B"
        colors.green1 = "#C3542B"
        colors.cyan = "#29714A"
        colors.blue1 = "#C3542B"
        colors.blue5 = fg
      end,
      on_highlights = function(hl, colors)
        hl.Identifier = {
          fg = "#E27A08",
        }
        hl.Function = {
          fg = colors.blue,
        }
        hl.LineNrAbove = {
          fg = colors.comment,
        }
        hl.LineNrBelow = {
          fg = colors.comment,
        }
        hl.CursorLineNr = {
          fg = fg,
        }
        hl.Number = {
          fg = "#2B77A4",
        }
        hl.Boolean = {
          fg = "#2B77A4",
        }
        hl.Float = {
          fg = "#2B77A4",
        }
      end,
    })

    vim.cmd("colorscheme tokyonight")
  end
}
