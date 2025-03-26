-- Automatically install vim-plug if it is not installed
local install_path = vim.fn.stdpath('data')..'/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    'curl', '-fLo', install_path, '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  })
end

-- Run the vim-plug installation and plugin setup
vim.cmd [[
	call plug#begin('~/.vim/plugged')

	" Dependencies comes at the top
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-neotest/nvim-nio'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'nvim-tree/nvim-web-devicons'

	" Files
	Plug 'ibhagwan/fzf-lua'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

	" Theme
	Plug 'nvim-lualine/lualine.nvim'

	" Git
	Plug 'tpope/vim-fugitive'

	" Dev
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'

	Plug 'mfussenegger/nvim-dap'
	Plug 'rcarriga/nvim-dap-ui'
	Plug 'theHamsta/nvim-dap-virtual-text'

	Plug 'habamax/vim-godot'

	Plug 'folke/todo-comments.nvim'

	Plug 'windwp/nvim-autopairs'

	Plug 'numToStr/Comment.nvim'

	" Workflow
	Plug 'nvim-pack/nvim-spectre'

	call plug#end()
	
]]

-- Now I load other settings and configurations
require('config.settings')
require('config.dev_config')
require('config.telescope_config')
require('config.mappings')
require('config.quick_access')

require('lualine').setup()
require("nvim-autopairs").setup{}
require("Comment").setup{}
require("spectre").setup{}



