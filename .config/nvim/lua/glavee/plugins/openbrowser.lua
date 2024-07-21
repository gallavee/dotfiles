local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local themes = require('telescope.themes')
local actions = require("telescope.actions")
local action_state = require "telescope.actions.state"

local searchDialog = function(engine)
  local engine1 = engine or vim.g.openbrowser_default_search
  local query = vim.fn.input("Search for: ")
  vim.cmd("OpenBrowserSmartSearch -"..engine1..' '..query)
end

vim.keymap.set("n", "<leader>sw", searchDialog, {desc = "find on web"})
vim.g.openbrowser_search_engines={
  bing=  'https://www.bing.com/search?q={query}',
  wikipedia='https://en.wikipedia.org/w/index.php?search={query}',
}
vim.g.openbrowser_default_search = 'bing'

local supported_engines= {
"askubuntu",
"devdocs",
"baidu",
"twitter-user",
"duckduckgo",
"google",
"wikipedia",
"yahoo",
"fileformat",
"alc",
"github",
"twitter-search",
"go",
"wikipedia-ja",
"cpan",
"php",
"python",
"vim",
"bing"
}


local attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        -- print(vim.inspect(selection))
        -- vim.api.nvim_put({ selection[1] }, "", false, true)
        searchDialog(selection[1])
      end)
      return true
    end

local default_opts={
  finder=finders.new_table(supported_engines),
  sorter =sorters.get_generic_fuzzy_sorter({}),
  attach_mappings = attach_mappings,
  prompt_title = "Search for supported search engine: ",
}
local search_engines = function(opts)
  opts = opts or {}
  pickers.new(opts, default_opts):find()
end

vim.keymap.set("n","<leader>se",search_engines,{desc = "find on web (non-default search engine"})

