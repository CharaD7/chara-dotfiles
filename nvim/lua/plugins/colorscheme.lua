return {
  {
    "glepnir/zephyr-nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "morhetz/gruvbox",
    lazy = true,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    style = 'moon',
    priority = 1000,
    opts = {
      on_highlights = function(hl)
        local green = "#2aa198"
        local lightred = "#F28FAD"
        hl.LineNr = {
          fg = green,
        }
        hl.LineNrAbove = {
          fg = green,
        }
        hl.LineNrBelow = {
          fg = green,
        }
        hl.CursorLineNr = {
          fg = lightred,
          bold = true,
        }
        hl.FloatBorder = {
          fg = lightred,
        }
      end
    },
  },
}
