function onEvent(name, value1, value2)
	if name == "stage change" then
        if value1 == "1" then
			setProperty('0t2.visible', true);
			setProperty('1t2.visible', true);
			setProperty('2t2.visible', true);
			setProperty('3t2.visible', true);
			setProperty('0t.visible', false);
			setProperty('2t.visible', true);
			setProperty('boyfriend.x', 100)
			setProperty('boyfriend.y', -100)
			setProperty('dad.x', -775)
			setProperty('dad.y', -500)
        else if value1 == "2" then
			makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'ffffff')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,5,'linear')
		setProperty('1t.alpha',0)
		doTweenAlpha('flTw2','1t',1,5,'linear')
			setProperty('0t2.visible', false);
			setProperty('1t2.visible', false);
			setProperty('2t2.visible', false);
			setProperty('3t2.visible', false);
			setProperty('0t.visible', true);
			setProperty('1t.visible', true);
			setProperty('2t.visible', true);
			setProperty('boyfriend.x', -350)
			setProperty('boyfriend.y', -325)
			setProperty('dad.x', -1500)
			setProperty('dad.y', -500)
        end
		end
	end
end