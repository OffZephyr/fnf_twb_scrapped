

function onEvent(name, value1, value2)
	if name == 'BFFaint' then
		if value1 == 'true' then
			doTweenY('MoveY', 'boyfriend', 500, 0.75, 'smoothStepIn')
			doTweenX('MoveX', 'boyfriend', -700, 0.75, 'smoothStepIn')
			doTweenAngle('Rotate', 'boyfriend', -90, 0.75, 'smoothStepIn')
			
		elseif value1 == 'false' then
		setProperty('Black.visible', true)
			end
		end
	end