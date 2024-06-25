function onEvent(name, value1, value2)
	if name == 'BlackFade' then
		if value1 == 'true' then
			setProperty('Black.alpha',0)
		  setProperty('Black.alpha',1)
		  doTweenAlpha('blTw','Black',0,10,'linear')
		elseif value1 == 'false' then
		setProperty('Black.visible', true)
	elseif value1 == 'hangingend' then
	  doTweenAlpha('blTw','Black',1,0.75,'linear')
		elseif value1 == 'fireend' then
		  doTweenAlpha('blTw','Black',1,2,'linear')
			elseif value1 == 'slowlyend' then
			  doTweenAlpha('blTw','Black',1,10,'linear')
					end
		end
	end