-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
        vim.notify("正在安装Pakcer.nvim，请稍后...")
        paccker_bootstrap = fn.system({
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
        })

        -- https://github.com/wbthomason/packer.nvim/issues/750
        local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
        if not string.find(vim.o.runtimepath, rtp_addition) then
                vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
        end
        vim.notify("Pakcer.nvim 安装完毕")
end
local packer = require("packer")
packer.startup({
        function(use)
                -- Packer can manage itself
                use ("wbthomason/packer.nvim")

                -- color schemes
                use ("shaunsingh/nord.nvim")
                use ("ful1e5/onedark.nvim")
                use ("NLKNguyen/papercolor-theme")
                use ("folke/tokyonight.nvim")

                -- file explorer
                use({
                        "nvim-tree/nvim-tree.lua",
                        requires={
                                'nvim-tree/nvim-web-devicons',
                        },
                        tag='nightly'
                })

                -- bufferline
                use({
                        "akinsho/bufferline.nvim",
                        requires = {
                                "nvim-tree/nvim-web-devicons",
                                "moll/vim-bbye"
                        }
                })

                -- lualine
                use({
                        "nvim-lualine/lualine.nvim",
                        requires = "nvim-tree/nvim-web-devicons"
                })
                use ("arkav/lualine-lsp-progress")

                -- telescope
                use({
                        "nvim-telescope/telescope.nvim",
                        requires = { "nvim-lua/plenary.nvim" },
                })

                -- telescope extensions
                use("LinArcX/telescope-env.nvim")
                use("nvim-telescope/telescope-ui-select.nvim")

                -- leap
                use({
                        "ggandor/leap.nvim",
                        config = function()
                                require('leap').add_default_mappings()
                                require('leap').opts.highlight_unlabeled_phase_one_targets = true
                        end
                })
        end,
        config = {
                max_jobs=16,
                -- custom source
                git = {
                        --default_url_format = "https://hub.fastgit.xyz/%s"
                },
                display = {
                        open_fn=function()
                                return require("packer.util").float({border="single"})
                        end,
                },
        },
})

-- auto install plugin after save this file
pcall(
vim.cmd,
[[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]
)
