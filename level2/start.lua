
local composer = require( "composer" )

local scene = composer.newScene()
scoring=0


local function gotoStart()
	composer.gotoScene( "level2.start", { time=800, effect="crossFade" } )
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

local function gotoQuiz()
    composer.removeScene("level2.matchingCopy")
    composer.removeScene("level2.smcCopy")
    composer.removeScene("level2.seematchingCopy")


	composer.gotoScene( "level2.matchingCopy", { time=800, effect="crossFade" } )
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

	local background = display.newImageRect( sceneGroup, "background.png", 600, 1200 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
    --musicTrack = audio.loadStream("audio/soreo.mp3")
    --audio.play( musicTrack, { channel=1, loops=0 } )
    
    local menuButton = display.newText( sceneGroup, "মেনু", display.contentCenterX, 50, native.systemFont, 44 )
	menuButton:setFillColor( 0, 0, 0 )
--	menuButton:addEventListener( "tap", gotoMenu )
    
    local function draw()
        background = display.newImageRect( sceneGroup, "whiteBackground.jpg", 600, 1200 )
        background.x = display.contentCenterX
        background.y = display.contentCenterY

        if(dri==0) then
            bg="images/Ojogor.png"
            track="video/soreo.mp4"
        elseif(dri==1) then
            bg="images/aagun.png"
            track="video/sorea.mp4"
        elseif(dri==2) then
            bg="images/Eee-te-endur.png"
            track="video/rossoi.mp4"
        elseif(dri==3) then
            bg="images/Eagle.png"
            track="video/dirghoi.mp4"
        elseif(dri==4) then
            bg="images/uutpakhi.png"
            track="video/rossou.mp4"
        elseif(dri==5) then
            bg="images/Urdhomukhi.png"
            track="video/dirghou.mp4"
        elseif(dri==6) then
            bg="images/ri.png"
            track="video/ri.mp4"
        elseif(dri==7) then
            bg="images/ekush.png"
            track="video/e.mp4"
        elseif(dri==8) then
            bg="images/Oirabot.png"
            track="video/oi.mp4"
        elseif(dri==9) then
            bg="images/Ojon-baksho.png"
            track="video/o.mp4"
        elseif(dri==10) then
            bg="images/Oushodh.png"
            track="video/ou.mp4"
            
        
        end    
    end
    
    draw()



--    print ( display.pixelWidth, display.pixelHeight )
    --media.playVideo("temp.mp4",true,onComplete)
    local video = native.newVideo( display.contentCenterX, display.contentCenterY, 1000, 1000 )

	video:load(track)

	video:play()
    local clock=os.clock
    function sleep(n)  -- seconds
              local t0 = clock()
              while clock() - t0 <= n do end
    end
    local function timeywimey( event )
            video:pause()
            video:removeSelf()
            video = nil
    end
    timer.performWithDelay( 15000, timeywimey )
    
    
    
	background = display.newImageRect( sceneGroup, bg, 600, 1200 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
    local ses=11
    
    

    local function inVowelsNext()
        dri=dri+1
        if(dri==ses) then
            dri=0
        end
        draw()
        sceneGroup:removeSelf()
        sceneGroup=nil
        composer.removeScene("level2.start")
        composer.gotoScene( "level2.start", { time=80, effect="crossFade" } )

        print(dri)
        


    end
    local function inVowelsPrev()
        dri=dri-1
        if(dri==-1) then
            dri=ses-1
        end
        draw()
        sceneGroup:removeSelf()
        sceneGroup=nil
        composer.removeScene("level2.start")
        composer.gotoScene( "level2.start", { time=80, effect="crossFade" } )

        print(dri)


    end
    
    local function gotoMenu()
        sceneGroup:removeSelf()
        sceneGroup=nil
        composer.removeScene("level2.start")

	   composer.gotoScene( "menu", { time=800, effect="crossFade" } )
    end




    

    
    local menuButton = display.newText( sceneGroup, "মেনু", display.contentCenterX, 50, native.systemFont, 44 )
	menuButton:setFillColor( 0, 0, 0 )
	menuButton:addEventListener( "tap", gotoMenu )

    local menuButton = display.newText( sceneGroup, "কুইজ", display.contentCenterX+200, 50, native.systemFont, 44 )
	menuButton:setFillColor( 0, 0, 0 )
	menuButton:addEventListener( "tap", gotoQuiz )

    


	local prevButton = display.newText( sceneGroup, "<", display.contentCenterX+100, 900, native.systemFont, 64 )
	prevButton:setFillColor( 0, 0.6, 1 )
	prevButton:addEventListener( "tap", inVowelsPrev )

    
	local nextButton = display.newText( sceneGroup, ">", display.contentCenterX+200, 900, native.systemFont, 64 )
	nextButton:setFillColor( 0, 0.6, 1 )
	nextButton:addEventListener( "tap", inVowelsNext )


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
