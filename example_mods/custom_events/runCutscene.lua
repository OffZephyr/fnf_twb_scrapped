function onEvent(name, value1, value2)
	if name == 'runCutscene' then
		if value1 == '0' then
		elseif value1 == '1' then
			setProperty('health', 100);
			makeLuaSprite('Black', '', 0, 0);
			makeGraphic('Black',1280,720,'000000')
			  addLuaSprite('Black', true);
			  setLuaSpriteScrollFactor('Black',0,0)
			  setProperty('Black.scale.x',2)
			  setProperty('Black.scale.y',2)
			  setProperty('camHUD.alpha', 0)
				if getProperty('songMisses') >= 15 then
					startVideo('run_end2');
					setProperty('inCutscene', false);
				else
					startVideo('run_end1');
					setProperty('inCutscene', false);
				end
				return Function_Continue
			end
		end
	end