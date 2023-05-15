local status_ok, luasnip = pcall(require, 'luasnip')
if not status_ok then return end

local snips = function(opts)
  luasnip.config.set_config(opts)

  -- vscode format
  require('luasnip.loaders.from_vscode').lazy_load()
  require('luasnip.loaders.from_vscode').lazy_load { paths = vim.g.vscode_snippets_path or
      '~/.local/share/nvim/site/pack/packer/start/friendly-snippets/snippets/' }

  -- lua format
  require('luasnip.loaders.from_lua').lazy_load()
  require('luasnip.loaders.from_lua').lazy_load { paths = vim.g.lua_snippets_path or '' }
end

return snips
