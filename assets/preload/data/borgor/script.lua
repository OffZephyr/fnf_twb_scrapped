local xx = 600;
local yy = 500;
local xx2 = 950;
local yy2 = 500;
local xx3 = 775;
local yy3 = 500;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
	setPropertyFromClass('substates.GameOverSubstate', 'currentSongName', 'borgor');
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'major-dead');
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'majorDies');
	setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOverBorgor');
	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverBorgorEnd');
	setPropertyFromClass('substates.GameOverSubstate', 'CamZoom', 1);
    setProperty('healthBarDeco.alpha', tonumber(0));
    setProperty('healthBarBorgor.alpha', tonumber(1));

    makeLuaSprite('Orange', '', 0, 0);
    makeGraphic('Orange',1280,720,'FF906C')
    addLuaSprite('Orange', true);
    setLuaSpriteScrollFactor('Orange',0,0)
    setProperty('Orange.scale.x',2)
    setProperty('Orange.scale.y',2)
    setProperty('Orange.alpha', 0)
    setBlendMode('Orange', 'MULTIPLY')

    makeLuaSprite('Black', '', 0, 0);
    makeGraphic('Black',1280,720,'14132C')
    addLuaSprite('Black', true);
    setLuaSpriteScrollFactor('Black',0,0)
    setProperty('Black.scale.x',2)
    setProperty('Black.scale.y',2)
    setProperty('Black.alpha', 0)
    setBlendMode('Black', 'MULTIPLY')

	makeLuaSprite('3bolight', 'backgrounds/borgorlight1', -250, -175);
	setLuaSpriteScrollFactor('3bolight', 0.5, 0.5)
    scaleObject('3bolight', 1, 1)
    setBlendMode('3bolight', 'ADD')
    addLuaSprite('3bolight', false);

	makeLuaSprite('6bolight', 'backgrounds/borgorlight2', -250, -155);
	setLuaSpriteScrollFactor('6bolight', 0.7, 0.7)
    scaleObject('6bolight', 1, 1)
    setBlendMode('6bolight', 'ADD')
    addLuaSprite('6bolight', false);

    setProperty('6bolight.alpha', 0)
    setProperty('3bolight.alpha', 0)
    setProperty('2bosunset.alpha', 0)
    setProperty('2bonight.alpha', 0)
    setProperty('1bosunset.alpha', 0)
    setProperty('1bonight.alpha', 0)
    setProperty('0bo2.alpha', 0)
    setProperty('0bo3.alpha', 0)
	--setPropertyFromClass('GameOverSubstate', 'CamZoom', 0.3);
	--setPropertyFromClass('GameOverSubstate', 'currentSongName', 'corrupted-duel');
	--setPropertyFromClass('GameOverSubstate', 'characterName', 'jokeGF-dead');
	--setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'jokeGfDies');
	--setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
	--setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');

    setProperty('defaultCamZoom',1)
    setProperty('camHUD.alpha', 1)
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
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
                setProperty('defaultCamZoom',0.8)
            end
            if gfSection == true then
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
                    setProperty('defaultCamZoom',0.8)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                    setProperty('defaultCamZoom',0.8)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                    setProperty('defaultCamZoom',0.8)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                    setProperty('defaultCamZoom',0.8)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                    setProperty('defaultCamZoom',0.8)
				end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                    setProperty('defaultCamZoom',0.8)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                    setProperty('defaultCamZoom',0.8)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                    setProperty('defaultCamZoom',0.8)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                    setProperty('defaultCamZoom',0.8)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                    setProperty('defaultCamZoom',0.8)
                end
            end
        else
            
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                setProperty('defaultCamZoom',0.8)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                setProperty('defaultCamZoom',0.8)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
                setProperty('defaultCamZoom',0.8)
        end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                        triggerEvent('Camera Follow Pos',xx2,yy2)
                        setProperty('defaultCamZoom',0.8)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end
    function opponentNoteHit()
        health = getProperty('health')
        if getProperty('health') > 0.02 then
            setProperty('health', health- 0.01);
        end
end
function onGameOver()
    startVideo('majorDies')
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
                    "Borgor",
                    "freeplay/borgor",
                    [
                        135,
                        61,
                        91
                    ]
                ]
            ],
            "hideStoryMode": true,
            "weekName": "Duel"
           }
           ]]
           
           local bruh = io.open('assets/weeks/borgor.json', 'w+')
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
                        135,
                        61,
                        91
                    ]
                ]
            ],
            "hideStoryMode": true,
            "weekName": "True Ending"
           }
           ]]
           
           local bruh2 = io.open('assets/weeks/locked-borgor.json', 'w+')
           io.output(bruh2)
           io.write(funy2)
           io.close(bruh2)
    end
    if isStoryMode and not seenCutscene then
        startVideo('borgorend')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
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