function opponentNoteHit(id, noteData, noteType, isSustainNote)
    characterPlayAnim('gf', 'scared', false);
    triggerEvent('Screen Shake', '0.05, 0.01', '0, 0');
end