local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local map = vim.keymap.set

-- Remap space as leader key
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- MODES
--    normal_mode = 'n'
--    insert_mode = 'i'
--    visual_mode = 'v'
--    visual_block_mode = 'x'
--    term_mode = 't'
--    command_mode = 'c'

-- NORMAL MODE MAPS --
-- Better window navigation
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-k>', '<c-w>k', opts)
map('n', '<c-l>', '<c-w>l', opts)
-- Split Focus
map('n', '<leader>h', ':FocusSplitLeft<CR>', opts)
map('n', '<leader>j', ':FocusSplitDown<CR>', opts)
map('n', '<leader>k', ':FocusSplitUp<CR>', opts)
map('n', '<leader>l', ':FocusSplitRight<CR>', opts)
-- Move by visual line, not actual line
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
-- Easy sourcing of lua files
map('n', 'so', ':so<CR>', opts)
-- Quit commands
map('n', 'q', ':q<CR>', opts)
map('n', 'Q', ':qa<CR>', opts)
-- For unknown extensions for js files
map('n', '<leader>js', ':set filetype=javascript<CR>', opts)
--After searching, pressing escape stops the highlight
map('n', '<esc>', ':noh<cr><esc>', opts)
-- Easy select all of file
map('n', '<c-a>', 'ggVG<c-$>', opts)
-- Line bubbling
map('n', '<s-a-j>', ':m .+1<CR>==', opts)
map('n', '<s-a-k>', ':m .-2<CR>==', opts)
-- Save file
map('n', '<c-s>', ':w!<CR>', opts)
-- Delete current buffer
map('n', '<c-x>', ':bdelete<CR>', opts)
-- -- Remove newbie crutches in COMMAND mode
map('n', '<Up>', '<Nop>', opts)
map('n', '<Down>', '<Nop>', opts)
map('n', '<Left>', '<Nop>', opts)
map('n', '<Right>', '<Nop>', opts)
-- Git conflict commands
map('n', '<leader>co', ':GitConflictChooseOurs<CR>', opts)
map('n', '<leader>ct', ':GitConflictChooseTheirs<CR>', opts)
map('n', '<leader>cb', ':GitConflictChooseBoth<CR>', opts)
map('n', '<leader>c0', ':GitConflictChooseNone<CR>', opts)
map('n', '<leader>cp', ':GitConflictPrevConflict<CR>', opts)
map('n', '<leader>cn', ':GitConflictNextConflict<CR>', opts)
-- Toggle Transparency
map('n', 'T', ':TransparentToggle<CR>', opts)
-- Easy motions
map('n', '<leader>hw', ':HopWord<CR>', opts)
map('n', '<leader>hl', ':HopLine<CR>', opts)
-- Telescope commands
map('n', ';ff', ':Telescope find_files hidden=true<CR>', opts)
map('n', ';gf', ':Telescope git_files<CR>', opts)
map('n', ';gc', ':Telescope git_commits<CR>', opts) -- view git commits
map('n', ';bc', ':Telescope git_bcommits<CR>', opts) -- lists git commits with diff preview and checks them out on <cr>
map('n', ';bs', ':Telescope git_status<CR>', opts) -- lists current changes per file with diff preview and add action
map('n', ';br', ':Telescope git_branches<CR>', opts) -- lists alll branches with log preview, checkout action <cr>, track action <c-t> and rebase action <c-r>
map('n', ';st', ':Telescope git_stash<CR>', opts) -- lists stash items in current repository with ability to apply them on <cr>
map('n', ';fg', ':Telescope live_grep grep_open_files=true<CR>', opts)
map('n', ';gs', ':Telescope grep_string<CR>', opts)
map('n', ';bb', ':Telescope buffers<CR>', opts)
map('n', ';fh', ':Telescope help_tags<CR>', opts)
map('n', ';ts', ':Telescope treesitter<CR>', opts)
map('n', ';tc', ':Telescope commands<CR>', opts)
map('n', ';tm', ':Telescope marks<CR>', opts)
map('n', ';te', ':Telescope emoji<CR>', opts)
-- DapUi commands
map('n', '<F5>', ':lua require("dap").continue()<CR>', opts) -- Press f5 to debug
map('n', ';b', ':lua require("dap").toggle_breakpoint()<CR>', opts) -- Press CTRL + b to toggle regular breakpoint
map('n', '<c-c>', ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint Condition: "))<CR>', opts) -- Press CTRL + c to toggle Breakpoint with Condition
map('n', ';db', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log Point Msg: "))<CR>', opts) -- Press CTRL + l to toggle Logpoint
map('n', '<F10>', ':lua require("dap").step_over()<CR>', opts) -- Pressing F10 to step over
map('n', '<F11>', ':lua require("dap").step_into()<CR>', opts) -- Pressing F11 to step into
map('n', '<F12>', ':lua require("dap").step_out()<CR>', opts) -- Pressing F12 to step out
map('n', '<F6>', ':lua require("dap").repl.open()<CR>', opts) -- Press F6 to open REPL
map('n', ';dl', ':lua require("dap").run_last()<CR>', opts) -- Press dl to run last ran configuration (if you used f5 before it will re run it etc)
-- Neotest
map("n", "<leader>na", ":lua require('neotest').run.attach()<CR>", opts)
map("n", "<leader>nf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts)
map("n", "<leader>nF", ":lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<CR>", opts)
map("n", "<leader>nl", ":lua require('neotest').run.run_last()<CR>", opts)
map("n", "<leader>nL", ":lua require('neotest').run.run_last({ strategy = 'dap' })<CR>", opts)
map("n", "<leader>nn", ":lua require('neotest').run.run()<CR>", opts)
map("n", "<leader>nN", ":lua require('neotest').run.run({strategy = 'dap'})<CR>", opts)
map("n", "<leader>no", ":lua require('neotest').output.open({ enter = true })<CR>", opts)
map("n", "<leader>nS", ":lua require('neotest').run.stop()<CR>", opts)
map("n", "<leader>ns", ":lua require('neotest').summary.toggle()<CR>", opts)
-- NvimTree
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
-- Messages
map('n', 'mg', ':messages<CR>', opts)
-- Sessions
map('n', '<leader>ss', ':SaveSession .sessions<CR>', opts)
map('n', '<leader>sh', ':Telescope session-lens search_session<CR>', opts)
map('n', '<leader>sr', ':RestoreSession .sessions<CR>', opts)
map('n', '<leader>sd', ':DeleteSession .sessions<CR>', opts)
map('n', '<leader>sl', ':SessionLoad .sessions<CR>', opts)
-- BufferLine
map('n', ';b', ':BufferLinePick<CR>', opts)
map('n', ';bp', ':BufferLineTogglePin<CR>', opts)
map('n', 'L', ':BufferLineCloseRight<CR>', opts)
map('n', 'H', ':BufferLineCloseLeft<CR>', opts)
map('n', '<Left>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<Right>', ':BufferLineCycleNext<CR>', opts)
-- Lspsaga
map("n", "[f", ":Lspsaga lsp_finder<CR>", opts)
map("n", "[a", ":Lspsaga code_action<CR>", opts)
map("n", "[g", ":Lspsaga open_floaterm lazygit<CR>", opts)
map("n", "[o", ":Lspsaga hover_doc<CR>", opts)
map("n", "[s", ":Lspsaga signature_help<CR>", opts)
map("n", "[t", ":Lspsaga outline<CR>", opts)
map("n", "[n", ":Lspsaga rename<CR>", opts)
map("n", "[N", ":Lspsaga rename ++project<CR>", opts)
map("n", "gd", ":Lspsaga preview_definition<CR>", opts)
map("n", "<A-d>", ":Lspsaga term_toggle<CR>", opts)
map("n", "<leader>cd", ":Lspsaga show_line_diagnostics<CR>", opts)
map("n", "<leader>cd", ":Lspsaga show_cursor_diagnostics<CR>", opts)
map("n", "[b", ":Lspsaga show_buf_diagnostics<CR>", opts)
map("n", "[e", ":Lspsaga diagnostic_jump_next<CR>", opts)
map("n", "]e", ":Lspsaga diagnostic_jump_prev<CR>", opts)
map("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
map("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)
-- Nvim workspace
map("n", "<space>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
map("n", "<space>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
map("n", "<space>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
-- Toggleterm
map('n', '<leader>tf', ':ToggleTerm<CR>', opts)
map('n', '<leader>th', ':ToggleTerm direction=horizontal size=10<CR>', opts)
map('n', '<leader>tt', ':ToggleTerm direction=tab size=10<CR>', opts)
map('n', '<leader>tv', ':ToggleTerm direction=vertical size=10<CR>', opts)
-- UndoTree
map('n', '<c-u>', ':UndotreeToggle<CR>', opts)

-- INSERT MODE MAPS --
-- -- Remove newbie crutches in COMMAND mode
map('i', '<Up>', '<Nop>', opts)
map('i', '<Down>', '<Nop>', opts)
map('i', '<Left>', '<Nop>', opts)
map('i', '<Right>', '<Nop>', opts)

-- VISUAL MODE MAPS --
-- Line bubbling
map('v', '<s-a-j>', ":m '>+1<CR>==gv=gv", opts)
map('v', '<s-a-k>', ":m '<-2<CR>==gv=gv", opts)
map('v', 'p', '"_dP', opts)
-- Lspsaga range code action
map("v", "[a", ":<C-U>Lspsaga range_code_action<CR>", opts)

-- Stay in indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- VISUAL BLOCK MODE MAPS --

-- TERMINAL MODE MAPS --
map('t', '<c-h>', '<c-w>h', term_opts)
map('t', '<c-j>', '<c-w>j', term_opts)
map('t', '<c-k>', '<c-w>k', term_opts)
map('t', '<c-l>', '<c-w>l', term_opts)
-- toggle lspsaga floating term
map("t", "<A-d>", ":Lspsaga term_toggle<CR>", opts)

-- COMMAND MODE MAPS --
-- -- Remove newbie crutches in COMMAND mode
map('c', '<Up>', '<Nop>', opts)
map('c', '<Down>', '<Nop>', opts)
map('c', '<Left>', '<Nop>', opts)
map('c', '<Right>', '<Nop>', opts)
