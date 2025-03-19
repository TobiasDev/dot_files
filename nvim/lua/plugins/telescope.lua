-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },

	require('telescope').setup(
	{
		 defaults = 
		 {
			 file_ignore_patterns = {
				 "%.png",
				 "%.tres",
				 "%.ttf",
				 "%.otf",
				 "%.wav",
				 "%.mp3",
				 "%.svg",
				 "%.tscn",
				 "%.godot",
				 "%.material",
				 "%.glb",
				 "%.import",
				 "%.localization",
				 "%.stylebox",
				 "%.uid",
				 "%.theme"
			 }
		 }	
	}
	)
}
