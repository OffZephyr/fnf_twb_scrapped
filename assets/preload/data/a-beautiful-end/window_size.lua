function onCreatePost()
end
 
function onDestroy()
    addHaxeLibrary('FlxG','flixel')
    addHaxeLibrary('Lib','openfl')
    addHaxeLibrary('RatioScaleMode', 'flixel.system.scaleModes')
    addHaxeLibrary('BaseScaleMode', 'flixel.system.scaleModes')
    runHaxeCode([[
        Lib.application.window.resizable = true;
        FlxG.scaleMode = new RatioScaleMode();
        FlxG.resizeGame(1280, 720);
        FlxTween.tween(Lib.application.window, {x: 110}, 0.25, {ease: FlxEase.quadInOut});
        FlxTween.tween(Lib.application.window, {height: 720}, 0.25, {ease: FlxEase.quadInOut});
        FlxTween.tween(Lib.application.window, {width: 1280}, 0.25, {ease: FlxEase.quadInOut});
    ]])
end