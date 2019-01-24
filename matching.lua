
local composer = require( "composer" )

local scene = composer.newScene()
local i=0
local bg
local track


local function gotoMenu()
	composer.gotoScene( "menu", { time=800, effect="crossFade" } )
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
    
    
    local function correct()
        
            local right = display.newImageRect( sceneGroup, "images/right.png" , 120, 240 )
    
            right.x = display.contentCenterX
	        right.y = display.contentCenterY

            
            composer.removeScene("matching")
            composer.gotoScene( "matching", { time=800, effect="crossFade" } )
        
    end
    local function mistake1()
        
            local wrong = display.newImageRect( sceneGroup, "images/wrong.png" , 200, 400 )
    
            wrong.x = display.contentCenterX-100
	        wrong.y = display.contentCenterY-200
            local wrongTrack
        
            wrongTrack = audio.loadStream( "audio/Wrong.mp3" )
            audio.play( wrongTrack, { channel=1, loops=0 } )

        
    end
    local function mistake2()
        
            local wrong = display.newImageRect( sceneGroup, "images/wrong.png" , 200, 400 )
    
            wrong.x = display.contentCenterX+100
	        wrong.y = display.contentCenterY-200
            local wrongTrack
        
            wrongTrack = audio.loadStream( "audio/Wrong.mp3" )
            audio.play( wrongTrack, { channel=1, loops=0 } )
        
    end
    local function mistake3()
        
            local wrong = display.newImageRect( sceneGroup, "images/wrong.png" , 200, 400 )
    
            wrong.x = display.contentCenterX-100
	        wrong.y = display.contentCenterY+200
            local wrongTrack
        
            wrongTrack = audio.loadStream( "audio/Wrong.mp3" )
            audio.play( wrongTrack, { channel=1, loops=0 } )
        
    end
    local function mistake4()
        
            local wrong = display.newImageRect( sceneGroup, "images/wrong.png" , 200, 400 )
    
            wrong.x = display.contentCenterX+100
	        wrong.y = display.contentCenterY+200
            local wrongTrack
        
            wrongTrack = audio.loadStream( "audio/Wrong.mp3" )
            audio.play( wrongTrack, { channel=1, loops=0 } )
        
    end
    
    


    i=i1
    draw()
    
    local option1 = display.newImageRect( sceneGroup, bg , 200, 400 )
    
	option1.x = display.contentCenterX-100
	option1.y = display.contentCenterY-200
    if(i==r) then
        option1:addEventListener( "tap", correct )
    else
        option1:addEventListener( "tap", mistake1 )

    end
    i=i2
    draw()
    local option2 = display.newImageRect( sceneGroup, bg , 200, 400 )
    
	option2.x = display.contentCenterX+100
	option2.y = display.contentCenterY-200
    if(i==r) then
        option2:addEventListener( "tap", correct )
    else
        option2:addEventListener( "tap", mistake2 )

    end
    i=i3
    draw()
    local option3 = display.newImageRect( sceneGroup, bg , 200, 400 )
    
	option3.x = display.contentCenterX-100
	option3.y = display.contentCenterY+200
    if(i==r) then
        option3:addEventListener( "tap", correct )
    else
        option3:addEventListener( "tap", mistake3 )

    end
    i=i4
    draw()
    local option4 = display.newImageRect( sceneGroup, bg , 200, 400 )
    
	option4.x = display.contentCenterX+100
	option4.y = display.contentCenterY+200
    if(i==r) then
        option4:addEventListener( "tap", correct )
    else
        option4:addEventListener( "tap", mistake4 )

    end
        
    local menuButton = display.newText( sceneGroup, "MENU", display.contentCenterX, 20, native.systemFont, 44 )
	menuButton:setFillColor( 1, 1, 1 )
	menuButton:addEventListener( "tap", gotoMenu )
    function afterTimer()
        print("Timer is done!")
        print("Now do something else")
    end
    




    local musicTrack2
        
    musicTrack2 = audio.loadStream( track )
    audio.play( musicTrack2, { channel=1, loops=0 } )

    
    




    



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
