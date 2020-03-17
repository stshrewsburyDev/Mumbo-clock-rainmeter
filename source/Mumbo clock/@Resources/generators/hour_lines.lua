PROPERTIES = {WidgetSize=0}

local lines = {HLine0= {'HLine0',  0.500, 0.150, 0  },
               HLine1= {'HLine1',  0.662, 0.194, 30 },
               HLine2= {'HLine2',  0.782, 0.312, 60 },
               HLine3= {'HLine3',  0.825, 0.475, 90 },
               HLine4= {'HLine4',  0.782, 0.638, 300},
               HLine5= {'HLine5',  0.662, 0.756, 330},
               HLine6= {'HLine6',  0.500, 0.800, 0  },
               HLine7= {'HLine7',  0.338, 0.756, 30 },
               HLine8= {'HLine8',  0.218, 0.638, 60 },
               HLine9= {'HLine9',  0.175, 0.475, 90 },
               HLine10={'HLine10', 0.218, 0.312, 300},
               HLine11={'HLine11', 0.338, 0.194, 330},}

function Initialize()
  size = tonumber(PROPERTIES.WidgetSize)
  for id, info in pairs(lines) do
    args = 'Line ' .. (size * info[2]) .. ',' .. (size * info[3]) .. ',' .. (size * info[2]) .. ',' .. (size * (info[3] + 0.05)) .. ' | StrokeWidth ' .. (size * 0.010) .. ' | Stroke Color #HourLinesColour# | StrokeStartCap Round | StrokeEndCap Round | Rotate ' .. info[4]
    SKIN:Bang('!SetOption', info[1], 'Shape', args)
    SKIN:Bang('!SetOption', info[1], 'Hidden', '#HideHourLines#')
  end
end
