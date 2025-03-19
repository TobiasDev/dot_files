-- Needs to called after the main settings

require('lspconfig').gdscript.setup{}
require('lspconfig').gdshader_lsp.setup{}
require("telescope").load_extension "dap"
