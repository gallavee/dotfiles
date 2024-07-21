-- require("luasnip.loaders.from_vscode").lazy_load()
print("luasnip.lua")

local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.setup({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "⬅ ", "Error" } },
      },
    },
  },
  enable_autosnippets = true,
})

require("snippets.snippets")
