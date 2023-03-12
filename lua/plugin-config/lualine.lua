local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    vim.nofity("lualine not found!")
    return
end

-- shotcuts

lualine.setup({
    options = {
        -- theme = auto,
        theme = "tokyonight",
        component_separators = {left = "|", right = "|"},
        section_separators = { left = " ", right = "", },
        globalstatus = true,
    },
    extensions = {"nvim-tree", "toggleterm"},
    sections = {
        lualine_c = {
            "filename",
            {
                "lsp_progress",
                spinner_symbols = { " ", " ", " ", " ", " ", " " },
            },
        },
        lualine_x = {
            "filesize",
            {
                "fileformat",
                symbols = {
                    unix = '', -- e712
                    dos = '', -- e70f
                    mac = '', -- e711
                },
                --symbols = {
                --        unix = "LF",
                --        dos = "CRLF",
                --        mac = "CR",
                --},
            },
            "encodling",
            "filetype",
        },
    },
})
