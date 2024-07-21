local tdc= require(   "todo-comments")
tdc.setup({
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  },
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "wide" or "normal" or empty
    after = "fg", -- "fg", "bg", "wide" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
    comments_only = false, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- search = {
  --   command = "rg",
  --   args = {
  --     "--color=never",
  --     "--no-heading",
  --     "--with-filename",
  --     "--line-number",
  --     "--column",
  --   },
  --   -- regex that will be used to match keywords.
  --   -- don't replace the (KEYWORDS) placeholder
  --   pattern = [[\b(KEYWORDS):]], -- ripgrep regex
  --   -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  -- },
})

local todone = function()
  local line = vim.api.nvim_get_current_line()
  local replace_w_date ='TODO(DONE '..os.date("%Y-%m-%d-%M")..')'
  local sub=string.gsub(line,'TODO',replace_w_date)
  vim.api.nvim_set_current_line(sub)
end
vim.keymap.set("n", "<leader>tt", todone, { desc = "Mark todo comment as done" })
