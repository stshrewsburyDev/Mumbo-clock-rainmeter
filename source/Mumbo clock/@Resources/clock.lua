PROPERTIES = {SpoonHours=0, NightHours=0}

local spoon_hours_active = false
local spoon_hours_activated = false

local night_hours_active = false
local night_hours_activated = false

local hour_arm_rotation = 0
local minute_arm_rotation = 0

function Initialize()
  if PROPERTIES.SpoonHours == "1" then
    spoon_hours_active = true
  elseif PROPERTIES.SpoonHours == "true" then
    spoon_hours_active = true
  else
    spoon_hours_active = false
  end

  if PROPERTIES.NightHours == "1" then
    night_hours_active = true
  elseif PROPERTIES.NightHours == "true" then
    night_hours_active = true
  else
    night_hours_active = false
  end

  print('Mumbo clock loaded in and is now running! Version: 1.0')
end

function Update()
  time = os.date('*t')

  hour_arm_rotation = ((360 / 12) * time.hour) + (((360 / 12) / 60) * time.min)
  minute_arm_rotation = ((360 / 60) * time.min) + (((360 / 60) / 60) * time.sec)

  SKIN:Bang('!SetOption', 'CharacterHourHand', 'StartAngle', math.rad(hour_arm_rotation))
  SKIN:Bang('!SetOption', 'CharacterMinuteHand', 'StartAngle', math.rad(minute_arm_rotation))

  if (spoon_hours_active) then
    if time.hour >= 12 and time.hour <= 13 then
      if (not spoon_hours_activated) then
        spoon_hours_activated = true
        SKIN:Bang('!SetOption', 'CharacterHourHand', 'ImageName', '#@#images/character/#character#/hour_hand_spoon.png')
        SKIN:Bang('!SetOption', 'CharacterMinuteHand', 'ImageName', '#@#images/character/#character#/minute_hand_spoon.png')
      end
    else
      if (spoon_hours_activated) then
        spoon_hours_activated = false
        SKIN:Bang('!SetOption', 'CharacterHourHand', 'ImageName', '#@#images/character/#character#/hour_hand.png')
        SKIN:Bang('!SetOption', 'CharacterMinuteHand', 'ImageName', '#@#images/character/#character#/minute_hand.png')
      end
    end
  end

  if (night_hours_active) then
    if time.hour >= 22 or time.hour <= 7 then
      if (not night_hours_activated) then
        night_hours_activated = true
        SKIN:Bang('!SetOption', 'CharacterHead', 'ImageName', '#@#images/character/#character#/head_sleep.png')
      end
    else
      if (night_hours_activated) then
        night_hours_activated = false
        SKIN:Bang('!SetOption', 'CharacterHead', 'ImageName', '#@#images/character/#character#/head.png')
      end
    end
  end
end
