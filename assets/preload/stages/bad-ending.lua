function onCreate()

	makeLuaSprite('0b', 'backgrounds/badending0', -900, -350);
	setLuaSpriteScrollFactor('0b', 0.25, 0.25)
    scaleObject('0b', 0.7, 0.7)
	
	makeLuaSprite('1b', 'backgrounds/badending1', -600, -675);
	setLuaSpriteScrollFactor('1b', 1.25, 1.25)
    scaleObject('1b', 0.6, 0.6)
	
	makeLuaSprite('2b', 'backgrounds/badending2', -1600, -800);
	setLuaSpriteScrollFactor('2b', 1.75, 1.75)
    scaleObject('2b', 0.6, 0.6)

	addLuaSprite('0b', false);
	addLuaSprite('1b', true);
	addLuaSprite('2b', true);
	
    setProperty('defaultCamZoom',0.6);

	close(true);
end