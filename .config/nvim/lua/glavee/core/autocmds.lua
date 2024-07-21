vim.api.nvim_create_augroup("recording", {})
vim.api.nvim_create_autocmd({"RecordingLeave"}, {
	group = "recording",
	callback = function()
    print('Macro recording ended @'..vim.fn.reg_recording())
    vim.keymap.set("n","<leader>m","@"..vim.fn.reg_recording(),{noremap = true,desc="Play last macro"})

  end
})
vim.api.nvim_create_autocmd("RecordingEnter", {
	group = "recording",
	callback = function() print('Recording Macro @'..vim.fn.reg_recording()..'...')
  end
})
