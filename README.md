# nvim-config

自分用のNeovim設定ファイル。

## インストール

```bash
git clone https://github.com/kp63/nvim-config ~/.config/nvim
```

Neovimを起動すると、プラグインが自動インストールされます。

## プラグイン

* [lazy.nvim](https://github.com/folke/lazy.nvim): プラグインマネージャー
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): コード補完
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): LSP設定
* [mason.nvim](https://github.com/mason-org/mason.nvim): 外部ツール管理（LSP/Formatter/Linterなど）
* [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim): ファイルエクスプローラー
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): 検索（ファイル検索・テキスト検索など）
* [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Git統合（差分表示など）
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): シンタックスハイライト
* [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): ステータスライン

* [onedark.nvim](https://github.com/navarasu/onedark.nvim): カラースキーマ

## 主要なキーマップ

* リーダーキー: `<Space>`
* `<C-h/j/k/l>`: ウィンドウ移動
* `<S-h/l>`: バッファ移動
* `<leader>w`: 保存
* `<leader>e`: ファイルエクスプローラー（表示切替）
* `<leader>ff`: ファイル検索
* `<leader>fg`: テキスト検索
* `gd`: 定義へジャンプ
* `K`: LSPホバー
* `<leader>ca`: コードアクション
