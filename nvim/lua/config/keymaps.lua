-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<c-a>")
keymap.set("n", "-", "<c-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<s-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<c-i>", opts)

-- Cycle buffers
keymap.set("n", "<tab>", ":BufferLineCycleNext<cr>", opts)
keymap.set("n", "<s-tab>", ":BufferLineCyclePrev<cr>", opts)

-- Close bulk buffers
keymap.set("n", "L", ":BufferLineCloseRight<cr>", opts)
keymap.set("n", "H", ":BufferLineCloseLeft<cr>", opts)

-- Move buffers forwards or backwards
keymap.set("n", "<Left>", ":BufferLineMovePrev<cr>", opts)
keymap.set("n", "<Right>", ":BufferLineMoveNext<cr>", opts)

-- Split window
keymap.set("n", "ss", ":split<cr>", opts)
keymap.set("n", "sv", ":vsplit<cr>", opts)

-- Move window
keymap.set("n", "sh", "<c-w>h")
keymap.set("n", "sk", "<c-w>k")
keymap.set("n", "sj", "<c-w>j")
keymap.set("n", "sl", "<c-w>l")

-- Vim TMUX navigator
keymap.set("n", "<c-h>", ":<c-u>TmuxNavigateLeft<cr>", opts)
keymap.set("n", "<c-l>", ":<c-u>TmuxNavigateRight<cr>", opts)
keymap.set("n", "<c-k>", ":<c-u>TmuxNavigateUp<cr>", opts)
keymap.set("n", "<c-j>", ":<c-u>TmuxNavigateDown<cr>", opts)
keymap.set("n", "<c-/>", ":<c-u>TmuxNavigatePrevious<cr>", opts)

-- Git conflict resolution
keymap.set("n", "<leader>co", ":GitConflictChooseOurs<cr>", opts)
keymap.set("n", "<leader>ct", ":GitConflictChooseTheirs<cr>", opts)
keymap.set("n", "<leader>cb", ":GitConflictChooseBoth<cr>", opts)
keymap.set("n", "<leader>c0", ":GitConflictChooseNone<cr>", opts)
keymap.set("n", "<leader>cp", ":GitConflictPrevConflict<cr>", opts)
keymap.set("n", "<leader>cn", ":GitConflictNextConflict<cr>", opts)
keymap.set("n", "<leader>cl", ":GitConflictListQf<cr>", opts)

-- Resize window
keymap.set("n", "<c-left>", ":vertical resize -2<cr>", opts)
keymap.set("n", "<c-right>", ":vertical resize +2<cr>", opts)
keymap.set("n", "<c-up", ":resize -2<cr>", opts)
keymap.set("n", "<c-down", ":resize +2<cr>", opts)

-- Telescope buffers
keymap.set("n", "<leader>tb", ":Telescope buffers<cr>", opts)

-- Lspsaga
keymap.set("n", ";f", ":Lspsaga finder<cr>", opts )
keymap.set("n", ";a", ":Lspsaga code_action<cr>", opts)
keymap.set("n", ";o", ":Lspsaga hover_doc<cr>", opts)
keymap.set("n", ";t", ":Lspsaga outline<cr>", opts)
keymap.set("n", ";n", ":Lspsaga rename<cr>", opts)
keymap.set("n", ";N", ":Lspsaga rename ++project<cr>", opts)
keymap.set("n", ";p", ":Lspsaga peek_definition<cr>", opts)
keymap.set("n", "<A-d>", ":Lspsaga term_toggle<cr>", opts)
keymap.set("n", "<leader>cd", ":Lspsaga show_line_diagnostics<cr>", opts)
keymap.set("n", "<leader>cd", ":Lspsaga show_cursor_diagnostics<cr>", opts)
keymap.set("n", ";b", ":Lspsaga show_buf_diagnostics<cr>", opts)
keymap.set("n", ";e", ":Lspsaga diagnostic_jump_next<cr>", opts)
keymap.set("n", ";E", ":Lspsaga diagnostic_jump_prev<cr>", opts)
keymap.set("n", ";w", ":Lspsaga show_workspace_diagnostics<cr>", opts)

--Toggleterm
keymap.set("n", "<leader>tf", ":ToggleTerm<cr>", opts)
keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal size=25<cr>", opts)
keymap.set("n", "<leader>tt", ":ToggleTerm direction=tab<cr>", opts)
keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical size=25<cr>", opts)

-- Messages
keymap.set("n", ";m", ":messages<cr>", opts)

-- Checkhealth
keymap.set("n", "<leader>ch", ":checkhealth<cr>", opts)

-- Source lua file
keymap.set("n", "so", ":source %<cr>", opts)

-- Quit commands
keymap.set("n", "q", ":q<cr>", opts)
keymap.set("n", "Q", ":qa<cr>", opts)

-- Stop highlights after searching.
keymap.set("n", "<esc>", ":noh<cr><esc>", opts)

-- Normal mode Line bubbling
keymap.set("n", "<s-a-j>", ":m .+1<CR>==", opts)
keymap.set("n", "<s-a-k>", ":m .-2<CR>==", opts)

-- Visual mode Line bubbling
keymap.set("v", "<s-a-j>", ":m '>+1<CR>==gv=gv", opts)
keymap.set("v", "<s-a-k>", ":m '<-2<CR>==gv=gv", opts)

-- Delete current buffer
keymap.set("n", "<c-x>", ":bdelete<cr>", opts)
