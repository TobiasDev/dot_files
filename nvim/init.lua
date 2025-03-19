---------------------------------------------------
-- Maintainer: Tobias Doerrich (can not use the proper letters here)
-- Repo: Will not have one just yet
-- Version: 0.1
--
-- Changelog in short: 
-- I have not used NeoVim for a few years or so, since I switched to larger game engines such as Unreal Engine, where NeoVim sadly lacks a bit of support. However, as I am noticing that I am missing a good IDE again, RIDER is amazing for Unreal, but I want something faster, I am considering going back to NeoVim which requires me to do this setup again.
---------------------------------------------------


-- Load and install Lazy, unless already installed, then just load
require("config.lazy")

-- Load my personal settings
require("config.plugin_config")
require("config.settings")

-- Load the keybindings after Lazy to allow me to set plugin mappings as well
require("config.mappings")

