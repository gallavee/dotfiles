local comment_code_string=function(code_string)
  local comment_char = '#'
  local comment_string=comment_char..code_string:gsub("\n","\n"..comment_char)
  return comment_string
end

local grab_output = function()
    vim.api.nvim_exec2([[
    MagmaShowOutput
    noautocmd MagmaEnterOutput
    call feedkeys('VGy')
    ]]
    ,{})
    vim.schedule_wrap(
                        function()
                          vim.cmd('close') 
                          local output_string = vim.fn.getreg('"')
                          local comment_string = comment_code_string(output_string)
                          vim.fn.setreg('*',comment_string)
                          vim.keymap.set('n','p','<cmd>put<cr>',{buffer=true,silent=true})
                        end
                        )()
  end
vim.g.magma_automatically_open_output = false
vim.keymap.set('n', '<leader>rr', ':MagmaEvaluateLine<CR>', { silent = true, desc = 'evaluate line under cursor in connected kernel' })
vim.keymap.set('n', '<leader>rc', ':MagmaReevaluateCell<CR>', { silent = true, desc = 'evaluate cell under cursor in connected kernel' })
vim.keymap.set('n', '<leader>rs', ':MagmaRestart<CR>', { silent = true , desc='restart connected kernel'})
vim.keymap.set('v','<leader>rr', ':<C-u>MagmaEvaluateVisual<CR>', { silent = true, desc = 'evaluate visual selection in connected kernel' })
vim.keymap.set('n','<leader>ro', ':MagmaShowOutput<CR>', { silent = true , desc='show output window'})
vim.keymap.set('n','<leader>rg', ':noautocmd MagmaEnterOutput<CR>', { silent = true, desc='endter output window'})
vim.keymap.set('n','<leader>rh', grab_output, { silent = true, desc='put output on clipboard as comment' })

