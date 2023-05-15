---@diagnostic disable: undefined-global
local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then return end

local numbers =
{ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "12", "13", "14", "15", "16", "17", "18", "19", "20" }
for _, num in pairs(numbers) do
	vim.keymap.set("n", "<leader>" .. num, "<cmd>BufferLineGoToBuffer " .. num .. "<CR>")
end

bufferline.setup {
	options = {
		separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' },
		numbers = function(opts)
			return string.format("%s", opts.raise(opts.ordinal))
			-- return string.format('%s.%s', opts.ordinal, opts.raise(opts.id))
		end,
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			style = "icon",
		},
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and "  " or (e == "warning" and "  " or "  ")
				s = s .. n .. sym
			end
			return s
		end,
		color_icons = true,            -- whether or not to add the filetype icon highlights
		show_buffer_icons = true,      -- enable filetype icons for buffers
		show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
		show_tab_indicators = true,
		persist_buffer_sort = true,    -- whether or not custom sorted buffers should persist
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		sort_by = "insert_at_end", -- 'insert_at_end' | 'insert_after_current' | 'id' | 'extension' | 'relative_directory'
		custom_areas = {
			right = function()
				local result = {}
				local seve = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
				local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
				local info = #vim.diagnostic.get(0, { severity = seve.INFO })
				local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

				if error ~= 0 then
					table.insert(result, { text = "  " .. error, guifg = "#EC5241" })
				end

				if warning ~= 0 then
					table.insert(result, { text = "  " .. warning, guifg = "#EFB839" })
				end

				if hint ~= 0 then
					table.insert(result, { text = "  " .. hint, guifg = "#A3BA5E" })
				end

				if info ~= 0 then
					table.insert(result, { text = "  " .. info, guifg = "#7EA9A7" })
				end
				return result
			end,
		},
	},
}
