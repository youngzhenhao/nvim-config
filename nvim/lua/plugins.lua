local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- catppuccin 
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    -- nvim-cmp
    -- Vscode-like pictograms
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	-- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},
	-- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
    -- LSP manager
    {
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
	    "neovim/nvim-lspconfig",
    }, 
    {
       "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- telescope 所需
            "MunifTanjim/nui.nvim",
    
            -- 可选
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- 配置放在这里
            cn = {
                enabled = true,
            },
        },
    },
})

