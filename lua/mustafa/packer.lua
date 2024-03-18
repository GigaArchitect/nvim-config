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
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
use {
        'nvim-treesitter/nvim-treesitter'
}
use {
    "tanvirtin/monokai.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "mfussenegger/nvim-dap",
    "hrsh7th/vim-vsnip",
    "jay-babu/mason-nvim-dap.nvim",
    "mfussenegger/nvim-dap-python",
    "dundalek/lazy-lsp.nvim",
    "m4xshen/autoclose.nvim",
    "VonHeikemen/lsp-zero.nvim",
    "mfussenegger/nvim-lint",
    "nvim-lua/plenary.nvim",
    "ThePrimeagen/harpoon"
}
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
use {
	"nvimtools/none-ls.nvim",
	requires = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
		"nvimtools/none-ls-extras.nvim"
	}
}
end)
