return {
    {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
	    {
		"nvim-treesitter/nvim-treesitter-textobjects",
		init = function()
		    -- disable rtp plugin, as we only need its queries for mini.ai
		    -- In case other textobject modules are enabled, we will load them
		    -- once nvim-treesitter is loaded
		    require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
		    load_textobjects = true
		end,
	    },
	},
	cmd = { "TSUpdateSync" },
	opts = {
	    ensure_installed = {'lua', 'vim'},
	    auto_install = true
	}
    },
    {
	"nvim-treesitter/playground",
	keys = {
	    {"<leader>sp", ":TSPlaygroundToggle", desc = "TS Playground"}
	}
    }
}
