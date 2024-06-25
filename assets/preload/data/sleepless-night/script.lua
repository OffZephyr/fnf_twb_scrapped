local del = 0;
local del2 = 0;
local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and not seenCutscene and isStoryMode then
		startVideo('wakeup');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end
function onCreate()
    
    makeLuaSprite('Black', '', 0, 0);
    makeGraphic('Black',1280,720,'000000')
      addLuaSprite('Black', true);
      setLuaSpriteScrollFactor('Black',0,0)
      setProperty('Black.scale.x',2)
      setProperty('Black.scale.y',2)
    setProperty('skipCountdown', true)
    setProperty('defaultCamZoom',1.09)
    setProperty('camHUD.alpha', 1)
    setProperty('clock259.alpha', 0)
    setProperty('clock300.alpha', 0)
    setProperty('health', 0.05);
    triggerEvent('Camera Follow Pos','115','115')
end
function onUpdate()
    setPropertyFromGroup('opponentStrums',0,'x','-500')
    setPropertyFromGroup('opponentStrums',1,'x','-500')
    setPropertyFromGroup('opponentStrums',2,'x','-500')
    setPropertyFromGroup('opponentStrums',3,'x','-500')
    setProperty('healthBarDeco.alpha', tonumber(0));
    setProperty('healthBarSleep.alpha', tonumber(1));
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    
    health = getProperty('health')
    if getProperty('health') < 0.025 then
        setProperty('health', health+ 0.035);
    end
end
function opponentNoteHit()
    health = getProperty('health')
        setProperty('health', health + 0.0125);
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
                            "Sleepless Night",
                            "freeplay/sleepless-night",
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
           
           local bruh = io.open('assets/weeks/sleep.json', 'w+')
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
           
           local bruh2 = io.open('assets/weeks/locked-sleep.json', 'w+')
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