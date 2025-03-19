return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },  
	opts = {
  		signs = true, -- show icons in the signs column
  		sign_priority = 8, -- sign priority
	  -- keywords recognized as todo comments
	  	keywords = {
			BUG = { icon = " ", color = "#FF5555" },        -- Bright Red (Critical)
			DEPRECATED = { icon = " ", color = "#FFB86C" }, -- Orange (Deprecated/Removed)
			DELETE = { icon = " ", color = "#FFB86C", alt = {"REMOVE"} }, -- Orange (Similar to DEPRECATED)
			FIX = { icon = " ", color = "#50FA7B" },        -- Green (Fixed/Patched)
			HACK = { icon = " ", color = "#F1FA8C" },       -- Yellow (Hacky Solutions)
			IMPORTANT = { icon = " ", color = "#FF79C6" },  -- Pink (Attention)
			IMPROVE = { icon = " ", color = "#8BE9FD" },    -- Cyan (Enhancements)
			NOTE = { icon = " ", color = "#BD93F9" },       -- Purple (General Notes)
			PERFORMANCE = { icon = " ", color = "#6272A4" }, -- Soft Purple (Optimizations)
			REFACTOR = { icon = " ", color = "#8BE9FD" },   -- Cyan (Code Restructuring)
			TEMP = { icon = " ", color = "#F1FA8C", alt = {"TEST"} }, -- Yellow (Temporary/Testing)
			TODO = { icon = " ", color = "#FF79C6" },       -- Pink (Tasks to Complete)
			DONE = { icon = " ", color = "#50FA7B" },       -- Green (Completed)
			WARNING = { icon = " ", color = "#FF5555" },    -- Bright Red (Warnings)
			QUESTION = { icon = " ", color = "#FF79C6" }    -- Pink (Doubts/Uncertainties)
	  	},
	  	gui_style = {
			fg = "NONE", -- The gui style to use for the fg highlight group.
			bg = "BOLD", -- The gui style to use for the bg highlight group.
	  	},
	  	merge_keywords = false,
	}
}

