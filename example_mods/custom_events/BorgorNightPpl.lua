function onEvent(name, value1, value2)
	if name == 'BorgorNightPpl' then
		doTweenAlpha('sunset2pplbg','1bosunset',0,6,'linear')
		doTweenAlpha('nightpplbg','1bonight',1,5,'linear')
		doTweenAlpha('sunset2ppl','2bosunset',0,6,'linear')
		doTweenAlpha('nightppl','2bonight',1,5,'linear')
		doTweenAlpha('lights2','6bolight',0.8,0.1,'linear')
	end
end