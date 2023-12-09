print("^2Jim^7-^2CableCar ^7v^4"..GetResourceMetadata(GetCurrentResourceName(), 'version', nil):gsub("%.", "^7.^4").."^7 - ^2Cable Car Script Rewritten by ^1Jimathy^7")

Debug = true
Notify = "qb"

local time = 1000
function loadModel(model)
    if not HasModelLoaded(model) then if Debug then print("^5Debug^7: ^2Loading Model^7: '^6"..model.."^7'") end
	while not HasModelLoaded(model) do if time > 0 then time = time - 1 RequestModel(model)
		else time = 1000 print("^5Debug^7: ^3LoadModel^7: ^2Timed out loading model ^7'^6"..model.."^7'") break end
		Wait(10) end
	end
end
function unloadModel(model) if Debug then print("^5Debug^7: ^2Removing Model^7: '^6"..model.."^7'") end SetModelAsNoLongerNeeded(model) end

function makeProp(data, freeze, synced)
    loadModel(data.prop)
    local prop = CreateObject(data.prop, data.coords.x, data.coords.y, data.coords.z-1.03, synced or false, synced or false, false)
    SetEntityHeading(prop, data.coords.w)
    FreezeEntityPosition(prop, freeze or 0)
	if Debug then
		local coords = { string.format("%.2f", data.coords.x), string.format("%.2f", data.coords.y), string.format("%.2f", data.coords.z), (string.format("%.2f", data.coords.w or 0.0)) }
		print("^5Debug^7: ^1Prop ^2Created^7: '^6"..prop.."^7' | ^2Hash^7: ^7'^6"..(data.prop).."^7' | ^2Coord^7: ^5vec4^7(^6"..(coords[1]).."^7, ^6"..(coords[2]).."^7, ^6"..(coords[3]).."^7, ^6"..(coords[4]).."^7)")
	end
    return prop
end

function createTempCam(ent, coords)
	local cam = nil
	--if Debug then triggerNotify(nil, "ModCam Created", "success") end
	local choice = 1
	local camCoords = GetOffsetFromEntityInWorldCoords(ent, (choice == 1 and -1.0 or 1.0), 0.0, 0.5)
	local pedCoords = GetEntityCoords(PlayerPedId())
	if (camCoords.x - pedCoords.x) <= 1.0 then
		camCoords = GetOffsetFromEntityInWorldCoords(ent, choice ~= 1 and -1.0 or 1.0, 0.0, 0.5)
	end
	cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", camCoords.x, camCoords.y, camCoords.z, 0.0, 0.0, 0.0, 90.00, false, 0)
	PointCamAtCoord(cam, coords)
	return cam
end
function startTempCam(cam)
	SetCamActive(cam, true)
	RenderScriptCams(true, true, 1000, true, true)
end
function stopTempCam() CreateThread(function() Wait(1000) RenderScriptCams(false, true, 500, true, true) DestroyAllCams() end) end

-- Lerp, not to be confused with Liable Emerates Role Play
function Lerp(a, b, t)
	return a + (b - a) * t
end

-- Mass lerper
function VecLerp(x1, y1, z1, x2, y2, z2, l, clamp)
    if clamp then
        if l < 0.0 then l = 0.0 end
        if l > 1.0 then l = 1.0 end
    end
    local x = Lerp(x1, x2, l)
    local y = Lerp(y1, y2, l)
    local z = Lerp(z1, z2, l)
    return vec3(x, y, z)
end