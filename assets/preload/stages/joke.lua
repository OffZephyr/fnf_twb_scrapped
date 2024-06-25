function onCreate()

	makeLuaSprite('4b', 'backgrounds/joke4', -700, -400);
	setLuaSpriteScrollFactor('4b', 0, 0)
    scaleObject('4b', 1.5, 1.5)

	makeLuaSprite('3b', 'backgrounds/joke3', -500, -150);
	setLuaSpriteScrollFactor('3b', 0.5, 0.5)
    scaleObject('3b', 1, 1)

	makeLuaSprite('2b', 'backgrounds/joke2', -750, -500);
	setLuaSpriteScrollFactor('2b', 1, 1)
    scaleObject('2b', 1.75, 1.75)
	
	makeLuaSprite('1b', 'backgrounds/joke1', -200, -250);
	setLuaSpriteScrollFactor('1b', 1.25, 1.25)
    scaleObject('1b', 1.5, 1.5)
	
	makeLuaSprite('0b', 'backgrounds/joke0', -600, -300);
	setLuaSpriteScrollFactor('0b', 1.5, 1.5)
    scaleObject('0b', 1.7, 1.7)
	
	makeAnimatedLuaSprite('glitch0', 'backgrounds/glitch-idle', -350, 200);
	luaSpriteAddAnimationByPrefix('glitch0', 'idle', 'glitch-idle idle', 12, true);
	setLuaSpriteScrollFactor('glitch0', 1, 1)
    scaleObject('glitch0', 0.7, 0.7)

	addLuaSprite('4b', false);
	addLuaSprite('3b', false);
	addLuaSprite('2b', false);
	addLuaSprite('1b', true);
	addLuaSprite('0b', true);
	addLuaSprite('glitch0', true);
	
    setProperty('defaultCamZoom',0.6);

	close(true);
end