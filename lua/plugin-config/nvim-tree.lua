local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
        vim.nofity("nvim-tree not found!")
        return
end

-- shotcuts

local list_keys = require('keymaps').nvimTreeList
nvim_tree.setup({
        -- disable build-in netrw
        disable_netrw=true,

        -- show git icons
        git = {
                enable=true,
        },

        -- project plugin need 
        update_cwd = true,
        update_focused_file = {
                enable = true,
                update_cwd = true,
        },

        -- for project plugin
        update_cwd = true,
        update_focused_file = {
                enable = true,
                update_cwd = true,
        },

        -- do not show dot file and node_modules folder
        filters = {
                dotfiles = true,
                custom = { 'node_modules' },
        },

        view = {
                width = 34,
                side = 'left',
                -- hide root file
                hide_root_folder = false,
                -- use custom key only
                mappings = {
                        custom_only = true,
                        list = list_keys,
                },
                -- no number
                number = false,
                relativenumber = false,
                -- show icons
                signcolumn = 'yse',
        },
        actions = {
                open_file = {
                        resize_window = true,
                        -- close window on open file
                        quit_on_open = true,
                },
        },
})

-- auto close
vim.cmd([[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'Nvim-tree_' . tabpagenr() | quit | endif
]])
