function onEvent(name, value1, value2)
	if name == 'runBlackOut' then
		if value1 == 'true' then
			makeLuaSprite('BlackFlash', '', 0, 0);
			makeGraphic('BlackFlash',1280,720,'000000')
			  addLuaSprite('BlackFlash', true);
			  setLuaSpriteScrollFactor('BlackFlash',0,0)
			  setProperty('BlackFlash.scale.x',2)
			  setProperty('BlackFlash.scale.y',2)
		setProperty('BlackFlash.visible', true)
		elseif value1 == 'false' then
			doTweenAlpha('blTw','BlackFlash',0,5,'linear')
			doTweenAlpha('hudFadeEventTween', 'camHUD', 1, 5, 'linear');
			end
		end
	end