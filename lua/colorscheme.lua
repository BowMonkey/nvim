local defaultscheme="desert"
local colorscheme="onedark"
local status_ok,_ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
        vim.notify("colorscheme " .. colorscheme .. " do not exist!")
        pcall(vim.cmd, "colorscheme " .. defaultscheme)
        return
end
