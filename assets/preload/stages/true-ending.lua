function onCreate()
	
    addCharacterToList('trueendingbf', 'boyfriend')

	makeLuaSprite('0t', 'backgrounds/trueending0', -350, -200);
	setLuaSpriteScrollFactor('0t', 0.25, 0.25)
    scaleObject('0t', 0.45, 0.45)
	
	makeLuaSprite('1t', 'backgrounds/trueending1', -0, 0);
	setLuaSpriteScrollFactor('1b', 1.25, 1.25)
    scaleObject('1t', 0.335, 0.335)
	setObjectCamera('1t', 'hud')
	
	makeAnimatedLuaSprite('2t', 'backgrounds/fireoverlay', -1500, -600);
	luaSpriteAddAnimationByPrefix('2t', 'fireoverlay', 'fire', 14, true);
	setLuaSpriteScrollFactor('2t', 1.75, 1.75)
    scaleObject('2t', 2.5, 2.5)
	setBlendMode('2t', 'ADD')
	setObjectCamera('2t', 'overlay')

	addLuaSprite('0t', false);
	addLuaSprite('1t', true);
	addLuaSprite('2t', true);
	
    setProperty('defaultCamZoom',0.8);
	
	makeLuaSprite('0t2', 'backgrounds/fire0', -350, -200);
	setLuaSpriteScrollFactor('0t2', 0.25, 0.25)
    scaleObject('0t2', 0.45, 0.45)
	
	makeLuaSprite('1t2', 'backgrounds/fire1', -500, -425);
	setLuaSpriteScrollFactor('1t2', 0.5, 0.5)
    scaleObject('1t2', 0.5, 0.5)
	
	makeLuaSprite('2t2', 'backgrounds/fire2', -700, -500);
	setLuaSpriteScrollFactor('2t2', 0.75, 0.75)
    scaleObject('2t2', 0.5, 0.5)
	
	makeLuaSprite('3t2', 'backgrounds/fire3', -1500, -800);
	setLuaSpriteScrollFactor('3t2', 2, 2)
    scaleObject('3t2', 0.45, 0.45)
	setBlendMode('3t2', 'ADD')
	setObjectCamera('3t2', 'overlay')
	

	addLuaSprite('0t2', false);
	addLuaSprite('3t2', true);
	addLuaSprite('1t2', false);
	addLuaSprite('2t2', false);

	setProperty('0t2.visible', true);
	setProperty('1t2.visible', true);
	setProperty('2t2.visible', true);
	setProperty('3t2.visible', true);
    setProperty('0t.visible', false);
    setProperty('1t.visible', true);
    setProperty('2t.visible', true);
	setProperty('1t.alpha',0)

	close(true);
end