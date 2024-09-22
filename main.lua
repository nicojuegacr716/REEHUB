if game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "Ree Hub", HidePremium = false, SaveConfig = true, IntroText = "Ree hub", ConfigFolder = "Ree hub"})
    
    -- values
    _G.autoClick = false
    local clicking = false

    -- functions
    function autoClick()
        while _G.autoClick do
            -- Incrementa el contador de clics en el juego
            game:GetService("ReplicatedStorage").Remotes.Click:FireServer()
            wait(0.000000000000000000000000000000001)  -- Espera 0.1 segundos entre cada clic automático
        end
    end

    local FarmTab = Window:MakeTab({
        Name = "AutoFarm",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    FarmTab:AddToggle({
        Name = "AutoClick",
        Default = false,
        Callback = function(Value)
            _G.autoClick = Value
            if _G.autoClick and not clicking then
                clicking = true
                autoClick()  -- Comienza el clic automático cuando se activa el toggle
            elseif not _G.autoClick then
                clicking = false  -- Detiene el clic automático cuando se desactiva el toggle
            end
        end    
    })

    OrionLib:Init()
end
