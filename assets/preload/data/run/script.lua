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
local healthstuck = 0;
function onBeatHit()
    if curBeat % 4 == 0 then
	luaSpritePlayAnimation('gradiant', 'gradiantidle', true)
    end
end

function onCreate()
    setProperty('health', 2);
    addCharacterToList('trueendingbf', 'boyfriend')
    setPropertyFromGroup('opponentStrums',0,'x','-500')
    setPropertyFromGroup('opponentStrums',1,'x','-500')
    setPropertyFromGroup('opponentStrums',2,'x','-500')
    setPropertyFromGroup('opponentStrums',3,'x','-500')
  
    setPropertyFromGroup('playerStrums',0,'x','412')
    setPropertyFromGroup('playerStrums',1,'x','527')
    setPropertyFromGroup('playerStrums',2,'x','643')
    setPropertyFromGroup('playerStrums',3,'x','761')
end
function onCreatePost()
    setPropertyFromGroup('opponentStrums',0,'x','-500')
    setPropertyFromGroup('opponentStrums',1,'x','-500')
    setPropertyFromGroup('opponentStrums',2,'x','-500')
    setPropertyFromGroup('opponentStrums',3,'x','-500')
    setPropertyFromGroup('playerStrums',0,'x','202')
    setPropertyFromGroup('playerStrums',1,'x','327')
    setPropertyFromGroup('playerStrums',2,'x','443')
    setPropertyFromGroup('playerStrums',3,'x','561')

    initLuaShader("scroll0")
    initLuaShader("scroll1")
    initLuaShader("scroll25")
    initLuaShader("scroll2")
    initLuaShader("scroll3")
    initLuaShader("scroll4")
    initLuaShader("scroll5")
    initLuaShader("scroll6")
    initLuaShader("scroll7")
    initLuaShader("scroll8")
    initLuaShader("scroll9")
    initLuaShader("scroll10")
 
  setSpriteShader('0g',"scroll0")
  setSpriteShader('1g',"scroll1")
  setSpriteShader('25g',"scroll25")
  setSpriteShader('2g',"scroll2")
  setSpriteShader('3g',"scroll3")
  setSpriteShader('4g',"scroll4")
  setSpriteShader('5g',"scroll5")
  setSpriteShader('6g',"scroll6")
  setSpriteShader('7g',"scroll7")
  setSpriteShader('8g',"scroll8")
  setSpriteShader('9g',"scroll9")
  setSpriteShader('10g',"scroll10")
 end
 function onEvent(n,v1,v2)

    if n == 'runBlackOut' and v1 == 'true' then

        setProperty('healthBarDeco.alpha', tonumber(0))
        setProperty('healthBar.alpha', tonumber(0))
        setProperty('iconP1.alpha', tonumber(0))
        setProperty('iconP2.alpha', tonumber(0))
    healthstuck = 1;
    setProperty('camHUD.alpha', 0);
    end
    if n == 'runBlackOut' and v1 == 'change1' then
        setProperty('0g.visible', false);
        setProperty('1g.visible', false);
        setProperty('25g.visible', false);
        setProperty('2g.visible', false);
        setProperty('3g.visible', false);
        setProperty('4g.visible', false);
        setProperty('5g.visible', false);
        setProperty('6g.visible', false);
        setProperty('7g.visible', false);
        setProperty('8g.visible', false);
        setProperty('9g.visible', false);
        setProperty('10g.visible', false);
        setProperty('01g.visible', false);
        setProperty('01g.alpha', 1);
        setProperty('body.visible', false);
        setProperty('arm.visible', false);
        setProperty('fabricchasing.visible', false);
        setProperty('wg.visible', true);
        setProperty('body_white.visible', true);
        setProperty('arm_white.visible', true);
        end


        if n == 'runCutscene' and v1 == '1' then
            healthstuck = 2;
            end

    if n == 'runBlackOut' and v1 == 'pictures' then
    healthstuck = 2;
    setProperty('gradiant.visible', true);
    end
    

    if n == 'runBlackOut' and v1 == 'reset' then
        healthstuck = 0;
        setProperty('gradiant.visible', false);
        end
    

        if n == 'runBlackOut' and v1 == 'transition' then
            healthstuck = 1;
            setProperty('gradiant.visible', false);
            end
            if n == 'runBlackOut' and v1 == 'transition2' then
                healthstuck = 3;
                end
                if n == 'runBlackOut' and v1 == 'transition3' then
                    healthstuck = 4;
                    end
                    if n == 'runBlackOut' and v1 == 'transition4' then
                        healthstuck = 5;
                        setProperty('health', 2);
                        makeLuaSprite('flash', '', 0, 0);
                    makeGraphic('flash',1280,720,'ffffff')
                      addLuaSprite('flash', true);
                      setLuaSpriteScrollFactor('flash',0,0)
                      setProperty('flash.scale.x',2)
                      setProperty('flash.scale.y',2)
                      setProperty('flash.alpha',0)
                    setProperty('flash.alpha',1)
                    doTweenAlpha('flTw','flash',0,5,'linear')
                    xx = 0
                    xx2 = 0
                    yy = 0
                    yy2 = 0
                    doTweenX('fabricchasingtween0', 'fabricchasing', -850, 0.1, 'quadInOut')
                    setProperty('defaultCamZoom',0.8)
                    setProperty('healthBarDeco.alpha', tonumber(1))
                    setProperty('healthBar.alpha', tonumber(1))
                    setProperty('iconP1.alpha', tonumber(1))
                    setProperty('iconP2.alpha', tonumber(1))

	setProperty('0g.visible', true);
	setProperty('1g.visible', true);
	setProperty('25g.visible', true);
	setProperty('2g.visible', true);
	setProperty('3g.visible', true);
	setProperty('4g.visible', true);
	setProperty('5g.visible', true);
	setProperty('6g.visible', true);
	setProperty('7g.visible', true);
	setProperty('8g.visible', true);
	setProperty('9g.visible', true);
	setProperty('10g.visible', true);
	setProperty('01g.visible', false);
	setProperty('01g.alpha', 1);
	setProperty('body.visible', true);
	setProperty('arm.visible', true);
	setProperty('fabricchasing.visible', true);
	setProperty('wg.visible', false);
	setProperty('body_white.visible', false);
	setProperty('arm_white.visible', false);
	setProperty('gradiant.visible', false);
                        end
