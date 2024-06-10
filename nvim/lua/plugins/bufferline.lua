local numbers =
{ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "12", "13", "14", "15", "16", "17", "18", "19", "20" }
for _, num in pairs(numbers) do
	vim.keymap.set("n", "<leader>" .. num, "<cmd>BufferLineGoToBuffer " .. num .. "<CR>")
end

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  options = {
    numbers = function(opts)
			return string.format("%s", opts.raise(opts.ordinal))
			-- return string.format('%s.%s', opts.ordinal, opts.raise(opts.id))
		end,
    indicator = {
      style = "icon",
    },
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and "  " or (e == "warning" and "  " or "  ")
				s = s .. n .. sym
			end
			return s
		end,
    diagnostics = "nvim_lsp",
    color_icons = true,
    sort_by = "relative_directory",
    show_tab_indicators = true,
    separator_style = "thin",
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
    always_show_bufferline = false,
  },
}
