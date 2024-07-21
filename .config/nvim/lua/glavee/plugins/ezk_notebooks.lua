local ezk_notebooks= require(   "ezk_notebook")
ezk_notebooks.setup()

vim.keymap.set('n', '<leader>rt', ':OpenConnectedNotebookInBrowser<CR>', { silent = true, desc = 'open connected jupyter notebook in browser' })
vim.keymap.set('n', '<leader>ry', ':RestartConnectedKernel<CR>', { silent = true, desc = 'restart connected jupyter notebook kernel' })
vim.keymap.set('n', '<leader>ri', ':InterruptConnectedKernel<CR>', { silent = true, desc = 'interrupt connected jupyter notebook kernel' })
-- vim.keymap.set('n', '<leader>rr', ':MagmaEvaluateLine<CR>', { silent = true, desc = 'evaluate line in connected jupyter notebook' })
-- vim.keymap.set('n', '<leader>ro', ':MagmaShowOutput<CR>', { silent = true, desc = 'show cell output corresponding to line' })
-- vim.keymap.set('x', '<leader>rr',  ':<C-u>MagmaEvaluateVisual<CR>', { silent = true, desc = 'evaluate visual selection in connected jupyter notebook' })
-- vim.keymap.set('n', '<leader>rg', ':noautocmd MagmaEnterOutput', { silent = true, desc = 'enter output window' })
--

