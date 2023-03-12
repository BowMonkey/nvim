local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
        vim.nofity("bufferline not found!")
        return
end

-- shotcuts

bufferline.setup({
        options = {
                -- close tab, we use moll/vim-bbye :Bdelete command
                close_command = "Bdelete! %d",
                right_mouse_command = "Bdelete! %d",

                -- sidebar config
                -- leave space for nvim-tree
                offsets = {
                        {
                                filetype = "NvimTree",
                                text = "File Explorer",
                                highlight = "Directory",
                                text_align = "left",
                        },
                },
                -- use nvim built-in LSP
                diagnostics="nvim_lsp",
                -- optional setting: show LSP error icon
        --
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end,
    },
})
