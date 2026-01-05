return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("onedark").setup({
      style = "dark", -- dark, darker, cool, deep, warm, warmer
      transparent = false,
      term_colors = true,
      code_style = {
        comments = "italic",
        keywords = "bold",
        functions = "none",
        strings = "none",
        variables = "none",
      },
    })
    require("onedark").load()
  end,
}

