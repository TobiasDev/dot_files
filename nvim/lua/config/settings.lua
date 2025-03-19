local g 		= vim.g
local o 		= vim.opt

o.background 	= 'dark'
o.guifont 		= 'Fira Code:h12'

o.tabstop 		= 4
o.softtabstop	= 0
o.shiftwidth 	= 0

o.number		= true
o.cursorline	= true
o.linebreak 	= true

-- HACK: Had no simple way of fixing and I am instead using leader shortcuts for this
o.clipboard 	= unnamedplus
o.signcolumn 	= 'yes'

-- Plugin Specific Ones
-- ### GODOT
g.godot_executable = 'D:/GameEngines/Godot/Godot_v4.4-stable_win64_console.exe'

-- ### LSP
-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- BUG:
-- DEPRECATED:
-- DELETE:
-- FIX:
-- HACK:
-- IMPORTANT:
-- IMPROVE:
-- NOTE:
-- PERFORMANCE:
-- REFACTOR:
-- TEMP:
-- TODO:
-- DONE:
-- WARNING:
-- QUESTION:
