return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
	'nvim-lua/plenary.nvim'
    },
    config = function()
	require"telescope".setup({
	    defaults = {
		mappings = {
		    i = {
			["<esc>"] = require"telescope.actions".close
		    }
		}
	    }
	})
    end,
    keys = {
	{"<leader>ff", ":Telescope find_files<CR>", desc = "Find Files"},
	{"<leader>fg", ":Telescope live_grep<CR>", desc = "Find in File"},
	{"<leader>fb", ":Telescope buffers<CR>", desc = "Find Buffers"},
	{"<leader>fo", ":Telescope oldfiles<CR>", desc = "Find Files (History)"},
	{"<leader>fv", ":vs<CR>:Telescope find_files<CR>", desc = "Find File (vsplit)"},
	{"<leader>fh", ":Telescope help_tags<CR>", desc = "Help Tags"}
    }
}
