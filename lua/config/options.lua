-- 基本オプション
local opt = vim.opt

-- 行番号
opt.number = true

-- インデント
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- 検索
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- 表示
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- タブ文字とスペースの可視化
opt.list = true
opt.listchars = {
  tab = "→ ",
  trail = "·",
  lead = "·",
  leadmultispace = "│ ",
  extends = "⟩",
  precedes = "⟨",
  nbsp = "␣",
}

-- 分割
opt.splitright = true
opt.splitbelow = true

-- その他
opt.wrap = false
opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.showmode = false

