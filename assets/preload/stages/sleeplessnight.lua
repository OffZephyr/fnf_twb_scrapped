function onCreate()
	
	makeLuaSprite('back', 'backgrounds/sleeplessnight', -500, -220);
	setLuaSpriteScrollFactor('back', 1, 1)
	addLuaSprite('back', 'false');
    scaleObject('back', 1, 1)

	makeLuaSprite('clock', 'backgrounds/sleeplessnightclock', -845, 75);
	setLuaSpriteScrollFactor('clock', 1, 1)
	addLuaSprite('clock', true);
    scaleObject('clock', 0.20, 0.20)

	makeLuaSprite('clock258', 'backgrounds/sleeplessnightclock258', -845, 75);
	setLuaSpriteScrollFactor('clock258', 1, 1)
	addLuaSprite('clock258', true);
    scaleObject('clock258', 0.20, 0.20)

	makeLuaSprite('clock259', 'backgrounds/sleeplessnightclock259', -845, 75);
	setLuaSpriteScrollFactor('clock259', 1, 1)
	addLuaSprite('clock259', true);
    scaleObject('clock259', 0.20, 0.20)
	
	makeLuaSprite('clock300', 'backgrounds/sleeplessnightclock300', -845, 75);
	setLuaSpriteScrollFactor('clock300', 1, 1)
	addLuaSprite('clock300', true);
    scaleObject('clock300', 0.20, 0.20)

	makeAnimatedLuaSprite('gf', 'backgrounds/sleeplessnightgf', -270, -105);
	luaSpriteAddAnimationByPrefix('gf', 'GF Base', 'GF Base', 15, true);
	setLuaSpriteScrollFactor('gf', 1, 1)
	addLuaSprite('gf', 'false');
    scaleObject('gf', 0.8, 0.8)
	
    setProperty('defaultCamZoom',1.09);

	close(true);
end