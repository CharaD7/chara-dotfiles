local numbers =
{ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "12", "13", "14", "15", "16", "17", "18", "19", "20" }
for _, num in pairs(numbers) do
	vim.keymap.set("n", "<leader>" .. num, "<cmd>BufferLineGoToBuffer " .. num .. "<CR>")
end

local bufferline = require "bufferline"

return {
  "akinsho/bufferline.nvim",
  version = "*",
  lazy = true,
  dependencies = "nvim-tree/nvim-web-devicons",
  bufferline.setup({
    options = {
      mode = "buffers", -- tabs or buffers
      numbers = function(opts)
        return string.format("%s", opts.raise(opts.ordinal))
      end,
      indicator = {
        style = "icon",
      },
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and "   " or (e == "warning" and "   " or "   ")
          s = s .. n .. sym
        end
        return s
      end,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      color_icons = true,
      sort_by = "directory", -- 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
      show_tab_indicators = true,
      separator_style = "slope",
      custom_areas = {
        right = function()
          local result = {}
          local seve = vim.diagnostic.severity
          local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
          local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
          local info = #vim.diagnostic.get(0, { severity = seve.INFO })
          local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

          local icons = require "chara.icons"

          if error ~= 0 then
            table.insert(result, { text = " " .. icons.diagnostics.Error .. error, guifg = "#EC5241" })
          end

          if warning ~= 0 then
            table.insert(result, { text = " " .. icons.diagnostics.Warning .. warning, guifg = "#EFB839" })
          end

          if hint ~= 0 then
            table.insert(result, { text = " " .. icons.diagnostics.Hint .. hint, guifg = "#A3BA5E" })
          end

          if info ~= 0 then
            table.insert(result, { text = " " .. icons.diagnostics.Information .. info, guifg = "#7EA9A7" })
          end
          return result
        end,
      },
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true -- use a "true" to enable the default, or set your own character
        }
      }
    },
  })
}
