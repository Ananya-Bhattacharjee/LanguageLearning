
local composer = require( "composer" )

local scene = composer.newScene()


local function gotoMenu()
    composer.removeScene("level2.balloon4")
    dri=4
    scoring=0

	composer.gotoScene( "menu", { time=800, effect="crossFade" } )
end

local function gotoMatching()
    if (scoring==0) then
        composer.gotoScene( "menu", { time=800, effect="crossFade" } )
    else 
        composer.gotoScene( "level2.start", { time=800, effect="crossFade" } )
    end
end



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
    local bg="images/balloon.jpg"
	local background = display.newImageRect( sceneGroup, "images/balloon.jpg", 800, 1400 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
    
    local function change()
        if (scoring==0) then
            bg="images/smiley.jpg"
        else 
            bg="images/sad.jpg"
        end
        background = display.newImageRect( sceneGroup, bg, 600, 1200 )
	   background.x = display.contentCenterX
	   background.y = display.contentCenterY
        local menuButton = display.newText( sceneGroup, "মেনু", display.contentCenterX, 50, native.systemFont, 44 )
	   menuButton:setFillColor( 0, 0, 0 )
	   menuButton:addEventListener( "tap", gotoMenu )

    end
    
    

	background:addEventListener( "tap", change )


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
	audio.dispose( musicTrack )
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