local vim = vim
local present, toggle_term = pcall(require, "toggleterm")
if not present then
    return
end

toggle_term.setup {
  size = 10,
  open_mapping = [[<c-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = false,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = "float",
  close_on_exit = true, -- close the terminal window when the process exits
  float_opts = {
    border = "curved",
    -- width = 120,
    -- height = 40,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
vim.keymap.set("n", "<leader>es", ":TermExec cmd='ezk sync'<CR>")
vim.keymap.set("n", "<leader>ed", ":TermExec cmd='devenv'<CR>")
