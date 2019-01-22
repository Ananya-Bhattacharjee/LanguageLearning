
local composer = require( "composer" )

local scene = composer.newScene()
local i=0
local bg
local track




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
    
    local function draw()
        if(i==0) then
            bg="images/Ojogor.png"
        elseif(i==1) then
            bg="images/aagun.png"
        elseif(i==2) then
            bg="images/Eee-te-endur.png"
        elseif(i==3) then
            bg="images/Eagle.png"
        elseif(i==4) then
            bg="images/uutpakhi.png"
        elseif(i==5) then
            bg="images/Urdhomukhi.png"
        elseif(i==6) then
            bg="images/ekush.png"
        elseif(i==7) then
            bg="images/Oirabot.png"
        elseif(i==8) then
            bg="images/Ojon-baksho.png"
        elseif(i==9) then
            bg="images/Oushodh.png"
        end	    
    end
    
    local function hear()
        if(i==0) then
            track="audio/soreo.mp3"
        elseif(i==1) then
            track="audio/sorea.mp3"
        elseif(i==2) then
            track="audio/rossoi.mp3"
        elseif(i==3) then
            track="audio/dirghoi.mp3"
        elseif(i==4) then
            track="audio/rossou.mp3"
        elseif(i==5) then
            track="audio/dirghou.mp3"
        elseif(i==6) then
            track="audio/ae.mp3"
        elseif(i==7) then
            track="audio/oi.mp3"
        elseif(i==8) then
            track="audio/o.mp3"
        elseif(i==9) then
            track="audio/ou.mp3"
        end
    end
    
    local function pronunciation()
        local musicTrack
        
        musicTrack = audio.loadStream( track )
        audio.play( musicTrack, { channel=1, loops=0 } )

    end


    local numLetter=9
    local r=math.random(0,numLetter)
    --print(r)
    i=r
    hear()
    draw()
    local pronButton = display.newImageRect( sceneGroup, "images/sound.png", 50, 50 )
    pronButton.x=display.contentCenterX+150
    pronButton.y=display.contentCenterY-450
    
    pronButton:addEventListener( "tap", pronunciation )
    
    local i1,i2,i3,i4
    local f1=0
    local f2=0
    local f3=0
    local f4=0
    
    local function assign()
        
        repeat
            i1=math.random(0,numLetter)
            i2=math.random(0,numLetter)
            i3=math.random(0,numLetter)
            i4=math.random(0,numLetter)
            
        
        
        until(i1 ~=i2 and i1 ~=i3 and i1 ~=i4 and i2 ~=i3 and i2 ~=i4 and i3 ~= i4)
        
        if(i1 ~= r and i2 ~= r and i3 ~= r and i4 ~= r)then
            
            local choice=math.random(0,3)
            
            if(choice==0)then
                i1=r
            elseif(choice==1)then
                i2=r
            elseif(choice==2)then
                i3=r
            elseif(choice==3)then
                i4=r
            end
            
        end    
        
        print(r,i1,i2,i3,i4)


        
        
    
    end
    
    assign()




    



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
