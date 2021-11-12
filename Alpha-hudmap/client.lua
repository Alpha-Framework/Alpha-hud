Citizen.CreateThread(function()
	RequestStreamedTextureDict("circlemap", false)
	while not HasStreamedTextureDictLoaded("circlemap") do
		Wait(0)
	end

    AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
    AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "circlemap", "radarmasksm")

	SetMinimapClipType(1)
    SetMinimapComponentPosition("minimap", "L", "B", 0.020, -0.04, 0.153, 0.24)
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.000001, 0.0012, 0.093, 0.164)
    SetMinimapComponentPosition("minimap_blur", "L", "B", 0.000001, 0.00022, 0.256, 0.337)

    SetMinimapClipType(1)
    DisplayRadar(0)
    SetRadarBigmapEnabled(true, false)
    Citizen.Wait(0)
    SetRadarBigmapEnabled(false, false)
    DisplayRadar(1)
end)


Citizen.CreateThread(function()
    while true do
        --DontTiltMinimapThisFrame()
        HideMinimapInteriorMapThisFrame()
        SetRadarZoom(800)
        Citizen.Wait(0)
    end
end)

local pauseActive = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
        local player = PlayerPedId()
        SetRadarZoom(800)
        local isPMA = IsPauseMenuActive()
        if isPMA and not pauseActive or IsRadarHidden() then 
            pauseActive = true 
            SendNUIMessage({
                action = "hideUI"
            })
            uiHidden = true
        elseif not isPMA and pauseActive then
            pauseActive = false
            SendNUIMessage({
                action = "displayUI"
            })
            uiHidden = false
        end
    Citizen.Wait(0)
    end
end)