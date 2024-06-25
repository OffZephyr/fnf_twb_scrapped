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

import objects.AttachedSprite;

class GalleryState extends MusicBeatState
{
	public static var curSelected:Int = 0;
	public static var galleryPage:Int = 0;
	public static var galleryMaxPages:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	private var desc:Array<Array<String>> = [];

	var optionShit:Array<String> = [
		'0',
		'1',
		'2',
		'3',
		'4',
		'5',
		'6',
		'12',
		'7',
		'8',
		'9',
		'10',
		'11',
		'thx',
		'thx2',
		'thxselect'
	];

	var descList:Array<Array<String>> = [
		['Main logo for the mod'],
		['Logo Tests'],
		['Very first itteration of this mod.'],
		['Concepts for Fabric Bandu, who used to be the main antagonist for this mod, back when it was called "FNF vs Fabric Bandu"'],
		["Here's the boy in action"],
		['Early version of "A beautiful end"'],
		['Original Mockup for "Puppetry"'],
		['Concept for "Burnt Out"'],
		['Where the idea for "Burnt Out" came from'],
		['Fabric Pico concept'],
		['Endings Menu original concept'],
		['BETA credits Main Manu background'],
		['BETA options Main Manu background'],
		['Thank you for playing !!!'],
		['Thank you for playing !!!'],
		['???']
	];

	var descBox:AttachedSprite;
	var descText:FlxText;
	var pageText:FlxText;
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

		bg1 = new FlxSprite(0).loadGraphic(Paths.image('menuBGunderlay'));
		bg1.scrollFactor.set(0, 0);
		bg1.setGraphicSize(Std.int(bg1.width * 0.375));
		bg1.updateHitbox();
		bg1.screenCenter();
		bg1.visible = true;
		bg1.antialiasing = ClientPrefs.data.antialiasing;
		bg1.color = 0xffffffff;
		add(bg1);


		var gal:FlxSprite = new FlxSprite(0).loadGraphic(Paths.image('gallery/' + optionShit[curSelected]));
		gal.scrollFactor.set(0, 0);
		gal.setGraphicSize(Std.int(gal.width * 1));
		gal.updateHitbox();
		gal.screenCenter();
		gal.antialiasing = ClientPrefs.data.antialiasing;
		gal.visible = false;
		add(gal);


		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		
		// magenta.scrollFactor.set();
		
		background = new FlxSprite().loadGraphic(Paths.image('gallery/' + optionShit[curSelected]));
		background.scrollFactor.set(0, 0);
		add(background);


		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
			var offset:Float = 0;
			var menuItem:FlxSprite = new FlxSprite().loadGraphic(Paths.image('credits/empty'));
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.ID = i;
			//menuItem.screenCenter(X);
			//menuItem.screenCenter(Y);
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			menuItem.scrollFactor.set(0.8, 0);
			menuItem.antialiasing = ClientPrefs.data.antialiasing;
			menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
			menuItem.y = 600;
		}

		FlxG.camera.follow(camFollow, null, 0);

		galleryPage = curSelected + 1;
		galleryMaxPages = menuItems.length - 2;

		for(i in descList){
			desc.push(i);
		}

		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.75;
		descBox.alpha = 0.75;
		add(descBox);

		descText = new FlxText(50, 50 , 1180, "", 28);
		descText.setFormat(Paths.font("vcr.ttf"), 28, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);
		
		pageText = new FlxText(50, 50 , 1180, "", 28);
		pageText.setFormat(Paths.font("vcr.ttf"), 28, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		pageText.scrollFactor.set();
		//descText.borderSize = 2.4;
		pageText.y = FlxG.height - pageText.height - 10;
		pageText.screenCenter(X);
		add(pageText);
		add(descText);


		// NG.core.calls.event.logEvent('swag').send();

		curSelected = 0;
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
		if (curSelected > descList.length - 2) 
			pageText.y = -2000;
		else 
			pageText.y = FlxG.height - pageText.height - 10;
		
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
				FlxG.sound.playMusic(Paths.music('freakyMenu'));
				MusicBeatState.switchState(new MainMenuState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'thx')
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
							curSelected = menuItems.length - 1;
							changeItem();
							spr.animation.play('pressed');
							FlxFlicker.flicker(spr, 3, 0.6, true, false, function(flick:FlxFlicker)
							{
								PlayState.SONG = backend.Song.loadFromJson('borgor', 'borgor');
								PlayState.isStoryMode = true;
								PlayState.storyDifficulty = 1;

								PlayState.storyWeek = 0;
								LoadingState.loadAndSwitchState(new PlayState(), true);
								FreeplayState.destroyFreeplayVocals();
							}
							);
						}
					});
				}
				else if (optionShit[curSelected] == '4')
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
							spr.animation.play('pressed');
							FlxFlicker.flicker(spr, 2, 0.6, true, false, function(flick:FlxFlicker)
							{
								PlayState.SONG = backend.Song.loadFromJson('held-by-a-thread', 'held-by-a-thread');
								PlayState.isStoryMode = true;
								PlayState.storyDifficulty = 1;

								PlayState.storyWeek = 0;
								LoadingState.loadAndSwitchState(new PlayState(), true);
								FreeplayState.destroyFreeplayVocals();
							}
							);
						}
					});
				}
				else
				{
					FlxG.sound.play(Paths.sound('locked'));
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

		if (curSelected == descList.length - 2)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = descList.length - 3;

		background.loadGraphic(Paths.image('gallery/' + optionShit[curSelected]));
		descText.text = desc[curSelected][0];
		descText.y = 15;
		galleryPage = curSelected + 1;
		galleryMaxPages = descList.length - 2;
		pageText.text = galleryPage + '/' + galleryMaxPages;
		

	}
}
