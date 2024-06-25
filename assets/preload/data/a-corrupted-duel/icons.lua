iconNames = {
    ['jokeGF-dead'] = 'jokefabric',
    ['jokegf'] = 'jokefabric',
    ['pibby-GF']    = 'jokepibby',
    ['dad']    = 'jokepibby'
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
    makeLuaSprite('winIconDad', nil, 0, 0)
    setObjectCamera('winIconDad', 'camHUD')
    setProperty('winIconDad.visible', true)
    setProperty('iconP2.visible', false)

    makeLuaSprite('winIconBf', nil, 0, 0)
    setObjectCamera('winIconBf', 'camHUD')
    setProperty('winIconBf.visible', true)
    setProperty('iconP2.visible', false)
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
                loadGraphic('winIconDad', 'icons/'..arrayDad[i][1]..'/'..iconNames[dadName])
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
function getHp()
      return (getProperty('health') / 2) * 100
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