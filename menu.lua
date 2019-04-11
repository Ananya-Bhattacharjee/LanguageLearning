
local composer = require( "composer" )

local scene = composer.newScene()


local function gotoLevel2()
    print(2)
    local sqlite3 = require( "sqlite3" )
    
    dri=4

    -- Create a file path for the database file "data.db"
    composer.gotoScene( "level2.start", { time=800, effect="crossFade" } )
end


local function gotoTrain()
	composer.gotoScene( "train", { time=800, effect="crossFade" } )
end


local function gotoTest()
	composer.gotoScene( "test", { time=800, effect="crossFade" } )
end

local function gotoStart()
    dri=0
	composer.gotoScene( "start", { time=800, effect="crossFade" } )
end


local function gotoLetters()
	composer.gotoScene( "letters", { time=800, effect="crossFade" } )
end

local function gotoMatching()
	composer.gotoScene( "matching", { time=800, effect="crossFade" } )
end

local function gotoSeeMatching()
	composer.gotoScene( "smc", { time=800, effect="crossFade" } )
end


local function gotoDraw()
	composer.gotoScene( "draw", { time=800, effect="crossFade" } )
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

	local startButton = display.newText( sceneGroup, "লেভেল ১", display.contentCenterX, 150, native.systemFont, 44 )
	startButton:setFillColor( 0, 0.6, 1 )


	startButton:addEventListener( "tap", gotoStart )
    
    local level2Button = display.newText( sceneGroup, "লেভেল ২", display.contentCenterX, 250, native.systemFont, 44 )
	level2Button:setFillColor( 0, 0.6, 1 )


	level2Button:addEventListener( "tap", gotoLevel2 )
    

    
    
	local lettersButton = display.newText( sceneGroup, "বর্ণমালা", display.contentCenterX, 350, native.systemFont, 44 )
	lettersButton:setFillColor( 0, 0.6, 1 )


	lettersButton:addEventListener( "tap", gotoLetters )

    
	local matchButton = display.newText( sceneGroup, "শুনি এবং মিলাই", display.contentCenterX, 450, native.systemFont, 44 )
	matchButton:setFillColor( 0, 0.6, 1 )


	matchButton:addEventListener( "tap", gotoMatching )

	local matchButton = display.newText( sceneGroup, "দেখি এবং মিলাই", display.contentCenterX, 550, native.systemFont, 44 )
	matchButton:setFillColor( 0, 0.6, 1 )


	matchButton:addEventListener( "tap", gotoSeeMatching)
    
    
    local drawButton = display.newText( sceneGroup,"আঁকি", display.contentCenterX, 650, native.systemFont, 44 )
	drawButton:setFillColor( 0, 0.6, 1 )
	drawButton:addEventListener( "tap", gotoDraw )
    
    --local trainButton = display.newText( sceneGroup, "train", display.contentCenterX, 500, native.systemFont, 44 )
	--trainButton:setFillColor( 0, 0.6, 1 )


	--trainButton:addEventListener( "tap", gotoTrain )

    --local testButton = display.newText( sceneGroup, "test", display.contentCenterX, 570, native.systemFont, 44 )
	--testButton:setFillColor( 0, 0.6, 1 )


	--testButton:addEventListener( "tap", gotoTest )


    
    
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
