function onCreatePost()

  runHaxeCode([[

    game.initLuaShader('distort');
    shader0 = game.createRuntimeShader('distort');
    game.camHUD.setFilters([new ShaderFilter(shader0)]);

    resetCamCache = function(?spr){
      if (spr == null || spr.filters == null) return;
      spr.__cacheBitmap = null;
      spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
      spr.__cacheBitmapColorTransform = null;
    }
    shader0.setFloat('amount', -0.25);
    fixShaderCoordFix = function(?_){
      resetCamCache(game.camGame.flashSprite);
      resetCamCache(game.camHUD.flashSprite);
      resetCamCache(game.camOther.flashSprite);
    }
    FlxG.signals.gameResized.add(fixShaderCoordFix);
    fixShaderCoordFix();

  ]]);

end