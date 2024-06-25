function onEvent(name, value1, value2)
  if name == "clock" then
    if value1 == "1" then
    setProperty('clock258.alpha', 0)
    setProperty('clock259.alpha', 1)
    setProperty('clock300.alpha', 0)
  elseif value1 == "2" then
    setProperty('clock258.alpha', 0)
    setProperty('clock259.alpha', 0)
    setProperty('clock300.alpha', 1)
    end
  end
end