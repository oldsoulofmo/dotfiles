-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
}

 use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }


  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- LSP Support
          {'neovim/nvim-lspconfig'},
          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'L3MON4D3/LuaSnip'},
      }
  }

  use { "mfussenegger/nvim-jdtls"}
  use 'folke/tokyonight.nvim'
   use 'xiyaowong/transparent.nvim'

require("transparent").setup({
  enable = true, -- Enable transparency
  extra_groups = {
    "Normal",
    "NormalNC",
    "EndOfBuffer",
    "CursorLineNr",
    "SignColumn",
    "LineNr",
    "StatusLine",
    "StatusLineNC",
  }, -- List of highlight groups to make transparent
  exclude = {}, -- Exclude specific groups if necessary
})

    require('nvim-treesitter.install').command_extra_args = {
  curl = { "--insecure" }
}
-- Treesitter configuration
require('nvim-treesitter.configs').setup({
  ensure_installed = { "c", "cpp","c_sharp", "python", "lua", "javascript", "html", "css" }, -- Languages you want
  highlight = {
    enable = true, -- Enable Treesitter-based syntax highlighting
    additional_vim_regex_highlighting = false, -- Set to true if you want to use Vim’s syntax highlighting alongside
  },
  indent = {
    enable = true -- Enable Treesitter-based indentation
  },
})



-- Optional: Refresh the transparency setting if it doesn’t take effect immediately
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    require("transparent").toggle(true)
  end
})



end)
