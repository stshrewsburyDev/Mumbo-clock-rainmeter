PROPERTIES = {WidgetSize=0}

local numbers = {Num1  = {'Number1',  '1',  0.673, 0.142 },
                 Num2  = {'Number2',  '2',  0.812, 0.280 },
                 Num3  = {'Number3',  '3',  0.864, 0.476 },
                 Num4  = {'Number4',  '4',  0.814, 0.665 },
                 Num5  = {'Number5',  '5',  0.672, 0.808 },
                 Num6  = {'Number6',  '6',  0.480, 0.860 },
                 Num7  = {'Number7',  '7',  0.288, 0.808 },
                 Num8  = {'Number8',  '8',  0.144, 0.664 },
                 Num9  = {'Number9',  '9',  0.094, 0.476 },
                 Num10 = {'Number10', '10', 0.140, 0.280 },
                 Num11 = {'Number11', '11', 0.276, 0.144 },
                 Num12 = {'Number12', '12', 0.468, 0.092 }}

function Initialize()
  size = tonumber(PROPERTIES.WidgetSize)
  for id, info in pairs(numbers) do
    SKIN:Bang('!SetOption', info[1], 'MeterStyle', 'NumberTemplate')
    meter = SKIN:GetMeter(info[1])
    SKIN:Bang('!SetOption', info[1], 'Text', info[2])
    meter:SetX((size * info[3]))
    meter:SetY((size * info[4]))
  end
end
