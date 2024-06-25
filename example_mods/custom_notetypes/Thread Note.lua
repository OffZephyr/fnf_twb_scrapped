function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is the note it is
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Thread Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'THREADNOTE_assets'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false


function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == "Thread Note" then
		if downscroll then
			makeLuaSprite('one', 'threetimesdown', -250, -1000);
			scaleObject('one', 0.8, 1.1);
			addLuaSprite('one', true)
			setProperty('one.visible', true);
			setObjectCamera('one', 'hud');
			runTimer('poof', 6)
		else
			makeLuaSprite('one', 'threetimesup', -250, -100);
			scaleObject('one', 0.8, 1.1);
			addLuaSprite('one', true)
			setProperty('one.visible', true);
			setObjectCamera('one', 'hud');
			runTimer('poof', 6)
		end
	end
end


function onTimerCompleted(tag)
if tag == 'poof' then
doTweenAlpha('e','one',0,2,'cubeInOut')
end
end