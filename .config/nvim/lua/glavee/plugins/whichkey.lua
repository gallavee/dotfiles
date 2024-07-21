local wk=require("which-key")
local defaults = {
        mode = { "n", "v" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>n"] = { name = "+turnoff stuff" },
      }

local function config()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    wk.setup ({
                plugins = { spelling = true },
                defaults = defaults,
              }
              )
    wk.register(defaults)
  end

  config()

 -- opts = {
 --      plugins = { spelling = true },
 --      defaults = {
 --        mode = { "n", "v" },
 --        ["g"] = { name = "+goto" },
 --        ["gz"] = { name = "+surround" },
 --        ["]"] = { name = "+next" },
 --        ["["] = { name = "+prev" },
 --        ["<leader><tab>"] = { name = "+tabs" },
 --        ["<leader>b"] = { name = "+buffer" },
 --        ["<leader>c"] = { name = "+code" },
 --        ["<leader>f"] = { name = "+file/find" },
 --        ["<leader>g"] = { name = "+git" },
 --        ["<leader>gh"] = { name = "+hunks" },
 --        ["<leader>q"] = { name = "+quit/session" },
 --        ["<leader>s"] = { name = "+search" },
 --        ["<leader>u"] = { name = "+ui" },
 --        ["<leader>w"] = { name = "+windows" },
 --        ["<leader>x"] = { name = "+diagnostics/quickfix" },
 --      },
 --    },
 --    config = function(_, opts)
 --      local wk = require("which-key")
 --      wk.setup(opts)
 --      wk.register(opts.defaults)
 --    end,
 --  },
