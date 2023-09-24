-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- Set some stuff
require"config.set"

-- Treat everything in `lua/plugins` as a plugin
require"lazy".setup("plugins")

vim.cmd [[colorscheme onedark]]

local keymap = vim.api.nvim_set_keymap
keymap("n", ";", "$a;<esc>", {})

