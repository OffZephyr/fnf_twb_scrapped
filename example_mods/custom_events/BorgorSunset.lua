function onEvent(name, value1, value2)
	if name == 'BorgorSunset' then
		doTweenAlpha('healthbar','healthBarBorgorEvening',tonumber(1),30,'linear')
		doTweenAlpha('sunset','0bo2',1,30,'linear')
			doTweenAlpha('sunset','0bo2',1,30,'linear')
			doTweenAlpha('tint','Orange',0.6,30,'linear')
			doTweenY('sunmove','sun',1000,80,'linear')
			doTweenY('moonmove','moon',-120,90,'linear')
	end
end