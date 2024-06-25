function onCreate()
	
    addCharacterToList('trueendingbf', 'boyfriend')

	makeLuaSprite('0g', 'backgrounds/goodending0', -160, -90);
	setLuaSpriteScrollFactor('0g', 0, 0)
    scaleObject('0g', 0.425, 0.425)
	
	makeLuaSprite('1g', 'backgrounds/goodending1', -220, -140);
	setLuaSpriteScrollFactor('1g', 0.1, 0.1)
    scaleObject('1g', 0.43, 0.43)
	
	makeLuaSprite('25g', 'backgrounds/goodending2,5', -275, -175);
	setLuaSpriteScrollFactor('25g', 0.15, 0.15)
    scaleObject('25g', 0.43, 0.43)

	makeLuaSprite('2g', 'backgrounds/goodending2', -300, -175);
	setLuaSpriteScrollFactor('2g', 0.2, 0.2)
    scaleObject('2g', 0.43, 0.43)
	
	makeLuaSprite('3g', 'backgrounds/goodending3', -490, -245);
	setLuaSpriteScrollFactor('3g', 0.4, 0.4)
    scaleObject('3g', 0.44, 0.44)

	makeLuaSprite('4g', 'backgrounds/goodending4', -750, -390);
	setLuaSpriteScrollFactor('4g', 0.75, 0.75)
    scaleObject('4g', 0.45, 0.45)
	
	makeLuaSprite('5g', 'backgrounds/goodending5', -750, -390);
	setLuaSpriteScrollFactor('5g', 0.85, 0.65)
    scaleObject('5g', 0.45, 0.45)
	
	makeLuaSprite('6g', 'backgrounds/goodending6', -900, -475);
	setLuaSpriteScrollFactor('6g', 1, 0.85)
    scaleObject('6g', 0.465, 0.465)
	
	makeLuaSprite('7g', 'backgrounds/goodending7', -900, -475);
	setLuaSpriteScrollFactor('7g', 1.1, 0.9)
    scaleObject('7g', 0.465, 0.465)
	
	makeLuaSprite('8g', 'backgrounds/goodending8', -900, -600);
	setLuaSpriteScrollFactor('8g', 1.2, 1)
    scaleObject('8g', 1.5, 1.5)
	
	makeLuaSprite('9g', 'backgrounds/goodending9', -1200, -560);
	setLuaSpriteScrollFactor('9g', 1.5, 1.2)
    scaleObject('9g', 0.45, 0.45)
	
	makeLuaSprite('10g', 'backgrounds/goodending10', -1200, -560);
	setLuaSpriteScrollFactor('10g', 1.5, 1.2)
    scaleObject('10g', 0.45, 0.45)
	
	makeLuaSprite('01g', 'backgrounds/goodendingoverlay', -160, -100);
	setLuaSpriteScrollFactor('01g', 0, 0)
    scaleObject('01g', 1, 1)
	setBlendMode('01g', 'OVERLAY')
	
	makeAnimatedLuaSprite('body', 'backgrounds/characters/runBody', 250, 95);
	luaSpriteAddAnimationByPrefix('body', 'runbody', 'RunBody', 30, true);
	setLuaSpriteScrollFactor('body', 1, 1)
    scaleObject('body', 0.6, 0.6)

	makeAnimatedLuaSprite('body_white', 'backgrounds/characters/runBody_white', 250, 95);
	luaSpriteAddAnimationByPrefix('body_white', 'runbody', 'RunBody', 30, true);
	setLuaSpriteScrollFactor('body_white', 1, 1)
    scaleObject('body_white', 0.6, 0.6)
	
	makeAnimatedLuaSprite('arm_white', 'backgrounds/characters/runArm_white', 250, 95);
	luaSpriteAddAnimationByPrefix('arm_white', 'runarm', 'RunArm', 30, true);
	setLuaSpriteScrollFactor('arm_white', 1, 1)
    scaleObject('arm_white', 0.6, 0.6)

	makeAnimatedLuaSprite('arm', 'backgrounds/characters/runArm', 250, 95);
	luaSpriteAddAnimationByPrefix('arm', 'runarm', 'RunArm', 30, true);
	setLuaSpriteScrollFactor('arm', 1, 1)
    scaleObject('arm', 0.6, 0.6)
	
	makeAnimatedLuaSprite('fabricchasing', 'backgrounds/characters/chasingfabric', -850, -475);
	luaSpriteAddAnimationByPrefix('fabricchasing', 'chase', 'fabric', 24, true);
	setLuaSpriteScrollFactor('fabricchasing', 1, 1)
    scaleObject('fabricchasing', 1.4, 1.4)

	makeLuaSprite('wg', 'backgrounds/goodending_white', -950, -300);
	setLuaSpriteScrollFactor('wg', 1, 1)
    scaleObject('wg', 2, 0.45)
	
	makeAnimatedLuaSprite('gradiant', 'backgrounds/run_gradiant', -850, -450);
	luaSpriteAddAnimationByPrefix('gradiant', 'gradiantidle', 'run_gradiant PULSE', 48, false);
	setLuaSpriteScrollFactor('gradiant', 1, 1)
    scaleObject('gradiant', 1.1, 0.9)

	addLuaSprite('gradiant', false);
	addLuaSprite('0g', false);
	addLuaSprite('1g', false);
	addLuaSprite('25g', false);
	addLuaSprite('2g', false);
	addLuaSprite('3g', false);
	addLuaSprite('4g', false);
	addLuaSprite('5g', false);
	addLuaSprite('6g', true);
	addLuaSprite('7g', false);
	addLuaSprite('8g', false);

	addLuaSprite('body', false);
	addLuaSprite('arm', true);
	addLuaSprite('fabricchasing', true);

	addLuaSprite('9g', true);
	addLuaSprite('10g', true);
	addLuaSprite('01g', true);
	addLuaSprite('runoverlay', true);
	addLuaSprite('wg', false);
	addLuaSprite('body_white', false);
	addLuaSprite('arm_white', true);
	addLuaSprite('body_white', false);
	
    setProperty('defaultCamZoom',0.8);

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
	setProperty('gradiant.visible', true);

	close(true);
end