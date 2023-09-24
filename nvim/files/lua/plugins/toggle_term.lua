return {
    'akinsho/toggleterm.nvim',
    config = true,
    keys = {
	{"<leader>tf", ":ToggleTerm direction=float<CR>", desc = "Float Term"},
	{"<leader>tv", ":ToggleTerm direction=vertical<CR>", desc = "Vertical Term"},
	{"<leader>th", ":ToggleTerm direction=horizontal<CR>", desc = "Horizontal Term"}
    }
}
