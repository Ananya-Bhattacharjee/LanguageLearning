
local composer = require( "composer" )

local scene = composer.newScene()


local function gotoVowels()
	composer.gotoScene( "vowels", { time=800, effect="crossFade" } )
end

local function gotoConsonants()
	composer.gotoScene( "consonants", { time=800, effect="crossFade" } )
end



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	local background = display.newImageRect( sceneGroup, "background.png", 800, 1400 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY


	local vowelsButton = display.newText( sceneGroup, "Vowels", display.contentCenterX, 500, native.systemFont, 44 )
	vowelsButton:setFillColor( 0.82, 0.6, 1 )
	vowelsButton:addEventListener( "tap", gotoVowels )
    
    local consonantsButton = display.newText( sceneGroup, "Consonants", display.contentCenterX, 700, native.systemFont, 44 )
	consonantsButton:setFillColor( 0.82, 0.6, 1 )
	consonantsButton:addEventListener( "tap", gotoConsonants )

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		-- Start the music!
--		audio.play( musicTrack, { channel=1, loops=-1 } )
	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		-- Stop the music!
--		audio.stop( 1 )
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
	-- Dispose audio!
	--audio.dispose( musicTrack )
end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene