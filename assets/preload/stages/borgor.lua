function onCreate()

	makeLuaSprite('0bo', 'backgrounds/borgorskyday', -450, -250);
	setLuaSpriteScrollFactor('0bo', 0, 0)
    scaleObject('0bo', 1, 1)
	
	makeLuaSprite('0bo2', 'backgrounds/borgorskysunset', -450, -250);
	setLuaSpriteScrollFactor('0bo2', 0, 0)
    scaleObject('0bo2', 1, 1)

	makeAnimatedLuaSprite('0bo3', 'backgrounds/borgorskynight', -450, -250);
	luaSpriteAddAnimationByPrefix('0bo3', 'borgorskynight', 'borgor_skynight', 30, true);
	setLuaSpriteScrollFactor('0bo3', 0, 0)
    scaleObject('0bo3', 1, 1)

	makeLuaSprite('sun', 'backgrounds/borgorsun', 1200, -100);
	setLuaSpriteScrollFactor('sun', 0, 0)
    scaleObject('sun', 0.4, 0.4)
	
	makeLuaSprite('moon', 'backgrounds/borgormoon', -180, 600);
	setLuaSpriteScrollFactor('moon', 0, 0)
    scaleObject('moon', 0.4, 0.4)
	
	makeLuaSprite('1bo', 'backgrounds/borgor0', -255, -175);
	setLuaSpriteScrollFactor('1bo', 0.48, 0.5)
    scaleObject('1bo', 1, 1)
	
	makeLuaSprite('1bosunset', 'backgrounds/borgorpplbgsunset', -255, -175);
	setLuaSpriteScrollFactor('1bosunset', 0.48, 0.5)
    scaleObject('1bosunset', 1, 1)
	
	makeLuaSprite('1bonight', 'backgrounds/borgorpplbgnight', -255, -175);
	setLuaSpriteScrollFactor('1bonight', 0.48, 0.5)
    scaleObject('1bonight', 1, 1)

	makeLuaSprite('2bo', 'backgrounds/borgor1', -255, -175);
	setLuaSpriteScrollFactor('2bo', 0.48, 0.5)
    scaleObject('2bo', 1, 1)

	makeLuaSprite('2bosunset', 'backgrounds/borgorpplsunset', -255, -175);
	setLuaSpriteScrollFactor('2bosunset', 0.48, 0.5)
    scaleObject('2bosunset', 1, 1)

	makeLuaSprite('2bonight', 'backgrounds/borgorpplnight', -255, -175);
	setLuaSpriteScrollFactor('2bonight', 0.48, 0.5)
    scaleObject('2bonight', 1, 1)

	makeLuaSprite('3bo', 'backgrounds/borgor2', -250, -175);
	setLuaSpriteScrollFactor('3bo', 0.5, 0.5)
    scaleObject('3bo', 1, 1)

	makeLuaSprite('4bo', 'backgrounds/borgor3', -250, -175);
	setLuaSpriteScrollFactor('4bo', 0.6, 0.6)
    scaleObject('4bo', 1, 1)

	makeLuaSprite('5bo', 'backgrounds/borgor4', -220, -175);
	setLuaSpriteScrollFactor('5bo', 0.65, 0.65)
    scaleObject('5bo', 1, 1)

	makeLuaSprite('bobu2', 'backgrounds/borgorbush2', -220, -175);
	setLuaSpriteScrollFactor('bobu2', 0.6, 0.7)
    scaleObject('bobu2', 1, 1)

	makeLuaSprite('bobu', 'backgrounds/borgorbush', -220, -175);
	setLuaSpriteScrollFactor('bobu', 0.7, 0.7)
    scaleObject('bobu', 1, 1)

	makeLuaSprite('6bo', 'backgrounds/borgor5', -250, -155);
	setLuaSpriteScrollFactor('6bo', 0.7, 0.7)
    scaleObject('6bo', 1, 1)

	makeLuaSprite('wh', 'backgrounds/characters/Wheelchair', -15, 110);
	setLuaSpriteScrollFactor('wh', 1, 1)
    scaleObject('wh', 0.41, 0.41)

	makeAnimatedLuaSprite('natsitu', 'backgrounds/characters/natsitu', -600, 620);
	luaSpriteAddAnimationByPrefix('natsitu', 'natsitu', 'walkin', 10, true);
	setLuaSpriteScrollFactor('natsitu', 0.7, 0.7)
    scaleObject('natsitu', 0.5, 0.5)

	makeAnimatedLuaSprite('lemon', 'backgrounds/characters/lemon', 1450, 590);
	luaSpriteAddAnimationByPrefix('lemon', 'lemon', 'lemon walkin', 10, true);
	setLuaSpriteScrollFactor('lemon', 0.7, 0.7)
    scaleObject('lemon', 0.5, 0.5)

	makeAnimatedLuaSprite('yumi', 'backgrounds/characters/yumi', -650, 580);
	luaSpriteAddAnimationByPrefix('yumi', 'yumi', 'yumi walkin', 10, true);
	setLuaSpriteScrollFactor('yumi', 0.7, 0.7)
    scaleObject('yumi', 0.5, 0.5)

	makeAnimatedLuaSprite('diamonddev', 'backgrounds/characters/diamonddev', 1450, 540);
	luaSpriteAddAnimationByPrefix('diamonddev', 'diamonddev', 'diamonddev walkin', 4, true);
	setLuaSpriteScrollFactor('diamonddev', 0.7, 0.7)
    scaleObject('diamonddev', 0.5, 0.5)

	makeAnimatedLuaSprite('awe', 'backgrounds/characters/awe', -650, 540);
	luaSpriteAddAnimationByPrefix('awe', 'awe', 'awe walkin', 5, true);
	setLuaSpriteScrollFactor('awe', 0.7, 0.7)
    scaleObject('awe', 0.5, 0.5)

	makeAnimatedLuaSprite('tom', 'backgrounds/characters/tom', 1450, 540);
	luaSpriteAddAnimationByPrefix('tom', 'tom', 'tom walkin', 5, true);
	setLuaSpriteScrollFactor('tom', 0.7, 0.7)
    scaleObject('tom', 0.5, 0.5)

	makeAnimatedLuaSprite('ryo', 'backgrounds/characters/ryo', -650, 560);
	luaSpriteAddAnimationByPrefix('ryo', 'ryo', 'ryo walkin', 5, true);
	setLuaSpriteScrollFactor('ryo', 0.7, 0.7)
    scaleObject('ryo', 0.5, 0.5)



	addLuaSprite('0bo', false);
	addLuaSprite('0bo2', false);
	addLuaSprite('0bo3', false);
	addLuaSprite('sun', false);
	addLuaSprite('moon', false);
	addLuaSprite('1bo', false);
	addLuaSprite('1bosunset', false);
	addLuaSprite('1bonight', false);
	addLuaSprite('2bo', false);
	addLuaSprite('2bosunset', false);
	addLuaSprite('2bonight', false);
	addLuaSprite('3bo', false);
	addLuaSprite('3bolight', false);
	addLuaSprite('4bo', false);
	addLuaSprite('5bo', false);
	addLuaSprite('bobu2', false);
	addLuaSprite('bobu', false);
	addLuaSprite('6bo', false);

	addLuaSprite('natsitu', false);
	addLuaSprite('lemon', false);
	addLuaSprite('diamonddev', false);
	addLuaSprite('awe', false);
	addLuaSprite('tom', false);
	addLuaSprite('ryo', false);
	addLuaSprite('yumi', false);

	addLuaSprite('wh', false);
	
    setProperty('defaultCamZoom',0.8);

	close(true);
end