--======================================================================
--
-- keymaps.lua - 按键设置
--
--   - 快速移动
--   - 标签切换
--   - 窗口切换
--   - 终端支持
--
-----------------------------------------------------------------------
--vim.api.nvim_set_keymap() 全局快捷键
--vim.api.nvim_buf_set_keymap() Buffer 快捷键
-----------------------------------------------------------------------
--vim.api.nvim_set_keymap('模式', '按键', '映射为', 'options')
  -- n Normal 模式
  -- i Insert 模式
  -- v Visual 模式
  -- t Terminal 模式
  -- c Command 模式
--======================================================================

------------------------------------------------------------------------
-- set local variable
------------------------------------------------------------------------
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }


------------------------------------------------------------------------
-- set leader key as space
------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

------------------------------------------------------------------------
-- insert 模式下使用 emacs 键位
------------------------------------------------------------------------
-- go to line begin
map("i" , "<C-a>" , "<home>" , opt)
-- go to line end
map("i" , "<C-e>" , "<end>"  , opt)
-- delete character forward
map("i" , "<C-d>" , "<del>"  , opt)
-- delete line to end
map("i" , "<C-k>" , "<C-k>"  , opt)

------------------------------------------------------------------------
--- 命令模式的快速移动
------------------------------------------------------------------------
map("c" , "<C-h>" , "<left>" , opt)
map("c" , "<C-j>" , "<down>" , opt)
map("c" , "<C-k>" , "<up>" , opt)
map("c" , "<C-l>" , "<right>" , opt)
map("c" , "<C-a>" , "<home>" , opt)
map("c" , "<C-e>" , "<end>" , opt)

------------------------------------------------------------------------
-- ALT+N 切换 tab
------------------------------------------------------------------------
map("n" , "<M-1>" , "<ESC>:tabn 1<CR>" , opt)
map("n" , "<M-2>" , "<ESC>:tabn 2<CR>" , opt)
map("n" , "<M-3>" , "<ESC>:tabn 3<CR>" , opt)
map("n" , "<M-4>" , "<ESC>:tabn 4<CR>" , opt)
map("n" , "<M-5>" , "<ESC>:tabn 5<CR>" , opt)
map("n" , "<M-6>" , "<ESC>:tabn 6<CR>" , opt)
map("n" , "<M-7>" , "<ESC>:tabn 7<CR>" , opt)
map("n" , "<M-8>" , "<ESC>:tabn 8<CR>" , opt)
map("n" , "<M-9>" , "<ESC>:tabn 9<CR>" , opt)
map("n" , "<M-0>" , "<ESC>:tabn 10<CR>" , opt)
--
map("i" , "<M-1>" , "<ESC>:tabn 1<CR>" , opt)
map("i" , "<M-2>" , "<ESC>:tabn 2<CR>" , opt)
map("i" , "<M-3>" , "<ESC>:tabn 3<CR>" , opt)
map("i" , "<M-4>" , "<ESC>:tabn 4<CR>" , opt)
map("i" , "<M-5>" , "<ESC>:tabn 5<CR>" , opt)
map("i" , "<M-6>" , "<ESC>:tabn 6<CR>" , opt)
map("i" , "<M-7>" , "<ESC>:tabn 7<CR>" , opt)
map("i" , "<M-8>" , "<ESC>:tabn 8<CR>" , opt)
map("i" , "<M-9>" , "<ESC>:tabn 9<CR>" , opt)
map("i" , "<M-0>" , "<ESC>:tabn 10<CR>" , opt)

------------------------------------------------------------------------
-- TAB：创建，关闭，左移，右移
------------------------------------------------------------------------
-- map("n" , "<leader>tc", ":tabnew<CR>"   , opt)
-- map("n" , "<leader>tq", ":tabclose<CR>" , opt)
-- map("n" , "<leader>to", ":tabonly<CR>"  , opt)


-- FIXME how to change VIML function to lua function?
-- 左移 tab
-- function! Tab_MoveLeft()
-- 	let l:tabnr = tabpagenr() - 2
-- 	if l:tabnr >= 0
-- 		exec 'tabmove '.l:tabnr
-- 	endif
-- endfunc
-- 
-- -- 右移 tab
-- function! Tab_MoveRight()
-- 	let l:tabnr = tabpagenr() + 1
-- 	if l:tabnr "<= tabpagenr('$')
-- 		exec 'tabmove '.l:tabnr
-- 	endif
-- endfunc

-- noremap "<silent><leader>tl :call Tab_MoveLeft()<CR>
-- noremap "<silent><leader>tr :call Tab_MoveRight()<CR>
-- noremap "<silent><M-left> :call Tab_MoveLeft()<CR>
-- noremap "<silent><M-right> :call Tab_MoveRight()<CR>

