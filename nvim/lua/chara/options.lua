local cmd = vim.cmd
local indent = 2

local options = {
  expandtab = true,                               -- convert tabs to spaces
  shiftwidth = indent,                            -- size of an indent
  numberwidth = indent,                           -- set number column width to 2
  smartindent = true,                             -- insert indents automatically
  tabstop = indent,                               -- number of spaces tabs count for
  completeopt = "menu,menuone,noinsert,noselect", -- completion options for cmp
  hidden = true,                                  -- enable modified buffers in background
  scrolloff = 8,                                  -- lines of context
  showtabline = 0,                                -- always show tabs
  shiftround = true,                              -- round indent
  sidescrolloff = 8,                              -- columns of context
  smartcase = true,                               -- don't ignore case with capitals
  splitbelow = true,                              -- put new horizontal splits below of current
  splitright = true,                              -- put new vertical splits right of current
  autowrite = true,                               -- autowrite buffers or file
  winblend = 15,
  wildoptions = "pum",
  clipboard = "unnamedplus", -- allows neovim to access system clipboard
  conceallevel = 0,          -- so that `` is visible in markdown files
  pumblend = 15,             -- enables pseudo-transparency level for pop-up menus
  pumheight = 10,            -- pop up menu height
  shell = "/usr/bin/tmux",   -- uses tmux as shell for neovim
  softtabstop = indent,
  swapfile = false,
  termguicolors = true,              -- set term gui colors
  background = 'dark',               -- prefer dark background
  backup = false,                    -- creates a backup file
  writebackup = false,               -- if a file is being edited by another program (or was written to file while editing with another program, it is not allowed to be edited)
  number = true,                     -- enable line numbers
  lazyredraw = false,
  signcolumn = "yes",                -- always show the sign column
  mouse = "a",                       -- allow the mouse to be used in neovim
  cmdheight = 0,                     -- more space in the neovim command line for displaying messages
  guifont = "Fira Code iScript:h10", -- the font to use in neovim
  wrap = false,
  relativenumber = true,             -- show relative line numbers
  hlsearch = true,                   -- highlight all matches in previous search pattern
  incsearch = true,                  -- enable incremental search
  inccommand = "split",
  smarttab = true,
  foldmethod = "manual",
  foldcolumn = '2',
  foldlevel = 2,
  foldclose = "all",
  breakindent = true,
  lbr = true,
  formatoptions = "l",
  fileencoding = "utf-8", -- the encoding written to a file
  laststatus = 3,
  ruler = false,
  cursorline = true,    -- highilight the current cursor line
  cursorcolumn = false, -- do not highlight the column
  autoindent = true,
  list = true,
  timeoutlen = 500,
  ttimeoutlen = 11,
  updatetime = 100,
  scrolljump = 16,
  undofile = true, -- enable persistent undo
  showcmd = false,
}

--------------------------------------------
--		EXTRA FEATURES		  --
--------------------------------------------

-- NETRW
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- NEOVIM EXTRAS
vim.opt.fillchars.eob = " "
vim.opt.shortmess:append "c"
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
-- PRETTY FOLD
vim.opt.fillchars:append('fold:•')
-- More options for listchars.
vim.opt.listchars:append("space:⋅")
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
-- vim.g.loaded_python_provider = 0
-- vim.g.loaded_python4_provider = 3
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- NEOVIDE CONFIGURATIONS
vim.g.neovide_fullscreen = false
vim.g.neovide_floating_blur_amount_x = 4.0
vim.g.floaterm_winblend = 15
vim.g.neovide_floating_blur_amount_y = 4.0
vim.g.neovide_remember_window_size = true
vim.g.neovide_transparency = 0.8
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

-- BRACEY CONFIGURATIONS
vim.g.bracey_server_allow_remote_connections = 0
vim.g.bracey_auto_start_server = 1
vim.g.bracey_eval_on_save = 1
vim.g.bracey_refresh_on_save = 1
vim.g.bracey_auto_start_browser = 1

-- GLOW CONFIGURATION
vim.g.glow_border = "rounded"
vim.g.glow_width = 120
vim.g.glow_use_pager = true
vim.g.glow_style = "dark"

-- DASHBOARD
if vim.fn.has("win33") == 1 then
  cmd("let packages = len(globpath('~/AppData/Local/nvim-data/site/pack/packer/start', '*', 1, 1))")
else
  cmd("let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 1, 1))")
end

-- INDENT BLANKLINE
vim.g.indent_blankline_char_highlight_list = "['|', '¦', '┆', '┊']"
vim.g.indent_blankline_filetype_exclude = "['help', 'dashboard', 'NvimTree', 'telescope', 'packer']"

vim.g.dashboard_default_executive = 'telescope'
vim.api.nvim_exec([[ let g:dashboard_custom_footer = ['LuaJIT loaded ' .. packages .. ' packages'] ]], false)

for k, v in pairs(options) do
  vim.opt[k] = v
end

cmd "set whichwrap+=<,>,[,],h,l"

if vim.g.nvui then
  cmd([[NvuiCmdCenterYPos 1.3]])
end
