vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness


--general keymaps
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Turn off highlighting"})
keymap.set("n", "x", '"_x', {desc="Delete character under cursor"})
keymap.set("n", "<leader>+", "<C-a>" , { desc  = "Increment Number"})
keymap.set("n", "<leader>-", "<C-x>", {desc = "Decrement Number"})

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" }) -- toggle file explorer

-- telescope
keymap.set("n", "<leader>sn", "<cmd>Telescope find_files<cr>", {desc='find files by name'})                                                                                 -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", {desc = 'find in files (grep)'})                                                                                  -- find string in current working directory as you type
keymap.set("n", "<leader>sc", "<cmd>Telescope grep_string<cr>",{desc='find string under cursor'})                                                                                -- find string under cursor in current working directory
keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>",{desc='find buffers by name'})                                                                                    -- list open buffers in current neovim instance
keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>",{desc='find in help'})                                                                                  -- list available help tags
keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>",{desc='find in keymaps'})                                                                                  -- list available help tags
keymap.set("n", "<leader>s:", "<cmd>Telescope command_history<cr>",{desc='find in command history'})                                                                            -- list command history
keymap.set("n", "<leader>sy",
  "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy({}))<cr>",
{desc='find in current buffer'}
  )                              -- search in current buffer


-- flash keymaps
keymap.set({"n", "o", "x"}, "s", function() require("flash").jump() end, {desc="flash"})
keymap.set({"n", "o", "x"}, "S", function() require("flash").treesitter() end, {desc="flash treesitter"})
keymap.set({"o"}, "r", function() require("flash").remote() end, {desc="flash remote"})
keymap.set({"o", "x"}, "R", function() require("flash").treesitter_search() end, {desc="flash treesitter search"})
keymap.set({"c"}, "<c-s>", function() require("flash").toggle() end, {desc="toggle flash search"})
