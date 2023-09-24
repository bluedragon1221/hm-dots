return {
    {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	opts = {
	    disable_filetype = { "TelescopePrompt", "spectre_panel" },
	    disable_in_macro = false,
	    disable_in_visualblock = false,
	    disable_in_replace_mode = true,
	    ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
	    enable_moveright = true,
	    enable_afterquote = true,
	    enable_check_bracket_line = true,
	    enable_bracket_in_quote = true,
	    enable_abbr = false,
	    break_undo = true,
	    check_ts = true,
	    map_cr = true,
	    map_bs = true,
	    map_c_h = false,
	    map_c_w = false,
	}
    },
    {
	"itchyny/vim-cursorword",
	config = function()
	    vim.cmd [[set iskeyword+=-]]
	end,
    },
    {
	"ggandor/leap.nvim",
	dependencies = {
	    "tpope/vim-repeat"
	},
	config = function()
	    require('leap').add_default_mappings()
	end
    },
    {
	'mattn/emmet-vim',
	ft = {"html", "xml"}
    }
}
