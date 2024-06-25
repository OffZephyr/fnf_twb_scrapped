local xx = 600; -- Code to change the position of the camera to the left or right for your opponent, Less = Left (They can be negative numbers), More = Right
local yy = 400; -- Code to change the position of the camera up or down for the enemy Less = Down (They can be negative numbers), More = Up
local xx2 = 675; -- Same code as above, but for boyfriend left, right
local yy2 = 300; -- Same code as above, but for boyfriend up, down
local xx3 = 275; -- Same code as above, but for girlfriend left, right
local yy3 = 500; -- Same code as above, but for girlfriend, up, down
local ofs = 35; -- Code to adjust the intensity with which the camera moves, the more numbers, the more intense, and the fewer numbers, less intense
local followchars = true; -- This code is necessary for the script to work, don't even think about deleting it!
local del = 0;
local del2 = 0;
function onCreate()
    makeLuaSprite('Black', '', 0, 0);
    makeGraphic('Black',1280,720,'000000')
      addLuaSprite('Black', true);
      setLuaSpriteScrollFactor('Black',0,0)
      setProperty('Black.scale.x',2)
      setProperty('Black.scale.y',2)
    setProperty('healthBarDeco.alpha', tonumber(0));
    setProperty('healthBar.alpha', tonumber(0))
    setProperty('scoreTxt.y' , 0)
    setProperty('iconP1.alpha', tonumber(0))
    setProperty('iconP2.alpha', tonumber(0))
    setProperty('skipCountdown', true)
    setProperty('camHUD.alpha', 0)
    setPropertyFromGroup('opponentStrums',0,'x','-500')
    setPropertyFromGroup('opponentStrums',1,'x','-500')
    setPropertyFromGroup('opponentStrums',2,'x','-500')
    setPropertyFromGroup('opponentStrums',3,'x','-500')

    --setPropertyFromGroup('playerStrums',0,'x','412')
    --setPropertyFromGroup('playerStrums',1,'x','527')
    --setPropertyFromGroup('playerStrums',2,'x','643')
    --setPropertyFromGroup('playerStrums',3,'x','761')
end
function onUpdate() -- The Main Code
    setProperty('health', 100);
    setPropertyFromGroup('opponentStrums',0,'x','-500')
    setPropertyFromGroup('opponentStrums',1,'x','-500')
    setPropertyFromGroup('opponentStrums',2,'x','-500')
    setPropertyFromGroup('opponentStrums',3,'x','-500')

    --setPropertyFromGroup('playerStrums',0,'x','412')
    --setPropertyFromGroup('playerStrums',1,'x','527')
    --setPropertyFromGroup('playerStrums',2,'x','643')
    --setPropertyFromGroup('playerStrums',3,'x','761')
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then -- Code for the camera to follow the poses of your opponent
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
                setProperty('defaultCamZoom',0.7)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
                setProperty('defaultCamZoom',0.7)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
                setProperty('defaultCamZoom',0.7)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
                setProperty('defaultCamZoom',0.7)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
                setProperty('defaultCamZoom',0.7)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
                setProperty('defaultCamZoom',0.7)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
                setProperty('defaultCamZoom',0.7)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
                setProperty('defaultCamZoom',0.7)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
                setProperty('defaultCamZoom',0.7)
            end
            if gfSection == true then -- The camera follows GF when she sings, only when the "GF Section" option in the chart editor is activated. 
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then -- Credits to Serebeat and company for their Slaybells mod,
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)              -- That's where I got the gf code from.
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
				end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                end
            end
        else
                 -- Code for the camera to follow the poses of boyfriend
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                setProperty('defaultCamZoom',1)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                setProperty('defaultCamZoom',1)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                setProperty('defaultCamZoom',1)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                setProperty('defaultCamZoom',1)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	        if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                   triggerEvent('Camera Follow Pos',xx2,yy2)
                   setProperty('defaultCamZoom',0.725)
            end       
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                  triggerEvent('Camera Follow Pos',xx2,yy2)
                  setProperty('defaultCamZoom',0.725)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','') -- Self explanatory
    end
end

function onEndSong()
    if not allowEndShit then
       funy = [[
           {
            "storyName": "The World Below",
            "hideFreeplay": false,
            "weekBackground": "stage",
            "weekBefore": "tutorial",
            "startUnlocked": true, 
            "weekCharacters": [
                "dad",
                "bf",
                "gf"
            ],
            "songs": [
                [
                    "Slowly",
                    "freeplay/slowly",
                    [
                        125,
                        74,
                        42
                    ]
                ]
            ],
            "hideStoryMode": true,
            "weekName": "Game Over"
           }
           ]]
           
           local bruh = io.open('assets/weeks/gameover.json', 'w+')
           io.output(bruh)
           io.write(funy)
           io.close(bruh)

           funy2 = [[
           {
            "storyName": "The World Below",
            "hideFreeplay": true,
            "weekBackground": "stage",
            "weekBefore": "tutorial",
            "startUnlocked": true,
            "weekCharacters": [
                "dad",
                "bf",
                "gf"
            ],
            "songs": [
                [
                    "locked",
                    "freeplay/locked",
                    [
                        125,
                        74,
                        42
                    ]
                ]
            ],
            "hideStoryMode": true,
            "weekName": "True Ending"
           }
           ]]
           
           local bruh2 = io.open('assets/weeks/locked-slowly.json', 'w+')
           io.output(bruh2)
           io.write(funy2)
           io.close(bruh2)
    end
   end

   function onSpawnNote(i)
    setPropertyFromGroup('notes', i, 'shader', nil)
    setPropertyFromGroup('notes', i, 'noteSplashData.r', 0xff0000)
    setPropertyFromGroup('notes', i, 'noteSplashData.g', 0x00ff00)
    setPropertyFromGroup('notes', i, 'noteSplashData.b', 0x0000ff)
end
function onUpdatePost()
    if startedCountdown and not inGameOver then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'shader', nil)
        end
    end
end