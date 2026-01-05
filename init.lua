-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader key (lazy.nvimの前に設定)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 基本設定を読み込み
require("config.options")
require("config.keymaps")

-- プラグインを読み込み
require("lazy").setup("plugins", {
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
})

