-- basic configure
require('basic')

-- keymap
require('keymaps')

-- plugins
require('plugins')

-- colorschemeso
require("colorscheme")

-- plugins config
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.nvim-treesitter")

-- LSP
require("lsp.setup")
-- 自动补全
require("cmp.setup")
-- require("plugin-config.toggleterm")
