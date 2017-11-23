-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Bill Kabongo
-- Date: November 22nd, 2017
-- Description: This calls the splash screen of the app to load itself.
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
-- HIDE THE STATUS BAR
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "splash_screen" )
