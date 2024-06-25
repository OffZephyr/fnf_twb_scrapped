function onBeatHit()
    if curBeat == 1 then
        doTweenY("epicTween", "boyfriend", -38, 0.2, "cubeInOut")
        doTweenY("epicTween2", "dad", -37, 0.2, "cubeInOut")
        doTweenY("epicTween3", "body", 95, 0.2, "cubeInOut")
        doTweenY("epicTween4", "arm", 95, 0.2, "cubeInOut")
        doTweenY("epicTween5", "body_white", 95, 0.2, "cubeInOut")
        doTweenY("epicTween6", "arm_white", 95, 0.2, "cubeInOut")
    end
end

function onTweenCompleted(epicTween)
    if getProperty("boyfriend.y") == -38 then
        doTweenY("epicTween", "boyfriend", -25, 0.2, "cubeInOut")
        doTweenY("epicTween2", "dad", -24, 0.2, "cubeInOut")
        doTweenY("epicTween3", "body", 107, 0.2, "cubeInOut")
        doTweenY("epicTween4", "arm", 107, 0.2, "cubeInOut")
        doTweenY("epicTween5", "body_white", 107, 0.2, "cubeInOut")
        doTweenY("epicTween6", "arm_white", 107, 0.2, "cubeInOut")
    elseif getProperty("boyfriend.y") == -25 then
        doTweenY("epicTween", "boyfriend", -38, 0.2, "cubeInOut")
        doTweenY("epicTween2", "dad", -37, 0.2, "cubeInOut")
        doTweenY("epicTween3", "body", 95, 0.2, "cubeInOut")
        doTweenY("epicTween4", "arm", 95, 0.2, "cubeInOut")
        doTweenY("epicTween5", "body_white", 95, 0.2, "cubeInOut")
        doTweenY("epicTween6", "arm_white", 95, 0.2, "cubeInOut")
    end
end