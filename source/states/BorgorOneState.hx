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

class BorgorOneState extends MusicBeatState
{
	public static var modVersion:String = '1.0.0'; //This is also used for Discord RPC
	public static var psychEngineVersion:String = '0.7.1h'; //This is also used for Discord RPC
	public static var curSelected:Int = 2;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	public static var lock:Bool = true;

	var optionShit:Array<String> = [
		'ending'
	];

	var flicker:FlxSprite = new FlxSprite(-625, 0);
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


		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		
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
			var menuItem:FlxSprite = new FlxSprite(-625, 0);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('ending1');
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.addByPrefix('pressed', optionShit[i] + " selected", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			//menuItem.screenCenter(X);
			menuItem.screenCenter(Y);
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			menuItem.scrollFactor.set(1, 0);
			menuItem.antialiasing = ClientPrefs.data.antialiasing;
			menuItem.setGraphicSize(Std.int(menuItem.width * 1));
			menuItem.updateHitbox();
			menuItem.y = 600;
		}

		FlxG.camera.follow(camFollow, null, 1);
		
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
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
			if(FreeplayState.vocals != null) FreeplayState.vocals.volume += 0.5 * elapsed;
		}
		FlxG.camera.followLerp = FlxMath.bound(elapsed * 9 / (FlxG.updateFramerate / 60), 0, 1);

		if (!selectedSomethin)
		{

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.music.stop();
				FlxG.sound.play(Paths.sound('borgorConfirm1'));


				menuItems.forEach(function(spr:FlxSprite)
				{
					if (curSelected != spr.ID)
					{
					}
					else
					{
						spr.animation.play('pressed');
						FlxFlicker.flicker(flicker, 2, 0.6, true, false, function(flick:FlxFlicker)
						{
							var daChoice:String = optionShit[curSelected];
									MusicBeatState.switchState(new MainMenuState());
									FlxG.sound.playMusic(Paths.music('freakyMenu'));});
					}
				});
			}

			if (controls.ACCEPT)
			{
				selectedSomethin = true;
				FlxG.sound.music.stop();
				FlxG.sound.play(Paths.sound('borgorConfirm1'));


				menuItems.forEach(function(spr:FlxSprite)
				{
					if (curSelected != spr.ID)
					{
					}
					else
					{
						spr.animation.play('pressed');
						FlxFlicker.flicker(flicker, 2, 0.6, true, false, function(flick:FlxFlicker)
						{
							var daChoice:String = optionShit[curSelected];
									MusicBeatState.switchState(new MainMenuState());
									FlxG.sound.playMusic(Paths.music('freakyMenu'));});
					}
				});
			}
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.screenCenter(Y);
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
		});
	}
}
