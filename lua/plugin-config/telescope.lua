local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
        vim.nofity("telescope not found!")
        return
end

-- shotcuts

telescope.setup({
        defaults = {
                -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
                initial_mode = "insert",
                -- vertical , center , cursor
                layout_strategy = "horizontal",
                -- 窗口内快捷键
                mappings = require("keymaps").telescopeList,
        },
        pickers = {
                find_files = {
                        theme = "dropdown", -- 可选参数： dropdown, cursor, ivy
                },
        },
        extensions = {
                ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                                -- even more opts
                        }),
                },
        },
})

pcall(telescope.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, "ui-select")
