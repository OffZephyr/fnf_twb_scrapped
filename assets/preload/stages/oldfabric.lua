function onCreate()
	
	makeLuaSprite('back', 'bg', -650, -500);
	setLuaSpriteScrollFactor('back', 0, 0)
	addLuaSprite('back', 'false');
    scaleObject('back', 1.1, 1.1)
	
	makeLuaSprite('front', 'fg', -800, -500);
	setLuaSpriteScrollFactor('front', 0.2, 0.2);
	addLuaSprite('front', 'false');
    scaleObject('front', 1.2, 1.2)
	
    setProperty('defaultCamZoom',0.5);

	close(true);
end