-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Bill Kabongo
-- Date: November 22nd 2017
-- Description: This is the splash screen of the game. It displays the 
-- company logo that rotates while having 2 flies fly across the screen.
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local companyLogo
local companyLogoScrollSpeed = 6
local timeWarpSound = audio.loadSound("Sounds/TimeWarp.mp3")
local timeWarpSoundsChannel
local firstFly
local secondFly
local firstFlyScrollSpeed = 13
local secondFlyScrollSpeed = -13
--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that moves the companyLogo across the screen
local function movecompanyLogo()

companyLogo.rotation = companyLogo.rotation + companyLogoScrollSpeed
companyLogo.width = companyLogo.width + companyLogoScrollSpeed
companyLogo.height = companyLogo.height + companyLogoScrollSpeed
companyLogo.alpha = companyLogo.alpha - 0.01
firstFly.x = firstFly.x + firstFlyScrollSpeed
secondFly.x = secondFly.x + secondFlyScrollSpeed

end

-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu", {effect = "slideDown", time = 600})

end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 0, 0, 0)

    -- Insert the companyLogo image and fly images
    companyLogo = display.newImageRect("Images/CompanyLogo.png", 200, 200)
    secondFly = display.newImageRect ("Images/SecondFly.png", 200, 115)
    firstFly = display.newImageRect ("Images/Fly.png", 300, 150)
    companyLogo.alpha = 1

    -- set the initial x and y position of the companyLogo and the fly images
    companyLogo.x = display.contentWidth/2
    companyLogo.y = display.contentHeight/2
    firstFly.x = 0 
    firstFly.y = 700
    secondFly.x = 1000
    secondFly.y = 100

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( companyLogo )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- start the splash screen music
        timeWarpSoundsChannel = audio.play(timeWarpSound)

        -- Call the movecompanyLogo function as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", movecompanyLogo)

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 3000, gotoMainMenu)          
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the jungle sounds channel for this screen
        audio.stop(timeWarpSoundsChannel)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
