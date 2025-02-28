-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

-- configure telescope
telescope.setup({
  -- configure custom mappings
  -- defaults = {
  --      layout_config = {
  --     horizontal = {
  --       preview_cutoff = 0,
  --     },
  --   },mappings = {
  --     i = {
  --       ["<C-k>"] = actions.move_selection_previous, -- move to prev result
  --       ["<C-j>"] = actions.move_selection_next, -- move to next result
  --       ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
  --     },
  --   },
  -- },
  -- configure extensions
  -- extensions = {
  -- arecibo = {
  --   ["selected_engine"]   = 'google',
  --   ["url_open_command"]  = 'xdg-open',
  --   ["show_http_headers"] = false,
  --   ["show_domain_icons"] = false,
  -- },
-- }
})



telescope.load_extension("fzf")
-- telescope.load_extension("arecibo")
