package states;

import backend.WeekData;
import backend.Achievements;

import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;

import flixel.input.keyboard.FlxKey;
import lime.app.Application;

import objects.AchievementPopup;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class EndingsBadMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.7.1h'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	public static var lock:Bool = true;

	var optionShit:Array<String> = [
		'bad',
		'good'
	];

	var slowlyMusic:Int = 0;
	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var background:FlxSprite;

	var trueKeys:Array<String> = [
		'FIRE'
	];
	var allowedKeys:String = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var trueKeysBuffer:String = '';

	override function create()
	{
		#if MODS_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement, false);
		FlxG.cameras.setDefaultDrawTarget(camGame, true);

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(0).loadGraphic(Paths.image('menuBGunderlay'));
		bg.scrollFactor.set(0.5, 0.5);
		bg.setGraphicSize(Std.int(bg.width * 0.5));
		bg.updateHitbox();
		//bg.screenCenter();
		bg.antialiasing = ClientPrefs.data.antialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		var leave:FlxSprite = new FlxSprite(30, -50).loadGraphic(Paths.image('leave'));
		leave.scrollFactor.set(1, -0.5);
		leave.setGraphicSize(Std.int(leave.width * 0.435));
		leave.updateHitbox();
		//leave.screenCenter();
		leave.antialiasing = ClientPrefs.data.antialiasing;
		add(leave);

		var save:FlxSprite = new FlxSprite(1830, -100).loadGraphic(Paths.image('save'));
		save.scrollFactor.set(1, -0.5);
		save.setGraphicSize(Std.int(save.width * 0.520));
		save.updateHitbox();
		//save.screenCenter();
		save.antialiasing = ClientPrefs.data.antialiasing;
		add(save);
		
		// magenta.scrollFactor.set();


		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
			var offset:Float = 0;
			var menuItem:FlxSprite = new FlxSprite(200, 300);
			menuItem.scale.x = 1;
			menuItem.scale.y = 1;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.addByPrefix('pressed', optionShit[i] + " select", 24);
			menuItem.ID = i;
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			menuItem.scrollFactor.set(0.25, 0.6);
			menuItem.antialiasing = ClientPrefs.data.antialiasing;
			menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
			//menuItem.screenCenter(X);
			//menuItem.screenCenter(Y);
		}

		var fabric:FlxSprite = new FlxSprite(0).loadGraphic(Paths.image('slowlytransition'));
		fabric.scrollFactor.set(0, 0);
		fabric.setGraphicSize(Std.int(bg.width * 1));
		fabric.updateHitbox();
		fabric.screenCenter();
		fabric.antialiasing = ClientPrefs.data.antialiasing;
		fabric.alpha = 0;
		add(fabric);

		FlxG.camera.follow(camFollow, null, 0);
		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		new FlxTimer().start(30, function(tmr:FlxTimer)
			{
				if (slowlyMusic == 0)
						{FlxG.sound.play(Paths.sound('slowlyMusic'));
				FlxTween.tween(fabric, { alpha:1 }, 30);
				new FlxTimer().start(50, function(tmr:FlxTimer)
					{
						PlayState.SONG = backend.Song.loadFromJson('slowly', 'slowly');
						PlayState.isStoryMode = true;
						PlayState.storyDifficulty = 1;
			
						PlayState.storyWeek = 1;
						LoadingState.loadAndSwitchState(new PlayState(), true);
						FreeplayState.destroyFreeplayVocals();
					});
						slowlyMusic = 1;}
			});

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementPopup('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.keys.firstJustPressed() != FlxKey.NONE)
		{
			var keyPressed:FlxKey = FlxG.keys.firstJustPressed();
			var keyName:String = Std.string(keyPressed);
			if(allowedKeys.contains(keyName)) {
				trueKeysBuffer += keyName;
				if(trueKeysBuffer.length >= 32) trueKeysBuffer = trueKeysBuffer.substring(1);
				//trace('Test! Allowed Key pressed!!! Buffer: ' + trueKeysBuffer);

				for (wordRaw in trueKeys)
				{
					var word:String = wordRaw.toUpperCase(); //just for being sure you're doing it right
					if (trueKeysBuffer.contains(word))
					{
						//trace('YOOO! ' + word);
						FlxG.save.data.trueTriggerSave = '';
						if (FlxG.save.data.trueTriggerSave == word)
							FlxG.save.data.trueTriggerSave = '';
						else
							FlxG.save.data.trueTriggerSave = word;
							word = '';
						FlxG.save.flush();

						FlxG.sound.play(Paths.sound('confirmMenu'));

						new FlxTimer().start(1, function(tmr:FlxTimer)
						{
						MusicBeatState.switchState(new EndingsMenuState());
						});
						FlxG.save.data.trueTriggerSave = '';
						trueKeysBuffer = '';
						break;
					}
				}
			}
		}

		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
			if(FreeplayState.vocals != null) FreeplayState.vocals.volume += 0.5 * elapsed;
		}
		FlxG.camera.followLerp = FlxMath.bound(elapsed * 9 / (FlxG.updateFramerate / 60), 0, 1);

		if (!selectedSomethin)
		{
			if (controls.UI_LEFT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_RIGHT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				if(curSelected == 1)
				{
					curSelected = 0;
					changeItem();
				}
				else
				{
					curSelected = 1;
					changeItem();
				}
			}

			
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				if(curSelected == 1)
				{
					curSelected = 2;
					changeItem();
				}
				else
				{
					curSelected = 1;
					changeItem();
				}
			}

			if (controls.BACK)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'bad':
										PlayState.SONG = backend.Song.loadFromJson('a-beautiful-end', 'a-beautiful-end');
										PlayState.isStoryMode = true;
										PlayState.storyDifficulty = 1;

										PlayState.storyWeek = 1;
										LoadingState.loadAndSwitchState(new PlayState(), true);
										FreeplayState.destroyFreeplayVocals();
										
									case 'true':
										PlayState.SONG = backend.Song.loadFromJson('burnt-out', 'burnt-out');
										PlayState.isStoryMode = true;
										PlayState.storyDifficulty = 1;

										PlayState.storyWeek = 3;
										LoadingState.loadAndSwitchState(new PlayState(), true);
										FreeplayState.destroyFreeplayVocals();
									case 'good':
										
										PlayState.SONG = backend.Song.loadFromJson('run', 'run');
										PlayState.isStoryMode = true;
										PlayState.storyDifficulty = 1;

										PlayState.storyWeek = 2;
										LoadingState.loadAndSwitchState(new PlayState(), true);
										FreeplayState.destroyFreeplayVocals();
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (controls.justPressed('debug_1'))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			//spr.screenCenter(X);
		});
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;
		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
			}
			if (curSelected == 0)
				{
					camFollow.setPosition(700, 900);
					spr.centerOffsets();
				}
				
			if (curSelected == 1)
				{
					camFollow.setPosition(1700, 900);
					spr.centerOffsets();
				}
		});
	}
}
