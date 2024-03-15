-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  -- or                            , branch = '0.1.x',
      requires = { 
          {'nvim-lua/plenary.nvim'},
          {"nvim-telescope/telescope-live-grep-args.nvim"}
      },
      config = function()
          require("telescope").load_extension("live_grep_args")
      end
  }

  use { "ellisonleao/gruvbox.nvim" }
  --use {
  --    'morhetz/gruvbox',
  --    config = function() 
  --        vim.cmd.colorscheme("gruvbox") 
  --        -- vim.g.gruvbox_contrast_dark = "hard"
  --        vim.cmd [[
  --        let g:gruvbox_contrast_dark = 'soft'
  --        ]]
  --    end }
--  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('tpope/vim-fugitive')
  use('Raimondi/delimitMate')
  --use('SirVer/ultisnips')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},     -- Required
		  {'hrsh7th/cmp-nvim-lsp'}, -- Required
		  {'L3MON4D3/LuaSnip'},     -- Required
	  }
}
end)
