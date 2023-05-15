-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- Install packer
-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print("Installing packer...")
	local packer_url = "https://github.com/wbthomason/packer.nvim"
	vim.fn.system({ "git", "clone", "--depth", "1", packer_url, install_path })
	print("Installed packer, close and reopen Neovim.")

	vim.cmd("packadd packer.nvim")
	install_plugins = true
end

-- Autocommand that reloads neovim whenever you save the init.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then return end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require('packer.util').float { border = 'rounded' }
		end,
	}
}

return packer.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } })
	use("glepnir/zephyr-nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/nvim-treesitter-refactor")
	use({
		"romgrk/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({})
		end,
	})                                         -- Shows the current function/class as float window at the top of the window
	use("theHamsta/nvim-treesitter-commonlisp") -- highlight functions
	use("nvim-treesitter/playground")
	use("mbbill/undotree")
	use("ericglau/vim-reach")
	use({ "autozimu/LanguageClient-neovim", run = "bash install.sh" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("junegunn/fzf")
	use("sharkdp/fd")
	use("sheerun/vim-polyglot") -- This is to help with razor files
	use("nathom/filetype.nvim")
	use("mhinz/vim-signify")
	use("MunifTanjim/prettier.nvim")
	use({ "CRAG666/code_runner.nvim" })
	use({ "numToStr/Comment.nvim" })
	use("SmiteshP/nvim-navic")
	use("ryanoasis/vim-devicons") -- optional, for file icon
	use({ "akinsho/bufferline.nvim", tag = "v2.*" })
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		tag = "nightly",
		config = function()
			require("nvim-tree").setup({})
		end,
	})
	-- for resolving git merge conflicts directly in neovim
	use({
		'akinsho/git-conflict.nvim',
		tag = "*",
		config = function()
			require('git-conflict').setup()
		end,
	})
	-- git related
	use("rmagatti/auto-session")
	use("rmagatti/session-lens")
	use({ "lewis6991/gitsigns.nvim" })
	use("tpope/vim-repeat")
	-- use('teal-language/vim-teal')
	use("tpope/vim-endwise")
	use("f-person/git-blame.nvim") -- show git message
	use("andymass/vim-matchup")   -- Provides language-specific % style pair and tuple matching, highlighting, and text-objects
	use({
		"beauwilliams/focus.nvim",
		config = function()
			require("focus").setup()
		end,
	})                                -- auto screen resizer
	use("Xuyuanp/scrollbar.nvim")     -- Scrollbar
	use("norcalli/nvim-colorizer.lua") -- Color value highlighting
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
		end
	})
	-- navigation finder operator
	use("haya14busa/vim-asterisk")
	use("nvim-lualine/lualine.nvim")
	use("mg979/vim-visual-multi")
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			require("hop").setup()
		end,
	})
	use("ggandor/lightspeed.nvim")
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
			require("telescope").load_extension("projects")
		end,
	})
	-- Noice
	use({
		"folke/noice.nvim",
		event = "VimEnter",
		config = function()
			local noice_status_ok, noice = pcall(require, 'noice')
			if not noice_status_ok then return end
			noice.setup {
				lsp = {
					override = {
						["vim.lsp.textDocument_hover"] = false,
						["vim.lsp.util.stylize_markdown"] = true,
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					hover = {
						enabled = false,
					}
				}
			}
		end,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
			"hrsh7th/nvim-cmp",
		},
	})
	-- Java support
	use("mfussenegger/nvim-jdtls")
	use("artur-shaik/jc.nvim")
	-- Grammar suggestions load_extension
	use("neovim/nvim-lspconfig")
	use("RRethy/vim-illuminate")
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("xiyaowong/nvim-transparent")
	use({ "diepm/vim-rest-console", ft = { "rest" } }) -- rest live testing
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-go",
			"haydenmeade/neotest-jest",
			"nvim-neotest/neotest-vim-test",
		}
	})
	use("folke/neodev.nvim")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use({
		"hrsh7th/cmp-nvim-lsp",
		requires = {
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-buffer" },
			{ "ray-x/cmp-treesitter" },
			{ "hrsh7th/cmp-calc" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-emoji" },
			{ "tzachar/cmp-tabnine", run = "./install.sh" },
		},
	})
	use("goolord/alpha-nvim")
	use("xiyaowong/telescope-emoji.nvim") -- allow looking up and using emojies inside out files
	-- Grammar tips
	use("folke/lsp-trouble.nvim")
	use("onsails/lspkind-nvim")
	use("liuchengxu/vista.vim")
	use("pantharshit00/vim-prisma") -- prisma support
	use({
		"ray-x/navigator.lua",
		requires = {
			{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
		},
		config = function()
			require("navigator").setup()
		end,
	})
	use("mtth/scratch.vim") -- For taking notes (Uses 'gs' to invoke command)
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
		config = function()
			require("nvim-code-action").setup()
		end,
	})
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require('lspsaga').setup({})
		end
	})
	-- use({ "glepnir/lspsaga.nvim", branch = "main", commit = "b7b4777" })
	use("tomlion/vim-solidity")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("kosayoda/nvim-lightbulb")
	-- use("jose-elias-alvarez/null-ls.nvim") -- snippet related use 'hrsh7th/vim-vsnip'
	use("hrsh7th/cmp-cmdline")
	use("rafamadriz/friendly-snippets")
	-- Easy to operate
	use("tpope/vim-eunuch")
	use("gennaro-tedesco/nvim-peekup") -- View historical copy and delete registers, shortcut keys ""
	use("voldikss/vim-translator")    -- npm install fanyi -g (install translation)
	use("windwp/nvim-autopairs")      -- Automatic symbol matching
	use("windwp/nvim-ts-autotag")
	use("chaoren/vim-wordmotion")
	-- for saving code snapshots
	use({
		"krivahtoo/silicon.nvim",
		run = './install.sh',
		config = function()
			local silicon_status_ok, silicon = pcall(require, 'silicon')
			if not silicon_status_ok then return end

			silicon.setup {
				font = 'CaskaydiaCove Nerd Font=14',
				theme = 'Monokai Extended',
			}
		end,
	})
	use("ur4ltz/surround.nvim")
	use("folke/which-key.nvim") -- hint leader button
	-- intuitive toggleterm
	use { "akinsho/toggleterm.nvim", tag = '*' }
	use("sindrets/diffview.nvim") -- diff compare
	use({
		"SmiteshP/nvim-gps",
		config = function()
			require("nvim-gps").setup()
		end,
	})
	use("p00f/nvim-ts-rainbow") -- Rainbow matching
	use("folke/todo-comments.nvim")
	use("tpope/vim-fugitive")
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			-- Snippet Collection (Optional)
			{ 'rafamadriz/friendly-snippets' },
		}
	}
	use("ThePrimeagen/vim-be-good")
	use({ "rcarriga/nvim-notify", config = 'vim.notify = require("notify")' })
	use({ "michaelb/sniprun", run = "bash ./install.sh" })
	use('anuvyklack/pretty-fold.nvim')

	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
