-- キーマップ
local map = vim.keymap.set

-- ウィンドウ移動
map("n", "<C-h>", "<C-w>h", { desc = "左のウィンドウへ" })
map("n", "<C-j>", "<C-w>j", { desc = "下のウィンドウへ" })
map("n", "<C-k>", "<C-w>k", { desc = "上のウィンドウへ" })
map("n", "<C-l>", "<C-w>l", { desc = "右のウィンドウへ" })

-- バッファ移動
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "前のバッファ" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "次のバッファ" })

-- 検索ハイライト解除
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "ハイライト解除" })

-- より良いインデント
map("v", "<", "<gv", { desc = "インデント減" })
map("v", ">", ">gv", { desc = "インデント増" })

-- 行移動
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "行を下へ移動" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "行を上へ移動" })

-- ファイル保存
map("n", "<leader>w", "<cmd>w<cr>", { desc = "保存" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "終了" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "ファイル検索" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "テキスト検索" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "バッファ一覧" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "ヘルプ検索" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "最近のファイル" })

