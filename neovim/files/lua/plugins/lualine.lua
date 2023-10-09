local function toProjName(filename)
    -- Get the basename
    local filenameParts = {}
    for part in string.gmatch(filename, "([^/]+)") do
        table.insert(filenameParts, part)
    end
    local basename = filenameParts[#filenameParts]

    -- Remove file extension
    local noExt = string.match(basename, "([^%.]+)")

    -- Replace '_' and '-' with ' '
    local lower = noExt:gsub("[-_]", " ")

    -- Capitalize every word
    local caps = string.gsub(lower, "(%w)(%w*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)

    return caps
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    opts = {
	options = {
	    icons_enabled = true,
	    theme = 'onedark',
	    component_separators = { left = '', right = ''},
	    section_separators = { left = '', right = ''},
	    disabled_filetypes = {
		statusline = {},
		winbar = {},
	    },
	    ignore_focus = {},
	    always_divide_middle = true,
	    globalstatus = true,
	    refresh = {
		statusline = 1000,
		tabline = 1000,
		winbar = 1000,
	    }
	},
	sections = {
	    lualine_a = {'mode'},
	    lualine_b = {
		function()
		    return toProjName(vim.api.nvim_buf_get_name(0))
		end
	    },
	    lualine_c = {'%=', 'buffers'},
	    lualine_x = {'searchcount'},
	    lualine_y = {'filetype'},
	    lualine_z = {
		function()
		    local x,y = unpack(vim.api.nvim_win_get_cursor(0))
		    return "ln " .. x .. " col " .. y
		end
	    }
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {'toggleterm'}
    }
}
