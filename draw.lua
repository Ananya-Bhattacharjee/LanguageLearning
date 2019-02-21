
local composer = require( "composer" )

local scene = composer.newScene()


local function gotoLetters()
	composer.gotoScene( "letters", { time=800, effect="crossFade" } )
end

local function gotoMatching()
	composer.gotoScene( "matching", { time=800, effect="crossFade" } )
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
    local background = display.newImageRect( sceneGroup, "whiteBackground.jpg", 800, 1400 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY

    
    background = display.newImageRect( sceneGroup, "images/letters/soreo.png", 800, 1400 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY

    local line                      --variable to hold the line object
    local initX                     --initial X coordinate of touch
    local initY                     --initial Y coordinate of touch
    local lineCreated = false       --Flag to check if line is already created 
    
    
    
    local flag=0
    local penoreraser="images/eraser.jpg"

    local drButton = display.newImageRect( sceneGroup, penoreraser, 50, 50 )
    drButton.x=display.contentCenterX-270
    drButton.y=display.contentCenterY

    local function drawing()

        if(flag==0)then
            flag=1
            penoreraser="images/pencil.jpg"
        else
            flag=0
            penoreraser="images/eraser.jpg"
        end
        
        drButton = display.newImageRect( sceneGroup, penoreraser, 50, 50 )
        drButton.x=display.contentCenterX-270
        drButton.y=display.contentCenterY



    end

    
    
    
    
    
    
    
    drButton:addEventListener( "tap", drawing )
    --proButton:setFillColor( 0, 0.6, 1 )
	
        
    
    
    

    --Create the 'brush'
    function paint(event)
        locationX = event.x
        locationY = event.y
        if event.phase == "began" then   --first touch
            --Delete previous line (in this case no multiple lines)
            if(line) then
                --line:removeSelf()
                --line = nil
            end

            --Set initX and initY with current touch location           
            initX = locationX       
            initY = locationY
        elseif event.phase == "moved" then   --during touch movement
            if lineCreated then
                --line has been created, just append to existing line
                line:append(locationX, locationY)
            else
                --Line has not been created
                --Make new line object, set color, and stroke width
                line = display.newLine(initX, initY, locationX, locationY)
                if(flag==0) then
                    line:setStrokeColor( 0, 0, 1 )
                else
                    line:setStrokeColor( 1, 1, 1 )
                end
                line.strokeWidth = 40

                --set line created flag to true
                lineCreated = true
            end     
        elseif event.phase == "ended" or event.phase == "cancelled" then --touch lifted
            --append last touch location to the line
            --line:append(locationX, locationY)
            lineCreated=false
        end
        return true
    end

    Runtime:addEventListener("touch", paint)




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
