package states;

#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end

import objects.AttachedSprite;

class CreditsStateFunkin extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:FlxColor;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;

	var offsetThing:Float = -75;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('menuDesatOld'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		add(bg);
		bg.screenCenter();
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		for (mod in Mods.parseList().enabled) pushModCreditsToList(mod);
		#end

		var defaultList:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			["Funkin' Crew"],
			['ninjamuffin99',		'psych/ninjamuffin99',	"Programmer of Friday Night Funkin'",							'https://twitter.com/ninja_muffin99',	'CF2D2D'],
			['PhantomArcade',		'psych/phantomarcade',	"Animator of Friday Night Funkin'",								'https://twitter.com/PhantomArcade3K',	'FADC45'],
			['evilsk8r',			'psych/evilsk8r',			"Artist of Friday Night Funkin'",								'https://twitter.com/evilsk8r',			'5ABD4B'],
			['kawaisprite',			'psych/kawaisprite',		"Composer of Friday Night Funkin'",								'https://twitter.com/kawaisprite',		'378FC7'],
			[' ',			'empty',		"",								'',		'FFFFFF'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'444444'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			["Wow you found it !"],
			[' ',			'empty',		"",								'',		'FFFFFF'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'444444'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'FFFFFF'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'444444'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'FFFFFF'],
			["Keep going"],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'444444'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'FFFFFF'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'444444'],
			[' ',			'empty',		"",								'',		'555555'],
			["Don't give up !!"],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'FFFFFF'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'444444'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'FFFFFF'],
			["You're getting closer"],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'444444'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'FFFFFF'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'444444'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'FFFFFF'],
			[' ',			'empty',		"",								'',		'EEEEEE'],
			[' ',			'empty',		"",								'',		'DDDDDD'],
			[' ',			'empty',		"",								'',		'CCCCCC'],
			[' ',			'empty',		"",								'',		'BBBBBB'],
			[' ',			'empty',		"",								'',		'AAAAAA'],
			[' ',			'empty',		"",								'',		'999999'],
			[' ',			'empty',		"",								'',		'888888'],
			[' ',			'empty',		"",								'',		'777777'],
			[' ',			'empty',		"",								'',		'666666'],
			[' ',			'empty',		"",								'',		'555555'],
			[' ',			'empty',		"",								'',		'444444'],
			[' ',			'secret_song/a-corrupted-duel',		"Who is the real one ?",								'hehehehaw',		'333333']
		];
		
		for(i in defaultList) {
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(FlxG.width / 2, 300, creditsStuff[i][0], !isSelectable);
			optionText.isMenuItem = true;
			optionText.targetY = i;
			optionText.changeX = false;
			optionText.snapToPosition();
			grpOptions.add(optionText);

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Mods.currentModDirectory = creditsStuff[i][5];
				}

				var str:String = 'credits/missing_icon';
				if (Paths.image('credits/' + creditsStuff[i][1]) != null) str = 'credits/' + creditsStuff[i][1];
				var icon:AttachedSprite = new AttachedSprite(str);
				if(creditsStuff[i][1] == "secret_song/a-corrupted-duel")
					{
								icon.xAdd = -275;
								icon.yAdd = -250;
					}
					else
						{
						icon.xAdd = optionText.width + 10;
						}
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
				Mods.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
			else optionText.alignment = CENTERED;
		}
		
		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, FlxG.height + offsetThing - 25, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		bg.color = CoolUtil.colorFromString(creditsStuff[curSelected][4]);
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(shiftMult);
					holdTime = 0;
				}

				if(controls.UI_DOWN || controls.UI_UP)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					}
				}
			}

			if(controls.ACCEPT && (creditsStuff[curSelected][3] == null || creditsStuff[curSelected][3].length > 4)) {
				
				if(creditsStuff[curSelected][1] == "secret_song/a-corrupted-duel")
					{
					PlayState.SONG = backend.Song.loadFromJson('a-corrupted-duel', 'a-corrupted-duel');
					PlayState.isStoryMode = true;
					PlayState.storyDifficulty = 1;

					PlayState.storyWeek = 0;
					LoadingState.loadAndSwitchState(new PlayState(), true);
					FreeplayState.destroyFreeplayVocals();
					}
				else
				{
					CoolUtil.browserLoad(creditsStuff[curSelected][3]);
				}
			}
			if (controls.BACK)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new CreditsState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.bold)
			{
				var lerpVal:Float = FlxMath.bound(elapsed * 12, 0, 1);
				if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					item.screenCenter(X);
					item.x = FlxMath.lerp(lastX, item.x - 70, lerpVal);
				}
				else
				{
					item.x = FlxMath.lerp(item.x, 200 + -40 * Math.abs(item.targetY), lerpVal);
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = 4;
			if (curSelected >= creditsStuff.length)
				curSelected = 195;
		} while(unselectableCheck(curSelected));

		var newColor:FlxColor = CoolUtil.colorFromString(creditsStuff[curSelected][4]);
		trace('The BG color is: $newColor');
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.y = FlxG.height - descText.height + offsetThing - 60;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});

		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();
	}

	#if MODS_ALLOWED
	function pushModCreditsToList(folder:String)
	{
		var creditsFile:String = null;
		if(folder != null && folder.trim().length > 0) creditsFile = Paths.mods(folder + '/data/credits.txt');
		else creditsFile = Paths.mods('data/credits.txt');

		if (FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for(i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if(arr.length >= 5) arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
	}
	#end

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}