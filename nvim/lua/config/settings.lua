local g = vim.g
local o = vim.opt

o.background = "dark"
o.guifont = "Fira Code:h12"
o.tabstop = 4
o.softtabstop = 0
o.shiftwidth = 0
o.number = true
o.cursorline = true
o.linebreak = true
o.signcolumn = "yes"

g.godot_executable = "D:/GameEngines/Godot/Godot_v4.4-stable_win64_console.exe"

vim.cmd("colorscheme dracula")
