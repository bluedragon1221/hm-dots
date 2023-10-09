return {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    opts = {
	theme = "hyper",
	config = {
	    header = {
		"       _.====.._                             ",
		"     ,:._       ~-_                          ",
		"        `\\        ~-_                       ",
		"          |          `.                      ",
		"        ,/             ~-_                   ",
		"-..__..-''                 ~~--..__...----..."
	    },
	    project = {
		enable = false,
	    },
	    shortcut = {
		{ desc = "Quit", key = 'q', action = ":q" },
		{ desc = "Lazy", key = 'l', action = ":Lazy" },
	    },
	    mru = {
		limit = 5, icon = "", label = "Recents"
	    },
	    footer = {
	    }
	},
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}
