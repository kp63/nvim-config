return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = vim.keymap.set

        map("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "次のhunk" })
        map("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "前のhunk" })
        map("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Hunkプレビュー" })
        map("n", "<leader>gb", gs.blame_line, { buffer = bufnr, desc = "Blame" })
      end,
    })
  end,
}