------------------------------------------------------------------------
-- 窗口切换：ALT+SHIFT+hjkl
-- 传统的 CTRL+hjkl 移动窗口不适用于 vim 的终端模式，CTRL+hjkl 在
-- bash/zsh 及带文本界面的程序中都是重要键位需要保留，不能 noremap 的
------------------------------------------------------------------------
map("n" , "<M-H>" , "<C-w>h"     , opt)
map("n" , "<M-L>" , "<C-w>l"     , opt)
map("n" , "<M-J>" , "<C-w>j"     , opt)
map("n" , "<M-K>" , "<C-w>k"     , opt)
map("i" , "<M-H>" , "<esc><C-w>h", opt)
map("i" , "<M-L>" , "<esc><C-w>l", opt)
map("i" , "<M-J>" , "<esc><C-w>j", opt)
map("i" , "<M-K>" , "<esc><C-w>k", opt)

-- neovim 没有 termwinkey 支持，必须把 terminal 切换回 normal 模式
map("t" , "<M-H>" , "<C-\\><C-n><C-w>h", opt)
map("t" , "<M-L>" , "<C-\\><C-n><C-w>l", opt)
map("t" , "<M-J>" , "<C-\\><C-n><C-w>j", opt)
map("t" , "<M-K>" , "<C-\\><C-n><C-w>k", opt)
map("t" , "<M-q>" , "<C-\\><C-n>"      , opt)

-- windows 分屏
-- vertical
map("n", "<M-V>", ":vsp<CR>", opt)
-- horizon FIXME find a better shotcut
map("n", "<M-S>", ":sp<CR>", opt)

-- 关闭当前window
map("n", "<M-C>", "<C-w>c", opt)
-- 关闭其他window
map("n", "<M-O>", "<C-w>o", opt)

-- 左右比例控制
map("n", "<M-Left>", ":vertical resize -2<CR>", opt)
map("n", "<M-Right>", ":vertical resize +2<CR>", opt)
-- 上下比例
map("n", "<M-Down>", ":resize +2<CR>", opt)
map("n", "<M-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "<M-=>", "<C-w>=", opt)

------------------------------------------------------------------------
--  plugins shotcut
------------------------------------------------------------------------


local pluginKeys = {}

-- Telescope ---------------------------------------------------------
-- find files
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- global grep
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    -- 历史记录
    ["<Down>"] = "cycle_history_next",
    ["<Up>"] = "cycle_history_prev",
    -- 关闭窗口
    -- ["<esc>"] = actions.close,
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- Lsp ---------------------------------------------------------
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{async=true}<CR>", opt)
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end


-- buffer-line-----------------------------------------------------------
-- change between left-right tab
map("n" , "<leader>h", ":BufferLineCyclePrev<CR>"   , opt)
map("n" , "<leader>l", ":BufferLineCycleNext<CR>"   , opt)

-- close
-- "moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
-- pick close
map("n" , "<leader>bd", ":BufferLinePickClose<CR>"   , opt)
-- pick close right
map("n" , "<leader>bL", ":BufferLineCloseRight<CR>"   , opt)
-- pick close left
map("n" , "<leader>bH", ":BufferLineCloseLeft<CR>"   , opt)

-- pick
map("n" , "<leader>bg", ":BufferLinePick<CR>"   , opt)


-- toggleterm -----------------------------------------------------------
-- custom three different cmd window
-- <leader>ta float
-- <leader>tb right
-- <leader>tc under
-- lazygit window
-- <leader>tg lazygit
pluginKeys.mapToggleTerm = function(toggleterm)
        vim.keymap.set({"n","t"}, "<leader>ta", toggleterm.toggleA)
        vim.keymap.set({"n","t"}, "<leader>tb", toggleterm.toggleB)
        vim.keymap.set({"n","t"}, "<leader>tc", toggleterm.toggleC)
        vim.keymap.set({"n","t"}, "<leader>tg", toggleterm.toggleG)
end



-- nvim-tree -----------------------------------------------------------

-- <leader> + t Toggle vim-tree
map("n" , "<leader>t", ":NvimTreeToggle<CR>"   , opt)
-- list shotcut
pluginKeys.nvimTreeList = {
        -- open file or folder
        {key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit"},
        -- open file in splite window
        {key = "v", action = "vsplit"},
        {key = "h", action = "split"},
        -- show dot file
        {key = "i", action = "toggle_custom"},
        {key = ".", action = "toggle_dotfiles"},
        -- file operator
        {key = "R", action = "refresh"},
        {key = "a", action = "create"},
        {key = "d", action = "remove"},
        {key = "r", action = "rename"},
        {key = "x", action = "cut"},
        {key = "y", action = "copy"},
        {key = "p", action = "past"},
        {key = "t", action = "tabnew"},
        -- jump in
        {key = "]", action = "cd"},
        -- jump out
        {key = "[", action = "dir_up"},
        -- close
        {key = "q", action = "close"},
}
return pluginKeys

