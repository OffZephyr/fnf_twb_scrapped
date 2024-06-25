function onCreate()
makeLuaSprite('sl0', 'backgrounds/newslowly0', -400, -200);
setLuaSpriteScrollFactor('sl0', 0.2, 0.2)
scaleObject("sl0", 0.7, 0.7)

makeLuaSprite('sl1', 'backgrounds/newslowly1', -400, -200);
setLuaSpriteScrollFactor('sl1', 0.4, 0.4)
scaleObject("sl1", 0.7, 0.7)

makeLuaSprite('sl2', 'backgrounds/newslowly2', -400, -200);
setLuaSpriteScrollFactor('sl2', 0.6, 0.6)
scaleObject("sl2", 0.7, 0.7)

makeLuaSprite('sl25', 'backgrounds/newslowly2_5', 175, -1200);
setLuaSpriteScrollFactor('sl25', 0.9, 0.9)
scaleObject("sl25", 1, 1)

makeLuaSprite('sl3', 'backgrounds/newslowly3', -400, -200);
setLuaSpriteScrollFactor('sl3', 1.2, 1.2)
scaleObject("sl3", 0.7, 0.7)

makeLuaSprite('sl4', 'backgrounds/newslowly4', -450, -200);
setLuaSpriteScrollFactor('sl4', 1.5, 1.5)
scaleObject("sl4", 0.6, 0.7)

makeLuaSprite('sl5', 'backgrounds/newslowly5', -400, -200);
setLuaSpriteScrollFactor('sl5', 0, 0)
scaleObject("sl5", 0.6, 0.6)

setBlendMode('sl5', 'LIGHTEN')

addLuaSprite('sl0', false);
addLuaSprite('sl1', false);
addLuaSprite('sl2', false);
addLuaSprite('sl25', false);
addLuaSprite('sl3', true);
addLuaSprite('sl4', true);
--addLuaSprite('sl5', true);

end
