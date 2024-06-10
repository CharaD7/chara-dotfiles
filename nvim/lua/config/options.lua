-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local cmd = vim.cmd

local options = {
  guifont = "Fira Code iScript:h10",
  list = true,
  updatetime = 100,
  timeoutlen = 500,
  ttimeoutlen = 11,
  wildoptions = "pum",
  pumblend = 15,
  winblend = 15,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

-- Undercurl
cmd([[ let &t_Cs = "\e[4:3m]" ]])
cmd([[ let &t_Ce = "\e[4:0m]" ]])

-- Pretty Fold
vim.opt.fillchars:append('fold:•')
-- More options for listchars.
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_slp = "pyright"

-- Neovide Configuration
vim.g.neovide_fullscreen = false
vim.g.neovide_floating_blur_amount_x = 4.0
vim.g.floaterm_winblend = 15
vim.g.neovide_floating_blur_amount_y = 4.0
vim.g.neovide_remember_window_size = true
vim.g.neovide_transparency = 1
-- vim.g.neovide_transparency = 0.8
vim.g.neovide_padding_top = 10
vim.g.neovide_padding_bottom = 10
vim.g.neovide_padding_right = 10
vim.g.neovide_padding_left = 10
vim.g.neovide_cursor_animation_length = 0.13
vim.g.neovide_cursor_trail_length = 0.8
vim.g.neovide_cursor_vfx_mode = "railgun" -- Railgun particles behind cursor
vim.g.neovide_cursor_vfx_opacity = 200.0
vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
vim.g.neovide_cursor_vfx_particle_density = 7.0
vim.g.neovide_cursor_vfx_particle_speed = 10.0
vim.g.neovide_cursor_vfx_particle_phase = 1.5
vim.g.neovide_cursor_vfx_particle_curl = 1.0
vim.g.neovide_cursor_unfocused_outline_width = 0.125
