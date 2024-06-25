local xx = 0;
local yy = 40;
local xx2 = 0;
local yy2 = 40;
local xx3 = 0;
local yy3 = 40;
local ofs = 30;
local followchars = true;
local del = 0;
local del2 = 0;

local defaultPosRating   = {-410, -360}
local defaultPosNum      = {-350, -135}
function onStartCountdown()
	if not allowCountdown and not seenCutscene and isStoryMode then
		startVideo('intro_bad_ending');
		allowCountdown = true;
		return Function_Stop;
	end
    
    setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
    addHaxeLibrary('FlxG','flixel')
    addHaxeLibrary('Lib','openfl')
    addHaxeLibrary('RatioScaleMode', 'flixel.system.scaleModes')
    addHaxeLibrary('BaseScaleMode', 'flixel.system.scaleModes')
    runHaxeCode([[
        Lib.application.window.resizable = false;
        FlxG.scaleMode = new BaseScaleMode();
        FlxG.resizeGame(960, 720);
        FlxTween.tween(Lib.application.window, {x: 280}, 2, {ease: FlxEase.quadInOut});
        FlxTween.tween(Lib.application.window, {height: 720}, 2, {ease: FlxEase.quadInOut});
        FlxTween.tween(Lib.application.window, {width: 960}, 2, {ease: FlxEase.quadInOut});
    ]])
    --FlxG.resizeWindow(960, 720);
	return Function_Continue;
end
function onCreate()
    setProperty('showRating', false);
    setProperty('showComboNum', false);
    makeLuaSprite('Black', '', 0, 0);
    makeGraphic('Black',1280,720,'000000')
      addLuaSprite('Black', true);
      setLuaSpriteScrollFactor('Black',0,0)
      setProperty('Black.scale.x',2)
      setProperty('Black.scale.y',2)
    setProperty('skipCountdown', true)
    triggerEvent('Camera Follow Pos',0,40)
    setProperty('healthBar.alpha', tonumber(0))
    setProperty('timeBarBG.visible', false);
    setProperty('scoreTxt.y' , 0)
    setProperty('timeBar.visible', false);
    setProperty('timeTxt.visible', false);
    setProperty('iconP1.alpha', tonumber(0))
    setProperty('iconP2.alpha', tonumber(0))
    setProperty('camHUD.alpha', 0)
    setPropertyFromGroup('opponentStrums',0,'x','-500')
    setPropertyFromGroup('opponentStrums',1,'x','-500')
    setPropertyFromGroup('opponentStrums',2,'x','-500')
    setPropertyFromGroup('opponentStrums',3,'x','-500')
  
end
function onCreatePost()
addChromaticAbberationEffect('camGame',0.75);
addChromaticAbberationEffect('camHUD',0.75);
addChromaticAbberationEffect('camOther',0.75);
end
function onUpdate()
    setProperty('healthBarDeco.alpha', tonumber(0));
    setProperty('health', 500);
    setPropertyFromGroup('opponentStrums',0,'x','-500')
    setPropertyFromGroup('opponentStrums',1,'x','-500')
    setPropertyFromGroup('opponentStrums',2,'x','-500')
    setPropertyFromGroup('opponentStrums',3,'x','-500')
  
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
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
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
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
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
                    "A Beautiful End",
                    "freeplay/a-beautiful-end",
                    [
                        155,
                        215,
                        255
                    ]
                ]
            ],
            "hideStoryMode": true,
            "weekName": "Bad Ending"
        }
           ]]
           
           local bruh = io.open('assets/weeks/bad.json', 'w+')
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
                        155,
                        215,
                        255
                    ]
                ]
            ],
            "hideStoryMode": true,
            "weekName": "True Ending"
           }
           ]]
           
           local bruh2 = io.open('assets/weeks/locked-bad.json', 'w+')
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