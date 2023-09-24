return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 000
	    vim.g.mapleader = " "
	end,
	config = function()
	    require"which-key".setup({
		icons = {
		    separator = "->",
		    group = ""
		},
		window = {
		    padding = {1,0,0,0}
		},
		layout = {
		    align = "left"
		},
		show_help = false,
		show_keys = false
	    })
	    require"which-key".register({
		["<leader>f"] = { name = "Find" },
		["<leader>t"] = { name = "Term" },
		["<leader>n"] = { name = "Noice" },
		["<leader>s"] = { name = "Treesitter" }
	    })
	end,
}
