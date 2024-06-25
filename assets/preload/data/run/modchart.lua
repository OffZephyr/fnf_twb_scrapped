
function onUpdate()
	currentBeat = (getSongPosition()/1000) * (bpm/60)
 if curStep > 0 and curStep < 1152 then
	doTweenX("funnyX", "camHUD",-math.sin(currentBeat * 0.5) * 20, 0.001)
	doTweenAngle("funnyAngle", "camHUD",-math.sin(currentBeat * 0.5) * 2.5, 0.001)
	doTweenY("funnyY", "camHUD",math.cos(currentBeat * 0.5) * 20, 0.001)
 elseif curStep > 1152 and curStep < 1664 then
	doTweenX("funnyX", "camHUD",-math.sin(currentBeat * 0.25) * 20, 0.001)
	doTweenAngle("funnyAngle", "camHUD",-math.sin(currentBeat * 0.25) * 2.5, 0.001)
	doTweenY("funnyY", "camHUD",math.cos(currentBeat * 0.25) * 20, 0.001)
elseif curStep > 1664 and curStep < 2177 then
	doTweenX("funnyX", "camHUD",-math.sin(currentBeat * 1.75) * 20, 0.001)
	doTweenAngle("funnyAngle", "camHUD",-math.sin(currentBeat * 1.75) * 2.5, 0.001)
	doTweenY("funnyY", "camHUD",math.cos(currentBeat * 1.75) * 20, 0.001)
elseif curStep == 2177 then
	doTweenX("funnyX", "camHUD",0, 1,"backout")
	doTweenAngle("funnyAngle", "camHUD",0, 1,"backout")
	doTweenY("funnyY", "camHUD",0, 1,"backout")
 end
end