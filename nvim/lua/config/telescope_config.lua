require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            "%.uid$",      -- Match any file with .uid extension
            "%.png$",      -- Match any file with .png extension
            "%.jpg$",      -- Match any file with .jpg extension
            "%.jpeg$",     -- Match any file with .jpeg extension
            "%.tscn$",     -- Match any file with .tscn extension
            "%.mp3$",      -- Match any file with .mp3 extension
            "%.wav$",      -- Match any file with .wav extension
            "%.theme$",    -- Match any file with .theme extension
            "%.translation$", -- Match any file with .translation extension
            "%.ttf$",      -- Match any file with .ttf extension
            "%.stylebox$", -- Match any file with .stylebox extension
            "%.svg$",      -- Match any file with .svg extension
            "%.import$",   -- Match any file with .import extension
            "%.ico$",   -- Match any file with .import extension
            "%.godot$",    -- Match any file with .godot extension
        },
    }
})
