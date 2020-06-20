local stress = 0

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1000)
		local ped = GetPlayerPed()
		if HasEntityBeenDamagedByAnyPed(ped) then
			local nuevostress = stress +10
			stress = nuevostress 
		elseif IsPedWalking(ped) then
			stress = stress + 0.05 
		elseif IsPedRunning(ped) then
			stress = stress + 0.25	
		elseif (GetEntitySpeed(ped)*3.6) > 140 then
			stress = stress + 0.2
		elseif IsPedShooting(ped) then
			stress = stress + 0.2
		elseif IsPedSwimmingUnderWater(ped) then
			stress = stress + 1/200
		end
		if stress > 100 then
			stress = 100
		end
	end
end)

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(2)
	if stress < 10 then
		DrawTxt("stress:" ..math.floor(stress).. " ", 0.20, 0.95, 0.4, 0.4, true, 0, 255, 85, 255, true)
	elseif stress > 10 and stress <20 then
		DrawTxt("stress:" ..math.floor(stress).. " ", 0.20, 0.95, 0.4, 0.4, true, 18, 208, 75, 255, true)
	elseif stress > 20 and stress <30 then
		DrawTxt("stress:" ..math.floor(stress).. " ", 0.20, 0.95, 0.4, 0.4, true, 31, 178, 75, 255, true)
	elseif stress > 30 and stress <40 then
		DrawTxt("stress:" ..math.floor(stress).. " ", 0.20, 0.95, 0.4, 0.4, true, 35, 144, 68, 255, true)
	elseif stress > 40 and stress <50 then
		DrawTxt("stress:" ..math.floor(stress).. " ", 0.20, 0.95, 0.4, 0.4, true, 31, 112, 55, 255, true)
	elseif stress > 50 and stress <60 then
		DrawTxt("stress:" ..math.floor(stress).. " ", 0.20, 0.95, 0.4, 0.4, true, 164, 99, 99, 255, true)
	elseif stress > 60 and stress <70 then
		DrawTxt("stress:" ..math.floor(stress).. " ", 0.20, 0.95, 0.4, 0.4, true, 178, 81, 81, 255, true)
	elseif stress > 70 and stress <80 then
		DrawTxt("stress:" ..math.floor(stress).. " ", 0.20, 0.95, 0.4, 0.4, true, 193, 63, 63, 255, true)
	elseif stress > 80 and stress <90 then
		DrawTxt("stress:" ..math.floor(stress).. " ", 0.20, 0.95, 0.4, 0.4, true, 255, 34, 34, 255, true)
	elseif stress > 90 then
		DrawTxt("stress:" ..math.floor(stress).. " ", 0.20, 0.95, 0.4, 0.4, true, 255, 0, 0, 255, true)
	end
	end
end)

local stressed = false

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1000)
		if stress > 85 then
			stressed = true
		else
			stressed = false
    	end
    end
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(30000)
		if stressed then
			Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0,-1118911493, 1, 1, 0, 0)
    	end
    end
end)

Citizen.CreateThread(function()
	local coords
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1)
			local coords      = GetEntityCoords(GetPlayerPed())
			if (GetDistanceBetweenCoords(coords, -309.363, 805.67, 118.9, true) < 10) then  --or (GetDistanceBetweenCoords(coords, -340.43, 781.55, 115.64, true) < 12)
				DrawTxt("Zona Chill", 0.50, 0.95, 0.4, 0.4, true, 0, 255, 85, 255, true) 
			end
		end
	end)
end)

Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(10000)
		local coords      = GetEntityCoords(GetPlayerPed())
		local isInMarker  = false
		local currentZone = nil
		if(GetDistanceBetweenCoords(coords, -309.363, 805.67, 118.9, true) < 12) then -- or (GetDistanceBetweenCoords(coords, -340.43, 781.55, 115.64, true) < 12)
		if stress > 0 then
			stress = stress - 1
		end
		end
	end
end)