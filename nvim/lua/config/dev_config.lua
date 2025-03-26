local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-b>"] 		= cmp.mapping.scroll_docs(-4),
    ["<C-f>"] 		= cmp.mapping.scroll_docs(4),
    ["<C-Space>"] 	= cmp.mapping.complete(),
    ["<C-e>"] 		= cmp.mapping.abort(),
    ["<Tab>"] 		= cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name 	= "nvim_lsp" }, 
    { name 	= "luasnip" },
  }, {
    { name 	= "buffer" },
    { name 	= "path" },
  }),
})

require("todo-comments").setup{
  keywords = {
    CURRENTLY_WORKING_ON    = { icon = " ", color = "#C770F0" },
    BUG             		= { icon = " ", color = "#FF6E6E" },
    HACK            		= { icon = " ", color = "#FF3B66" },
    NOTE            		= { icon = " ", color = "#FF9E64" },
    NOT_FINISHED    		= { icon = " ", color = "#5BE4F0" },
    PERFORMANCE     		= { icon = " ", color = "#4ADEDE" },
    TEMP            		= { icon = "⏲ ", color = "#7D82FF" },
    TODO            		= { icon = " ", color = "#C770F0" },
    WARNING         		= { icon = " ", color = "#E6E95B" }
  },
  highlight = {
    pattern = [[.*#\s*<(KEYWORDS)>]], -- Force detection for GDScript
  },
}

require("lspconfig").gdscript.setup{}
require("lspconfig").gdshader_lsp.setup{}
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets/" })

local nio = require("nio")

local dap = require('dap')
dap.adapters.godot = {
  type = "server",
  host = '127.0.0.1',
  port = 6006,
}

-- Debug configurations for Godot
dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    project = "${workspaceFolder}",
    launch_scene = true,
  }
}

-- Add to dev_config.lua
local dapui = require("dapui")
dapui.setup()

-- Connect DAP UI to DAP events
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Virtual text for debugging
require("nvim-dap-virtual-text").setup()

-- Additional keybinding for UI
vim.keymap.set('n', '<leader>du', function() dapui.toggle() end)

-- BUG:
-- HACK:
-- NOTE:
-- NOT_FINISHED:
-- PERFORMANCE:
-- TEMP:
-- TODO:
-- WARNING:


