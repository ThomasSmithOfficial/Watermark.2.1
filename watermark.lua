local waterMarkText = "~r~Your Server ~w~Name" -- Text s barevnými tagy pro "CHAOS" (červená) a "PVP" (bílá)
local textScale = 0.58   -- Větší text
local textFont = 7       -- Font 7: Hranatý a agresivní
local textColor = {255, 255, 255, 255} -- Bílá (barva se nastavuje tagy ve waterMarkText)
local textShadow = true
local textOutline = true
local textX = 0.98       -- Blízko pravého okraje
local textY = 0.03       -- Umístění níže (pod úroveň minimapy)

-- Vykreslovací funkce pro text s obrysem a stínem
function DrawWatermark(text, x, y, scale, font, color, shadow, outline)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(color[1], color[2], color[3], color[4])
    SetTextEntry("STRING")
    
    -- Toto je klíčové pro použití barevných tagů, jako ~r~ nebo ~w~
    AddTextComponentSubstringPlayerName(text)
    
    if shadow then
        SetTextDropShadow(0, 0, 0, 0, 240)
    end
    
    if outline then
        SetTextOutline()
        SetTextGxtEntry("COLOR_BLACK") -- Nastaví černý obrys
    end
    
    SetTextJustification(3) -- Zarovnání doprava
    DrawText(x, y)
    SetTextJustification(0)
end

-- Hlavní smyčka
CreateThread(function()
    while true do
        Wait(0) 

        DrawWatermark(
            waterMarkText,
            textX, 
            textY,
            textScale,
            textFont,
            textColor,
            textShadow,
            textOutline
        )
    end
end)