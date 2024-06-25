function onEvent(name, value1, value2)
	if name == 'BorgorNight' then
		doTweenAlpha('healthbar','healthBarBorgorNight',tonumber(1),30,'linear')
			doTweenAlpha('night','0bo3',1,30,'linear')
			doTweenAlpha('tint2','Orange',0,30,'linear')
			doTweenAlpha('tint3','Black',0.4,30,'linear')
			doTweenAlpha('lights1','3bolight',1,30,'linear')
	end
end