local xx = 275;
local yy = 0;
local xx2 = 275;
local yy2 = 400;
local xx3 = 275;
local yy3 = 500;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
    setProperty('defaultCamZoom',1.7)
    setProperty('skipCountdown', true)
    setProperty('camHUD.alpha', 0)
    setPropertyFromGroup('opponentStrums',0,'x','-500')
    setPropertyFromGroup('opponentStrums',1,'x','-500')
    setPropertyFromGroup('opponentStrums',2,'x','-500')
    setPropertyFromGroup('opponentStrums',3,'x','-500')

    setPropertyFromGroup('playerStrums',0,'x','412')
    setPropertyFromGroup('playerStrums',1,'x','527')
    setPropertyFromGroup('playerStrums',2,'x','643')
    setPropertyFromGroup('playerStrums',3,'x','761')
end
function onUpdate()
    setPropertyFromGroup('opponentStrums',0,'x','-500')
    setPropertyFromGroup('opponentStrums',1,'x','-500')
    setPropertyFromGroup('opponentStrums',2,'x','-500')
    setPropertyFromGroup('opponentStrums',3,'x','-500')

    setPropertyFromGroup('playerStrums',0,'x','412')
    setPropertyFromGroup('playerStrums',1,'x','527')
    setPropertyFromGroup('playerStrums',2,'x','643')
    setPropertyFromGroup('playerStrums',3,'x','761')
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
                setProperty('defaultCamZoom',0.7)
                doTweenX('bfScaleTweenX', 'boyfriend.scale', 2.25, 0.25, 'sineOut')
                doTweenY('bfTweenY', 'boyfriend', 0, 0.5, 'sineOut')
                doTweenY('gfTweenY', 'dad', -700, 0.5, 'sineOut')
                doTweenY('bfScaleTweenY', 'boyfriend.scale', 2.25, 0.25, 'sineOut')
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
                setProperty('defaultCamZoom',0.7)
                doTweenX('bfScaleTweenX', 'boyfriend.scale', 2.25, 0.25, 'sineOut')
                doTweenY('bfTweenY', 'boyfriend', 0, 0.5, 'sineOut')
                doTweenY('gfTweenY', 'dad', -700, 0.5, 'sineOut')
                doTweenY('bfScaleTweenY', 'boyfriend.scale', 2.25, 0.25, 'sineOut')
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
                setProperty('defaultCamZoom',0.7)
                doTweenX('bfScaleTweenX', 'boyfriend.scale', 2.25, 0.25, 'sineOut')
                doTweenY('bfTweenY', 'boyfriend', 0, 0.5, 'sineOut')
                doTweenY('gfTweenY', 'dad', -700, 0.5, 'sineOut')
                doTweenY('bfScaleTweenY', 'boyfriend.scale', 2.25, 0.25, 'sineOut')
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
                setProperty('defaultCamZoom',0.7)
                doTweenX('bfScaleTweenX', 'boyfriend.scale', 2.25, 0.25, 'sineOut')
                doTweenY('bfTweenY', 'boyfriend', 0, 0.5, 'sineOut')
                doTweenY('gfTweenY', 'dad', -700, 0.5, 'sineOut')
                doTweenY('bfScaleTweenY', 'boyfriend.scale', 2.25, 0.25, 'sineOut')
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
                doTweenX('bfScaleTweenX', 'boyfriend.scale', 2.25, 0.25, 'sineOut')
                doTweenY('bfTweenY', 'boyfriend', 0, 0.5, 'sineOut')
                doTweenY('gfTweenY', 'dad', -700, 0.5, 'sineOut')
                doTweenY('bfScaleTweenY', 'boyfriend.scale', 2.25, 0.25, 'sineOut')
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
                setProperty('defaultCamZoom',0.5)
                doTweenX('bfScaleTweenX', 'boyfriend.scale', 1.75, 0.25, 'sineOut')
                doTweenY('bfTweenY', 'boyfriend', 75, 0.5, 'sineOut')
                doTweenY('gfTweenY', 'dad', -550, 0.5, 'sineOut')
                doTweenY('bfScaleTweenY', 'boyfriend.scale', 1.75, 0.25, 'sineOut')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                setProperty('defaultCamZoom',0.5)
                doTweenX('bfScaleTweenX', 'boyfriend.scale', 1.75, 0.25, 'sineOut')
                doTweenY('bfTweenY', 'boyfriend', 75, 0.5, 'sineOut')
                doTweenY('gfTweenY', 'dad', -550, 0.5, 'sineOut')
                doTweenY('bfScaleTweenY', 'boyfriend.scale', 1.75, 0.25, 'sineOut')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                setProperty('defaultCamZoom',0.5)
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                doTweenX('bfScaleTweenX', 'boyfriend.scale', 1.75, 0.25, 'sineOut')
                doTweenY('bfTweenY', 'boyfriend', 75, 0.5, 'sineOut')
                doTweenY('gfTweenY', 'dad', -550, 0.5, 'sineOut')
                doTweenY('bfScaleTweenY', 'boyfriend.scale', 1.75, 0.25, 'sineOut')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                setProperty('defaultCamZoom',0.5)
                doTweenX('bfScaleTweenX', 'boyfriend.scale', 1.75, 0.25, 'sineOut')
                doTweenY('bfTweenY', 'boyfriend', 75, 0.5, 'sineOut')
                doTweenY('gfTweenY', 'dad', -550, 0.5, 'sineOut')
                doTweenY('bfScaleTweenY', 'boyfriend.scale', 1.75, 0.25, 'sineOut')
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
                   setProperty('defaultCamZoom',0.5)
                   doTweenX('bfScaleTweenX', 'boyfriend.scale', 1.75, 0.25, 'sineOut')
                   doTweenY('bfTweenY', 'boyfriend', 100, 0.5, 'sineOut')
                   doTweenY('gfTweenY', 'dad', -550, 0.5, 'sineOut')
                   doTweenY('bfScaleTweenY', 'boyfriend.scale', 1.75, 0.25, 'sineOut')
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end
    function opponentNoteHit()
        health = getProperty('health')
        if getProperty('health') > 0.05 then
            setProperty('health', health- 0.02);
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
                    "Puppetry",
                    "freeplay/puppetry",
                    [
                        30,
                        50,
                        30
                    ]
                ]
            ],
            "hideStoryMode": true,
            "weekName": "Main Songs"
           }
           ]]
           
           local bruh = io.open('assets/weeks/puppetry.json', 'w+')
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
                        30,
                        50,
                        30
                    ]
                ]
            ],
            "hideStoryMode": true,
            "weekName": "True Ending"
           }
           ]]
           
           local bruh2 = io.open('assets/weeks/locked-puppetry.json', 'w+')
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