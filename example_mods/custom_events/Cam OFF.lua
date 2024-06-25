-- edited by twizinho

function onEvent(name, value1, value2)
    if name == 'Cam OFF' then
        doTweenAlpha('camHUDOff' ,'camHUD', value1, value2, 'linear')
        doTweenAlpha('camGameOff' ,'camGame', value1, value2, 'linear')
    end
end