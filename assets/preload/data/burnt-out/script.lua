local z1 = 0.8;
local z2 = 0.85;
local xx = 0;
local yy = 0;
local xx2 = 0;
local yy2 = 0;
local xx3 = 0;
local yy3 = 0;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
local middle = 1;
local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and not seenCutscene and isStoryMode then
		startVideo('fire');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end
function onCreate()
	setProperty('2t.alpha',0.1)
    makeLuaSprite('Black', '', 0, 0);
    makeGraphic('Black',1280,720,'000000')
      addLuaSprite('Black', true);
      setLuaSpriteScrollFactor('Black',0,0)
      setProperty('Black.scale.x',2)
      setProperty('Black.scale.y',2)
    setProperty('skipCountdown', true)
    addCharacterToList('trueendingbf', 'boyfriend')
    setPropertyFromGroup('opponentStrums',0,'x','-500')
    setPropertyFromGroup('opponentStrums',1,'x','-500')
    setPropertyFromGroup('opponentStrums',2,'x','-500')
    setPropertyFromGroup('opponentStrums',3,'x','-500')
  
    setPropertyFromGroup('playerStrums',0,'x','412')
    setPropertyFromGroup('playerStrums',1,'x','527')
    setPropertyFromGroup('playerStrums',2,'x','643')
    setPropertyFromGroup('playerStrums',3,'x','761')
    setProperty('camHUD.alpha', 0)
end
function onEvent(n,v1,v2)
if n == "burntoutcam" then
    
    if v1 == '0' then
    xx = 0;
    yy = 0;	
    xx2 = 0;
    yy2 = 0;
    z1 = 0.8;
    z2 = 0.85;
    end
    
    if v1 == '1' then
        xx = -150;
        yy = -30;
        xx2 = 100;
        yy2 = -10;
        z1 = 1.2;
        z2 = 1.0;	
        end
    
        if v1 == '2' then
            xx = -200;
            yy = -40;
            xx2 = 100;
            yy2 = -10;
            z1 = 1.4;
            z2 = 1.4;
            setProperty('defaultCamZoom',1.4)
            end
    
            if v1 == '3' then
                xx = 0;
                yy = 0;	
                xx2 = 0;
                yy2 = 0;
                z1 = 0.8;
                z2 = 1.3;
                setProperty('defaultCamZoom',1.3)
                end
    
                if v1 == '4' then
                    xx = 0;
                    yy = 0;	
                    xx2 = 0;
                    yy2 = 0;
                    z1 = 0.8;
                    z2 = 0.85;
                    setProperty('defaultCamZoom',0.8)
                    end
end
end
function onUpdate()
    setProperty('healthBarDeco.alpha', tonumber(0));
    setProperty('healthBarFire.alpha', tonumber(1));
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
                setProperty('defaultCamZoom',z1)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
                setProperty('defaultCamZoom',z1)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
                setProperty('defaultCamZoom',z1)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
                setProperty('defaultCamZoom',z1)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
                setProperty('defaultCamZoom',z1)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
                setProperty('defaultCamZoom',z1)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
                setProperty('defaultCamZoom',z1)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
                setProperty('defaultCamZoom',z1)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if gfSection == true then
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
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
            
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                setProperty('defaultCamZoom',z2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                setProperty('defaultCamZoom',z2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                setProperty('defaultCamZoom',z2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                setProperty('defaultCamZoom',z2)
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
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.025);
    end
end

local allowEndShit = false

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
                "Burnt Out",
                "freeplay/burnt-out",
                [
                    120,
                    60,
                    40
                ]
            ]
        ],
        "hideStoryMode": true,
        "weekName": "True Ending"
        }
        ]]
        
        local bruh = io.open('assets/weeks/true.json', 'w+')
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
                    "freeplay/burnt-out-locked",
                    [
                        120,
                        60,
                        40
                    ]
                ]
            ],
            "hideStoryMode": true,
            "weekName": "True Ending"
        }
        ]]
        
        local bruh2 = io.open('assets/weeks/locked-burnt-out.json', 'w+')
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