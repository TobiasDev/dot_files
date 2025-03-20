-- Telescope plugin

require("telescope").setup({
    defaults = {
        file_ignore_patterns = { 
			".*.uid", 
			".*.png", 
			".*.jpg", 
			".*.jpeg", 
			".*.tscn", 
			".*.mp3", 
			".*.wav", 
			".*.res", 
			".*.theme", 
			".*.translation", 
			".*.ttf", 
			".*.stylebox", 
			".*.svg", 
			".*.ico", 
			".*.import", 
			".*.godot", 
		},
    }
})
