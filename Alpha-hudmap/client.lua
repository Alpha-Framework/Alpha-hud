
EnableCircleMap = true

if EnableCircleMap then
    Citizen.CreateThread(function()
        RequestStreamedTextureDict("circlemap", false)
        while not HasStreamedTextureDictLoaded("circlemap") do
            Wait(0)
        end
    
        AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
        AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "circlemap", "radarmasksm")
    
        SetMinimapClipType(1)
        SetMinimapComponentPosition("minimap", "L", "B", -0.0180, -0.030, 0.180, 0.258)
        SetMinimapComponentPosition("minimap_mask", "L", "B", 0.2, 0.0, 0.065, 0.20)
        SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.01, 0.021, 0.252, 0.338)
    
        SetMinimapClipType(1)
        DisplayRadar(0)
        SetRadarBigmapEnabled(true, false)
        Citizen.Wait(0)
        SetRadarBigmapEnabled(false, false)
        DisplayRadar(1)
    end) 
    local pauseActive = false
Citizen.CreateThread(function()
    while true do
        HideMinimapInteriorMapThisFrame()
        SetRadarZoom(1000)
        Citizen.Wait(0)
    end
end)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(50)
            local player = PlayerPedId()
            SetRadarZoom(1000)
            SetRadarBigmapEnabled(false, false)
            local isPMA = IsPauseMenuActive()
            if isPMA and not pauseActive or IsRadarHidden() then 
                pauseActive = true 
                SendNUIMessage({
                    action = "hideCircleUI"
                })
                uiHidden = true
            elseif not isPMA and pauseActive then
                pauseActive = false
                SendNUIMessage({
                    action = "displayCircleUI"
                })
                uiHidden = false
            end
        Citizen.Wait(0)
        end
    end)
    

else     
Citizen.CreateThread(function()
	RequestStreamedTextureDict("squaremap", false)
	while not HasStreamedTextureDictLoaded("squaremap") do
		Wait(0)
	end

    AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "squaremap", "radarmasksm")
    AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "squaremap", "radarmasksm")

	SetMinimapClipType(0)
    SetMinimapComponentPosition("minimap", "L", "B", 0.0, -0.047, 0.1638, 0.236)
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.2, 0.0, 0.065, 0.20)
    SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.01, 0.025, 0.262, 0.351)

    SetMinimapClipType(0)
    DisplayRadar(0)
    SetRadarBigmapEnabled(true, false)
    Citizen.Wait(0)
    SetRadarBigmapEnabled(false, false)
    DisplayRadar(1)
end)
local pauseActive = false
Citizen.CreateThread(function()
    while true do
        HideMinimapInteriorMapThisFrame()
        SetRadarZoom(1000)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
        local player = PlayerPedId()
        SetRadarZoom(1000)
        SetRadarBigmapEnabled(false, false)
        local isPMA = IsPauseMenuActive()
        if isPMA and not pauseActive or IsRadarHidden() then 
            pauseActive = true 
            SendNUIMessage({
                action = "hideSquareUI"
            })
            uiHidden = true
        elseif not isPMA and pauseActive then
            pauseActive = false
            SendNUIMessage({
                action = "displaySquareUI"
            })
            uiHidden = false
        end
    Citizen.Wait(0)
    end
end)
end



