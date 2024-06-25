package states;

#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;
import openfl.utils.Assets as OpenFlAssets;
import tjson.TJSON as Json;

import objects.AttachedSprite;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];
	var creditsOrder:Array<Array<String>> = [
		["joe", "zeph", "major"],
		["sunny", "slylin", "natsitu"],
		["awe", "gumvy", "timson"],
		["dzub", "untold", "seonne"],
		["tom", "givaller", "dd"],
		["mango", "xero", "other"],
	];

	var bg:FlxSprite;
	var descText:FlxText;
	var linkText:FlxText;
	var credText:FlxText;
	var intendedColor:FlxColor;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;
	var linkBox:AttachedSprite;
	var credBox:AttachedSprite;
	var over:FlxSprite;
	var icon2:FlxSprite;

	var offsetThing:Float = 50;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('credits/background/creditsBG'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		add(bg);
		bg.screenCenter();
		bg.setGraphicSize(Std.int(bg.width * 1));
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		for (mod in Mods.parseList().enabled) pushModCreditsToList(mod);
		#end

		var defaultList:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			['',					'empty',			'<3',																							'',																		'000000'],
			[''],
			[''],
			['The team'],
			['TheArtStudioGuy',		'theartstudioguy',	'door yummy',																					'https://youtube.com/channel/UC-N-0piSRBtqaHmemrkoiCg',					'F50B0B'],
			['Zephyr',			    'zephyr',			"Woah, I didn't know the person reading this would be so...   Beautiful~",						'https://zephyr1.carrd.co',												'f98aee'],
			['JOEhuh02',		    'joehuh',			':sobEmoji: :sobEmoji: :sobEmoji: my device is dying thank you!',								'https://linktr.ee/joehuh02',											'ff5261'],
			['SunnyJay',		    'sunnyjay',			'Im not real :)',																					'https://www.youtube.com/@Sunny_Jay/',									'ff5261'],
			['Natsitu',				'natsitu',			'I loev my cat',																				'https://youtube.com/channel/UCGblrREotEG0-GBDZJZx9oA',					'f037ab'],
			['Awe',					'awe',				'XXXXX',																						'https://www.youtube.com/@awe9037',										'ffffff'],
			['GUMVY',			    'gumvy',		   	'Ayo the pizzas here',							            			  			 	 		'https://youtube.com/channel/UC8QzRh9cwRV-cKzz7pDhtwg',					'444444'],
			['Timson',				'timson',		   	'Sonic colors great game, change my mind >:3',												    'https://twitter.com/Timson79795725',									'26f3e4'],
			['dzub',			    'dzub',		     	'the j',																						'https://twitter.com/dzub_real',										'528fee'],
			['ryo',			  		'ryo',		     	'XXXXX',																						'XXX',																	'ffffff'],
			['Tomfoolery',		    'tom',				'XXXXX',																						'https://www.youtube.com/@slink_outlawed_/',							'ff5261'],
			['Grivaller',		    'grivaller',		'what a Sus Encounter!!!,Not a Duel though,Hes an Engineer,Logically not Problematic',			'https://discord.gg/WTPuYpZX',																	'7c51fd'],
			['Slylin2',				'slylin',			'I am Robloxian, yo.',																			'Discord : Slylin2#7669',												'ffffff'],
			['Seonne',				'seonne',			'Go touch some grass :]',							            	    						'https://www.youtube.com/channel/UCUdxKAxsnWhdZ8lXrze8Jkg',				'FC6161'],
			['Diamond Dev',			'dd',		   		'Why He Ourple?',							                									'https://www.youtube.com/c/TheDiamondProductions45/videos',				'7c51fd'],
			[''],
			['Ex Team'],
			['Le Swaggo',			'leswaggo',			'XXXXX',			    																		'https://gamebanana.com/members/2226418',								'1a9100'],
			['niisf',				'niisf',			'Dont ask why i got kicked',			 		   												'https://www.youtube.com/channel/UCDMnP_VgEOeMRQhBmApvMjw',				'7c51fd'],
			['biologicalfreak',		'bio',				'XXXXX',			 		   																	'XXX',																	'ffffff'],
			[''],
			['Socials'],
			['Discord',				'discord',			'Come hang out with us !',			    														'https://discord.gg/Yd37xdSczX',										'5865F2'],
			['Twitter',				'twitter',			'Follow us for teasers and info!',			    												'https://twitter.com/FNF_TWB',											'00acee'],
			[''],
			['Psych'],
			['Psych Engine Team',	'psychteam',		'The people that worked on Psych Engine !',			    										'Press enter to move to the next submenu.',								'9f2aff'],
			["Funkin' Crew",		'funkincrew',		"The people that worked on Friday Night Funkin' !",												'Press enter to move to the next submenu.',								'ffcb2a']
		];
		
		for(i in defaultList) {
			creditsStuff.push(i);
		}
		
		var characterGifs = new FlxTypedGroup<FlxSprite>();
		add(characterGifs);

		for(i in 0...creditsOrder.length)
		{
			for(j in 0...3) {
			
			var offset:Float = 0;
			var teamMember:FlxSprite = new FlxSprite(0, 0);
			teamMember.scale.x = 1;
			teamMember.scale.y = 1;

			teamMember.frames = Paths.getSparrowAtlas('credits/characters/' + creditsOrder[i][j]);
			teamMember.animation.addByPrefix('idle', "play", 2);
			teamMember.animation.play('idle');
			teamMember.ID = (i + j);
			//menuItem.screenCenter(X);
			//menuItem.screenCenter(Y);
			characterGifs.add(teamMember);
			//var scr:Float = (optionShit.length - 4) * 0.135;
			teamMember.scrollFactor.set(1, 0);
			teamMember.antialiasing = ClientPrefs.data.antialiasing;
			teamMember.setGraphicSize(Std.int(teamMember.width * 1));
			switch(j){
				case 0:
					teamMember.x = 320;
					break;
				case 1:
					teamMember.x = 640;
					break;
				case 2:
					teamMember.x = 960;
					break;
			}
			teamMember.y = 600;
			teamMember.updateHitbox();
		}
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(FlxG.width / 8, 300, creditsStuff[i][0], !isSelectable);
			optionText.isMenuItemCredits = true;
			optionText.targetY = i;
			optionText.changeX = false;
			optionText.snapToPosition();
			grpOptions.add(optionText);
			
			if(creditsStuff[i][1] == "empty")
				{
			var thx:AttachedSprite = new AttachedSprite('credits/thx_for_playing');
			thx.scrollFactor.set(1, 1);
			thx.xAdd= -150;
			thx.yAdd = -150;
			thx.setGraphicSize(Std.int(thx.width * 0.18));
			thx.updateHitbox();
			//thx.screenCenter();
			thx.antialiasing = ClientPrefs.data.antialiasing;
			thx.sprTracker = optionText;
			add(thx);
				}
			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Mods.currentModDirectory = creditsStuff[i][5];
				}

				var str:String = 'credits/missing_icon';
				if (Paths.image('credits/' + creditsStuff[i][1]) != null) str = 'credits/' + creditsStuff[i][1];
				var icon:AttachedSprite = new AttachedSprite(str);
				icon.xAdd = optionText.width + 7;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				Mods.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
		}
		
		
		over = new FlxSprite().loadGraphic(Paths.image('freeplaymenu/overlay'));
		over.antialiasing = ClientPrefs.data.antialiasing;
		over.alpha = 0.0;
		add(over);
		over.screenCenter();

		icon2 = new FlxSprite().loadGraphic(Paths.image('credits/' + creditsStuff[curSelected][1]));
		icon2.antialiasing = ClientPrefs.data.antialiasing;
		icon2.x = 0;
		icon2.y = FlxG.height - icon2.height;
		add(icon2);

		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.75;
		descBox.alpha = 0.75;
		add(descBox);

		linkBox = new AttachedSprite();
		linkBox.makeGraphic(1, 1, FlxColor.BLACK);
		linkBox.xAdd = -10;
		linkBox.yAdd = -10;
		linkBox.alphaMult = 0.75;
		linkBox.alpha = 0.75;
		add(linkBox);

		credBox = new AttachedSprite();
		credBox.makeGraphic(1, 1, FlxColor.BLACK);
		credBox.xAdd = -10;
		credBox.yAdd = -10;
		credBox.alphaMult = 0.75;
		credBox.alpha = 0.75;
		add(credBox);

		descText = new FlxText(50, offsetThing , 1180, "", 28);
		descText.setFormat(Paths.font("vcr.ttf"), 28, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		linkText = new FlxText(FlxG.width - offsetThing, FlxG.height - offsetThing - offsetThing, FlxG.width / 2 - offsetThing / 2, "", 20);
		linkText.setFormat(Paths.font("vcr.ttf"), 20 , FlxColor.CYAN, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		linkText.scrollFactor.set();
		//descText.borderSize = 2.4;
		linkBox.sprTracker = linkText;
		add(linkText);

		credText = new FlxText(FlxG.width - offsetThing, FlxG.height - offsetThing - offsetThing, FlxG.width / 2 - offsetThing / 2, "", 20);
		credText.setFormat(Paths.font("vcr.ttf"), 16 , FlxColor.WHITE, LEFT/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		credText.scrollFactor.set();
		//descText.borderSize = 2.4;
		credBox.sprTracker = credText;
		add(credText);

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
				if(creditsStuff[curSelected][0] == 'Psych Engine Team')
					{MusicBeatState.switchState(new CreditsStatePsych());}
				else if(creditsStuff[curSelected][0] == "Funkin' Crew")
					{MusicBeatState.switchState(new CreditsStateFunkin());}
				else
					{CoolUtil.browserLoad(creditsStuff[curSelected][3]);}
			}
			if (controls.BACK)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxG.sound.playMusic(Paths.music('freakyMenu'));
				MusicBeatState.switchState(new MainMenuState());
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
					item.x = 75;
					item.scale.x = 0.75;
					item.scale.y = 0.75;
				}
				else
				{
					item.x = 50;
					item.scale.x = 0.75;
					item.scale.y = 0.75;
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	var moveTweenIcon:FlxTween = null;
	
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
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
		descText.y = offsetThing + 15;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y - 15}, 0.25, {ease: FlxEase.sineOut});

		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();

		linkText.text = creditsStuff[curSelected][3];
		linkText.y = FlxG.height - linkText.height - offsetThing;
		linkText.x = FlxG.width / 2 + offsetThing / 2;

		linkBox.setGraphicSize(Std.int(FlxG.width), Std.int(linkText.height + 20));
		linkBox.updateHitbox();

		var creditsList:String = Assets.getText("assets/credits/" + creditsStuff[curSelected][1] + ".txt");
		
		if(creditsList != null)
		{
		credText.text = creditsList;
		}
		else
			{credText.text = "MISSING TEXT";}
		credText.y = offsetThing * 3;
		credText.x = FlxG.width / 2 + offsetThing / 2;

		credBox.setGraphicSize(Std.int(FlxG.width), Std.int(FlxG.height -offsetThing * 4 - Std.int(linkText.height + 20)));
		credBox.updateHitbox();

		icon2.loadGraphic(Paths.image('credits/' + creditsStuff[curSelected][1]));
		icon2.y = FlxG.height - icon2.height - 50;
		
		if(moveTweenIcon != null) moveTweenIcon.cancel();
		moveTweenIcon = FlxTween.tween(icon2, {y : icon2.y + 50}, 0.25, {ease: FlxEase.sineOut});

		if(curSelected == 0) over.alpha = 0.0;
		else over.alpha = 0.5;
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