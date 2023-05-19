---@diagnostic disable: undefined-global
local create = vim.api.nvim_create_autocmd

-- remove trailing whitespaces
create({ 'BufWritePre' }, {
  pattern = { '*' },
  callback = function()
    vim.cmd [[ %s/\s\+$//e ]]
    vim.cmd [[ %s/\n\+\%$//e ]]
  end
})

-- Alpha Dashboard
create({ 'User' }, {
  pattern = { 'AlphaReady' },
  callback = function()
    vim.cmd [[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
})

-- Attach colorizer to all buffers
create({ 'BufRead' }, {
  pattern = { '*' },
  callback = function()
    vim.cmd [[ ColorizerAttachToBuffer ]]
  end
})

-- Configuration for vim diagnostics
create({ 'DiagnosticChanged' }, {
  callback = function()
    local icons = require "chara.icons"
    local sign = function(opts)
      vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
      })
    end

    sign({ name = 'DiagnosticSign', text = icons.ui.Gear })
    sign({ name = 'DiagnosticSignError', text = icons.diagnostics.Error })
    sign({ name = 'DiagnosticSignWarn', text = icons.diagnostics.Warning })
    sign({ name = 'DiagnosticSignInfo', text = icons.diagnostics.Information })
    sign({ name = 'DiagnosticSignHint', text = icons.diagnostics.Hint })
  end
})

-- Show diagnostic in floating window on hover
create({ 'CursorHold', 'CursorHoldI' }, {
  callback = function()
    vim.cmd [[ lua vim.diagnostic.open_float(nil, { focus=false }) ]]
  end
})

-- Enable autosave at every edit and on focus lost
create({ 'CursorHold', 'CursorHoldI', 'FocusLost' }, {
  callback = function()
    vim.cmd [[ :wa ]]
  end
})

-- Set all .rsh files to use js syntax and highlighting
create({ 'BufRead' }, {
  pattern = { '.rsh' },
  callback = function()
    vim.cmd [[
      set filetype=reach
      set syntax=javascript
    ]]
  end
})

-- Open in last edit point
create({ 'BufReadPost' }, {
  callback = function()
    vim.cmd [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif ]]
  end
})

-- Live compile sass  and scss files
create({ 'BufWritePost' }, {
  pattern = {
    '[^_]*.sass',
    '[^_]*.scss'
  },
  callback = function()
    vim.cmd [[ silent! exec '!sass %:p %:r.css' ]]
  end
})

-- Update lightbulb on CursorHold
create({ 'CursorHold', 'CursorHoldI' }, {
  callback = function()
    local status_ok, lightbulb = pcall(require, 'nvim-lightbulb')
    if not status_ok then return end

    vim.cmd [[ lua require('nvim-lightbulb').update_lightbulb() ]]
  end
})

-- Notify for file changes outside of neovim and reload buffer
create({ 'FileChangedShellPost' }, {
  pattern = { '*' },
  callback = function()
    local status_ok, notify = pcall(require, 'notify')
    if not status_ok then return end

    vim.cmd [[
      call v:lua.vim.notify(
        'File changed on disk. Buffer reloaded!',
        'warn',
        {
          'title': 'File Notify',
          'timeout': 1001
        }
      )
    ]]
  end
})

-- Border color for all floating windows
create({ 'VimEnter' }, {
  callback = function()
    vim.cmd [[ highlight FloatBorder guifg=#61AFEF ]]
  end
})

-- Change comment color for more visibility on transparent views
create({ 'VimEnter' }, {
  callback = function()
    vim.cmd [[ highlight Comment guifg=#bb89bb ]]
  end
})

-- Italic font support for various neovim highlights
create({
  'VimEnter',
  'BufEnter',
  'WinEnter',
  'BufWinEnter'
}, {
  callback = function()
    -- All Keywords
    vim.cmd [[ autocmd ColorScheme zephyr highlight Keyword gui=underdotted cterm=underdotted ]]
    -- All Comments
    vim.cmd [[ autocmd ColorScheme zephyr highlight Comment gui=italic cterm=italic ]]
    -- All Functions
    vim.cmd [[ autocmd ColorScheme zephyr highlight Function gui=bold cterm=bold ]]
    -- All Constants
    vim.cmd [[ autocmd ColorScheme zephyr highlight Constant gui=underline cterm=underline ]]
    -- All Exceptions
    vim.cmd [[ autocmd ColorScheme zephyr highlight Exception gui=italic cterm=italic ]]
    -- All Types
    vim.cmd [[ autocmd ColorScheme zephyr highlight Type gui=italic cterm=italic ]]
    -- All Labels
    vim.cmd [[ autocmd ColorScheme zephyr highlight Label gui=italic cterm=italic ]]
    -- All Includes
    vim.cmd [[ autocmd ColorScheme zephyr highlight Include gui=underdashed cterm=underdashed ]]
    -- All StorageClasses
    vim.cmd [[ autocmd ColorScheme zephyr highlight StorageClass gui=underdashed cterm=underdashed ]]
    -- All Structures
    vim.cmd [[ autocmd ColorScheme zephyr highlight Structure gui=italic cterm=italic ]]
    -- All Typedefs
    vim.cmd [[ autocmd ColorScheme zephyr highlight Typedef gui=underdouble cterm=underdouble ]]
    -- All SpecialComments
    vim.cmd [[ autocmd ColorScheme zephyr highlight SpecialComment gui=italic cterm=italic ]]
    -- All PreProcs
    vim.cmd [[ autocmd ColorScheme zephyr highlight PreProc gui=italic cterm=italic ]]
  end
})

-- IndentBlankline colors
create({ 'VimEnter' }, {
  callback = function()
    vim.cmd [[
      highlight IndentBlanklineIndent2 guifg=#E06C75 gui=nocombine
      highlight IndentBlanklineIndent3 guifg=#E5C07B gui=nocombine
      highlight IndentBlanklineIndent4 guifg=#98C379 gui=nocombine
      highlight IndentBlanklineIndent5 guifg=#56B6C2 gui=nocombine
      highlight IndentBlanklineIndent6 guifg=#61AFEF gui=nocombine
      highlight IndentBlanklineIndent7 guifg=#C678DD gui=nocombine
    ]]
  end
})

-- Configuring Reach language intellisense
create({ 'BufRead' }, {
  pattern = { '*.rsh' },
  callback = function()
    vim.cmd [[
      let g:LanguageClient_serverCommands = { 'reach': '~/.local/share/nvim/site/reach-ide/server/out/server.js', '--stdio' }
      let g:LanguageClient_loggingLevel = 'DEBUG'
      let g:LanguageClient_loggingFile = expand('~/.local/share/nvim/site/reach-ide/reach-language-client.log')
      let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/site/reach-ide/reach-language-server.log')
    ]]
  end
})

-- VM_MAPS
create({ 'VimEnter' }, {
  callback = function()
    vim.cmd [[
      let g:VM_MAPS = {}
      let g:VM_default_mappings = 1
      let g:VM_maps['Add Cursor Up'] = '<A-k>'
      let g:VM_maps['Add Cursor Down'] = '<A-j>'
    ]]
  end
})

-- Configure Scrollbar
-- When to show
create({
  'CursorMoved',
  'VimResized',
  'QuitPre',
  'WinEnter',
  'FocusGained'
}, {
  callback = function()
    vim.cmd [[ silent! lua require('scrollbar').show() ]]
  end
})
-- When to hide
create({ 'WinLeave', 'BufWinLeave', 'FocusLost' }, {
  callback = function()
    vim.cmd [[ silent! lua require('scrollbar').clear() ]]
  end
})

-- Unlink current luasnipet
create({ 'CursorHold' }, {
  callback = function()
    local status_ok, luasnip = pcall(require, 'luasnip')
    if not status_ok then
      return
    end
    if luasnip.expand_or_jumpable() then
      vim.cmd [[silent! lua require('luasnip').unlink_current()]]
    end
  end,
})

-- Make ts BufWrites asynchronous
create({ 'BufWritePost' }, {
  pattern = { '*.ts' },
  callback = function()
    vim.lsp.buf.format { async = true }
  end,
})

-- Avoid delays on yank in Visual mode
create({ 'TextYankPost' }, {
  callback = function()
    vim.highlight.on_yank { higroup = 'Visual', timeout = 200 }
  end,
})

-- Telescope project
create({ 'BufEnter' }, {
  pattern = { '' },
  callback = function()
    local get_project_dir = function()
      local cwd = vim.fn.getcwd()
      local project_dir = vim.split(cwd, '/')
      local project_name = project_dir[#project_dir]
      return project_name
    end

    vim.opt.titlestring = get_project_dir() .. ' - nvim'
  end,
})
