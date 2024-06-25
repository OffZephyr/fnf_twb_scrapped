

function onEvent(name, value1, value2)
	if name == 'GFReveal' then
		if value1 == 'true' then
		doTweenAlpha('flTw2','1t',1,5,'linear')
			doTweenY('MoveY', 'dad', -375, 8, 'smoothStepOut')
			doTweenAlpha('gficonfade', 'iconP2', 1, 10, 'linear');
			
		elseif value1 == 'false' then
		setProperty('Black.visible', true)
			end
		end
	end