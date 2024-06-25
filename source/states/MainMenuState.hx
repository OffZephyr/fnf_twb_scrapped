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

class MainMenuState extends MusicBeatState
{
	public static var modVersion:String = '1.0.0'; //This is also used for Discord RPC
	public static var psychEngineVersion:String = '0.7.1h'; //This is also used for Discord RPC
	public static var curSelected:Int = 2;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	public static var lock:Bool = true;

	var optionShit:Array<String> = [
		'credits',
		'freeplay',
		'story_mode',
		'options',
		'gallery'
	];

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var background:FlxSprite;
	var bg1:FlxSprite;

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

		bg1 = new FlxSprite(0).loadGraphic(Paths.image('mainmenu/backgrounds/bg_' + optionShit[curSelected]));
		bg1.scrollFactor.set(0, 0);
		bg1.setGraphicSize(Std.int(bg1.width * 1));
		bg1.updateHitbox();
		bg1.screenCenter();
		bg1.antialiasing = ClientPrefs.data.antialiasing;
		bg1.visible = false;
		add(bg1);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		
		// magenta.scrollFactor.set();
		
		
		background = new FlxSprite().loadGraphic(Paths.image('mainmenu/backgrounds/bg_' + optionShit[curSelected]));
		background.scrollFactor.set(0, 0);
		add(background);

		var overlay = new FlxSprite(0).loadGraphic(Paths.image('menuBGoverlay'));
		overlay.scrollFactor.set(0, 0);
		overlay.setGraphicSize(Std.int(overlay.width * 1));
		overlay.updateHitbox();
		overlay.screenCenter();
		overlay.visible = true;
		overlay.antialiasing = ClientPrefs.data.antialiasing;
		overlay.color = 0xffffffff;
		add(overlay);


		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
			var offset:Float = 0;
			var menuItem:FlxSprite = new FlxSprite((i * 700)  + offset, 0);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			if(ClientPrefs.data.galleryLock == true)
			{
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_L' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.addByPrefix('pressed', optionShit[i] + " select", 24);
			menuItem.animation.play('idle');
			}
			else
			{
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.addByPrefix('pressed', optionShit[i] + " select", 24);
			menuItem.animation.play('idle');
			}
			menuItem.ID = i;
			//menuItem.screenCenter(X);
			//menuItem.screenCenter(Y);
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			menuItem.scrollFactor.set(1, 0);
			menuItem.antialiasing = ClientPrefs.data.antialiasing;
			menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
			menuItem.y = 600;
		}

		FlxG.camera.follow(camFollow, null, 0);

		var versionShit:FlxText = new FlxText(FlxG.width - 260, 25, 0, "FNF:The World Below  v" + modVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(FlxG.width - 190, 45, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(FlxG.width - 260, 5, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		
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
		
		ClientPrefs.data.comboOffset = [-410, -360, -350, -135];
		background.screenCenter();

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
			if (controls.UI_UP_P)
			{
						
			}if (controls.UI_DOWN_P)
			{
						
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'gallery')
					{
					if(ClientPrefs.data.galleryLock == true)
						{FlxG.sound.play(Paths.sound('locked'));}
					else
					{
					FlxTween.tween(FlxG.camera, {zoom: 1.5}, 1, {
						ease: FlxEase.quartOut,
					});
						selectedSomethin = true;
						FlxG.sound.play(Paths.sound('confirmMenu'));
						menuItems.forEach(function(spr:FlxSprite)
						{
							if (curSelected != spr.ID)
							{
							}
							else
							{
							   // THIS PART ADD IT NOW !
								spr.animation.play('pressed');
								FlxFlicker.flicker(spr, 1, 0.6, true, false, function(flick:FlxFlicker)
								{
									var daChoice:String = optionShit[curSelected];
	
									switch (daChoice)
									{
										case 'gallery':
											MusicBeatState.switchState(new GalleryState());
											FlxG.sound.playMusic(Paths.music('creditsMenu'));
										case 'freeplay':
											MusicBeatState.switchState(new FreeplayState());
										case 'story_mode':
											PlayState.SONG = backend.Song.loadFromJson('hanging-on', 'hanging-on');
											PlayState.isStoryMode = true;
											PlayState.storyDifficulty = 1;
	
											PlayState.storyWeek = 0;
											LoadingState.loadAndSwitchState(new PlayState(), true);
											FreeplayState.destroyFreeplayVocals();
										case 'options':
											LoadingState.loadAndSwitchState(new options.OptionsState());
									}
								});
							}
						});
					}}
					else if (optionShit[curSelected] == 'donate')
					{
						CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
					}
					else
					{
						FlxTween.tween(FlxG.camera, {zoom: 1.5}, 1, {
							ease: FlxEase.quartOut,
						});
						selectedSomethin = true;
						FlxG.sound.play(Paths.sound('confirmMenu'));
	
	
						menuItems.forEach(function(spr:FlxSprite)
						{
							if (curSelected != spr.ID)
							{
							}
							else
							{
								spr.animation.play('pressed');
								FlxFlicker.flicker(spr, 1, 0.6, true, false, function(flick:FlxFlicker)
								{
									var daChoice:String = optionShit[curSelected];
	
									switch (daChoice)
									{
										case 'credits':
											MusicBeatState.switchState(new CreditsState());
											FlxG.sound.playMusic(Paths.music('creditsMenu'));
										case 'freeplay':
											MusicBeatState.switchState(new FreeplayState());
										case 'story_mode':
											PlayState.SONG = backend.Song.loadFromJson('hanging-on', 'hanging-on');
											PlayState.isStoryMode = true;
											PlayState.storyDifficulty = 1;
	
											PlayState.storyWeek = 0;
											LoadingState.loadAndSwitchState(new PlayState(), true);
											FreeplayState.destroyFreeplayVocals();
											
										case 'options':
											LoadingState.loadAndSwitchState(new options.OptionsState());
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
		background.loadGraphic(Paths.image('mainmenu/backgrounds/bg_' + optionShit[curSelected]));
		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();
			
			spr.scale.x = 0.58;
			spr.scale.y = 0.58;
			spr.alpha = 0.5;

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				spr.alpha = 1;
				spr.scale.x = 0.65;
				spr.scale.y = 0.65;
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				if (curSelected == 2)
					{camFollow.setPosition(spr.getGraphicMidpoint().x + -60, spr.getGraphicMidpoint().y);}
				else if (curSelected == 1)
					{camFollow.setPosition(spr.getGraphicMidpoint().x + -100, spr.getGraphicMidpoint().y);}
				else
					{camFollow.setPosition(spr.getGraphicMidpoint().x + -120, spr.getGraphicMidpoint().y);}
			}
			spr.y = 600;
		});
	}
}
