function onEvent(name, value1, value2)
	if name == 'BorgorSunsetPpl' then
		doTweenAlpha('daypplbg','1bo',0,6,'linear')
		doTweenAlpha('sunsetpplbg','1bosunset',1,5,'linear')
		doTweenAlpha('dayppl','2bo',0,6,'linear')
		doTweenAlpha('sunsetppl','2bosunset',1,5,'linear')
	end
end