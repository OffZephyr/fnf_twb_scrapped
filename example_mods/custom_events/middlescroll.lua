function onEvent(name, value1, value2)
  if name == "middlescroll" then
    if value1 == "1" then
  setPropertyFromGroup('opponentStrums',0,'x','-500')
  setPropertyFromGroup('opponentStrums',1,'x','-500')
  setPropertyFromGroup('opponentStrums',2,'x','-500')
  setPropertyFromGroup('opponentStrums',3,'x','-500')

  setPropertyFromGroup('playerStrums',0,'x','412')
  setPropertyFromGroup('playerStrums',1,'x','527')
  setPropertyFromGroup('playerStrums',2,'x','643')
  setPropertyFromGroup('playerStrums',3,'x','761')
  elseif value1 == "2" then
			setPropertyFromGroup('opponentStrums',0,'x','-500')
			setPropertyFromGroup('opponentStrums',1,'x','-500')
			setPropertyFromGroup('opponentStrums',2,'x','-500')
			setPropertyFromGroup('opponentStrums',3,'x','-500')
		  
			setPropertyFromGroup('playerStrums',0,'x','212')
			setPropertyFromGroup('playerStrums',1,'x','327')
			setPropertyFromGroup('playerStrums',2,'x','843')
			setPropertyFromGroup('playerStrums',3,'x','961')
    end
  end
end