local status, _ = pcall (vim.cmd, "colorscheme tokyonight-moon")
if not status then
  print("color scheme not found")
  return
end