end
 
function onUpdate()
if healthstuck == 1 then
    setProperty('health', 0.5);
end
if healthstuck == 2 then
    setProperty('health', 1.7);
end
if healthstuck == 3 then
    setProperty('health', 0.3);
end
if healthstuck == 4 then
    setProperty('health', 0.1);
end

        if getProperty('health') < 1.8 then
        xx = 0
        xx2 = 0
        yy = 0
        yy2 = 0
        doTweenX('fabricchasingtween0', 'fabricchasing', -850, 0.1, 'quadInOut')
        setProperty('defaultCamZoom',0.8)
    end
        if getProperty('health') < 1.6 then
        xx = 100
        xx2 = 100
        yy = 20
        yy2 = 20
        doTweenX('fabricchasingtween0', 'fabricchasing', -700, 0.1, 'quadInOut')
        setProperty('defaultCamZoom',0.9)
    end
        if getProperty('health') < 1.4 then
        xx = 140
        xx2 = 140
        yy = 60
        yy2 = 60
        doTweenX('fabricchasingtween0', 'fabricchasing', -600, 0.1, 'quadInOut')
        setProperty('defaultCamZoom',1)
    end
        if getProperty('health') < 1.2 then
        xx = 180
        xx2 = 180
        yy = 100
        yy2 = 100
        doTweenX('fabricchasingtween0', 'fabricchasing', -500, 0.1, 'quadInOut')
        setProperty('defaultCamZoom',1.1)
    end
        if getProperty('health') < 1 then
        xx = 220
        xx2 = 220
        yy = 140
        yy2 = 140
        doTweenX('fabricchasingtween0', 'fabricchasing', -400, 0.1, 'quadInOut')
        setProperty('defaultCamZoom',1.2)
    end
        if getProperty('health') < 0.8 then
        xx = 260
        xx2 = 260
        yy = 180
        yy2 = 180
        doTweenX('fabricchasingtween0', 'fabricchasing', -300, 0.1, 'quadInOut')
        setProperty('defaultCamZoom',1.3)
    end
        if getProperty('health') < 0.6 then
        xx = 300
        xx2 = 300
        yy = 220
        yy2 = 220
        doTweenX('fabricchasingtween0', 'fabricchasing', -200, 0.1, 'quadInOut')
        setProperty('defaultCamZoom',1.4)
    end
    if getProperty('health') < 0.4 then
        xx = 340
        xx2 = 340
        yy = 260
        yy2 = 260
        setProperty('defaultCamZoom',1.5)
        doTweenX('fabricchasingtween0', 'fabricchasing', -150, 0.1, 'quadInOut')
    end
    if getProperty('health') < 0.2 then
        xx = 380
        xx2 = 380
        yy = 300
        yy2 = 300
        doTweenX('fabricchasingtween0', 'fabricchasing', -100, 0.1, 'quadInOut')
        setProperty('defaultCamZoom',1.6)
    end


    health = getProperty('health')
   if healthstuck == 0 then
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.001);
    end
end
if healthstuck == 5 then
 if getProperty('health') > 0.05 then
     setProperty('health', health- 0.00175);
 end
end

    setShaderFloat("0g", "iTime", os.clock())
    setShaderFloat("1g", "iTime", os.clock())
    setShaderFloat("25g", "iTime", os.clock())
    setShaderFloat("2g", "iTime", os.clock())
    setShaderFloat("3g", "iTime", os.clock())
    setShaderFloat("4g", "iTime", os.clock())
    setShaderFloat("5g", "iTime", os.clock())
    setShaderFloat("6g", "iTime", os.clock())
    setShaderFloat("7g", "iTime", os.clock())
    setShaderFloat("8g", "iTime", os.clock())
    setShaderFloat("9g", "iTime", os.clock())
    setShaderFloat("10g", "iTime", os.clock())
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
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx2,yy2)
                end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end


function onSpawnNote(i)
    setPropertyFromGroup('notes', i, 'shader', nil)
    setPropertyFromGroup('notes', i, 'noteSplashData.r', 0xff0000)
    setPropertyFromGroup('notes', i, 'noteSplashData.g', 0x00ff00)
    setPropertyFromGroup('notes', i, 'noteSplashData.b', 0x0000ff)
end
function onUpdatePost()
    setProperty("iconP1.x", 880)
    if startedCountdown and not inGameOver then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'shader', nil)
        end
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
                "Run.",
                "freeplay/run",
                [
                    175,
                    255,
                    115
                ]
            ]
        ],
        "hideStoryMode": true,
        "weekName": "Good Ending"
    }
           ]]
           
           local bruh = io.open('assets/weeks/run.json', 'w+')
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
           
           local bruh2 = io.open('assets/weeks/locked-run.json', 'w+')
           io.output(bruh2)
           io.write(funy2)
           io.close(bruh2)
    end
   end