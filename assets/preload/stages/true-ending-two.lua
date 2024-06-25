function onCreate()

	makeAnimatedLuaSprite('fire', 'backgrounds/fireoverlay', -1500, -600);
	luaSpriteAddAnimationByPrefix('fire', 'fireoverlay', 'fire', 14, true);
	setLuaSpriteScrollFactor('fire', 1.75, 1.75)
    scaleObject('fire', 2.5, 2.5)
	setBlendMode('fire', 'ADD')
	setObjectCamera('fire', 'overlay')

	makeLuaSprite('0t', 'backgrounds/fire0', -350, -200);
	setLuaSpriteScrollFactor('0t', 0.25, 0.25)
    scaleObject('0t', 0.45, 0.45)
	
	makeLuaSprite('3t', 'backgrounds/fire3', -450, -350);
	setLuaSpriteScrollFactor('3t', 0.4, 0.4)
    scaleObject('3t', 0.45, 0.45)
	setBlendMode('3t', 'ADD')
	setObjectCamera('3t', 'overlay')
	
	makeLuaSprite('1t', 'backgrounds/fire1', -500, -425);
	setLuaSpriteScrollFactor('1t', 0.5, 0.5)
    scaleObject('1t', 0.5, 0.5)
	
	makeLuaSprite('2t', 'backgrounds/fire2', -700, -500);
	setLuaSpriteScrollFactor('2t', 0.75, 0.75)
    scaleObject('2t', 0.5, 0.5)
	

	addLuaSprite('0t', false);
	addLuaSprite('3t', false);
	addLuaSprite('1t', false);
	addLuaSprite('2t', false);
	addLuaSprite('fire', true);
	
    setProperty('defaultCamZoom',0.8);

	close(true);
end