function onCreate()
	
	makeLuaSprite('0f', 'backgrounds/fabric0', -750, -450);
	setLuaSpriteScrollFactor('0f', 0, 0)
	addLuaSprite('0f', 'false');
    scaleObject('0f', 0.75, 0.75)
	
	makeLuaSprite('1f', 'backgrounds/fabric1', -725, -350);
	setLuaSpriteScrollFactor('1f', 0.1, 0.1);
	addLuaSprite('1f', 'false');
    scaleObject('1f', 0.75, 0.75)
	
	makeLuaSprite('2f', 'backgrounds/fabric2', -875, -425);
	setLuaSpriteScrollFactor('2f', 0.25, 0.25);
	addLuaSprite('2f', 'false');
    scaleObject('2f', 0.75, 0.75)
	
	makeLuaSprite('3f', 'backgrounds/fabric3', -1250, -425);
	setLuaSpriteScrollFactor('3f', 1.2, 1.2);
	addLuaSprite('3f', 'false');
    scaleObject('3f', 0.75, 0.75)
	
	makeLuaSprite('4f', 'backgrounds/fabric4', -1150, -450);
	setLuaSpriteScrollFactor('4f', 1.1, 1.1);
	addLuaSprite('4f', 'false');
    scaleObject('4f', 0.75, 0.75)
	
	makeLuaSprite('5f', 'backgrounds/fabric5', -1000, -475);
	setLuaSpriteScrollFactor('5f', 0.9, 0.9);
	addLuaSprite('5f', 'false');
    scaleObject('5f', 0.65, 0.65)
	
    setProperty('defaultCamZoom',0.5);

	close(true);
end