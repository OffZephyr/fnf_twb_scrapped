local opponentName = 'duo';
local gameOverPass = 'true';

function onEvent(n,v1,v2)
    if n == "borgoricon" then
        
        if v1 == '0' then
            opponentName = 'zephyr'
            setHealthBarColors('170205', 'bf0b5f')
        end
        if v1 == '1' then
            opponentName = 'joehuh'
            setHealthBarColors('e00025', 'bf0b5f')
        end
        if v1 == '2' then
            opponentName = 'duo'
            setHealthBarColors('7a0c1c', 'bf0b5f')
        end
    end
end

iconNames = {
    ['bf-dead'] = 'tasg',
    ['bf'] = 'tasg',
    ['major-dead'] = 'tasg',
    ['major'] = 'tasg',
    ['dad']    = 'zephyr',
    ['zephyr']    = 'zephyr',
    ['joehuh']    = 'joehuh',
    ['duo']    = 'duo',
}
--name of the chars that will have win icons, and names of the icons
--so bf's icons would be named example.png, in this case.
--but really, you can put any name you want in here, and it'll get the icon in that name in the files.
--should be in folders depending on the state
--so bf's win icons would be icons/win/example.png
arrayDad = {
    {'lose', 80, 101},
    {'neutral', 20, 80},
    {'win', 0, 20},
}
arrayBF = {
    {'win', 80, 101},
    {'neutral', 20, 80},
    {'lose', 0, 20},
}
--customize the states.
--first value is the state.
--second and third values are when it should be activated
--so basically, i'm telling the script:
--"bf's win icon should have the winning image from 80% hp to 101% hp" (101 is used because 100 makes the icon glitch at full hp)
opI = false
opP = false
function onCreate()
    setHealthBarColors('7a0c1c', 'bf0b5f')
    makeLuaSprite('winIconDad', nil, 0, 0)
    setObjectCamera('winIconDad', 'camHUD')
    setProperty('winIconDad.visible', true)

    makeLuaSprite('winIconBf', nil, 0, 0)
    setObjectCamera('winIconBf', 'camHUD')
    setProperty('winIconBf.visible', true)
end
function onUpdate()
    luaDebugMode = true
    if iconNames[dadName] and not opI then
        opI = true
    end 
    if not iconNames[dadName] and opI then
        opI = false
    end
    if iconNames[boyfriendName] and not opP then
        opP = true
    end
    if not iconNames[boyfriendName] and opP then
        opP = false
    end
    --win icons should be in mods/images/icons/state, and there should be one icon image per state
end
    function onUpdatePost()
    if opI then
        syncObjs('winIconDad', 'iconP2')
        setProperty('iconP2.visible', false)
        setProperty('winIconDad.visible', true)
        for i = 1, #arrayDad do
            if getHp() > arrayDad[i][2] and getHp() < arrayDad[i][3] then
                if opponentName == 'zephyr' then
                loadGraphic('winIconDad', 'icons/'..arrayDad[i][1]..'/'..iconNames[opponentName])
              end
              if opponentName == 'joehuh' then
                loadGraphic('winIconDad', 'icons/'..arrayDad[i][1]..'/'..iconNames[opponentName])
              end
            if opponentName == 'duo' then
                loadGraphic('winIconDad', 'icons/'..arrayDad[i][1]..'/'..iconNames[opponentName])
            end
            end
        end
    else
        setProperty('winIconDad.visible', false)
        setProperty('iconP2.visible', true)
    end
    if opP then
        syncObjs('winIconBf', 'iconP1')
        setProperty('iconP1.visible', false)
        setProperty('winIconBf.visible', true)
        setProperty('winIconBf.flipX', false)
        for i = 1, #arrayBF do
            if getHp() > arrayBF[i][2] and getHp() < arrayBF[i][3] then
                loadGraphic('winIconBf', 'icons/'..arrayBF[i][1]..'/'..iconNames[boyfriendName])
            end
        end
    else
        setProperty('winIconBf.visible', false)
        setProperty('iconP2.visible', true)
    end
    end
    function onGameOver()
        gameOverPass = 'false'
    end
function getHp()
    if gameOverPass == 'true' then
      return (getProperty('health') / 2) * 100
    else
        return 0
    end
end
function syncObjs(getter, setter)
    setProperty(getter..'.x', getProperty(setter..'.x'))
    setProperty(getter..'.y', getProperty(setter..'.y'))
    setProperty(getter..'.scale.x', getProperty(setter..'.scale.x'))
    setProperty(getter..'.scale.y', getProperty(setter..'.scale.y'))
    setProperty(getter..'.origin.x', getProperty(setter..'.origin.x'))
    setProperty(getter..'.origin.y', getProperty(setter..'.origin.y'))
    setProperty(getter..'.flipX', getProperty(setter..'.flipX'))
    setProperty(getter..'.flipY', getProperty(setter..'.flipY'))
    setProperty(getter..'.width', getProperty(setter..'.width'))
    setProperty(getter..'.height', getProperty(setter..'.height'))
    setProperty(getter..'.angle', getProperty(setter..'.angle'))
    setObjectOrder(getter, getObjectOrder(setter))
end