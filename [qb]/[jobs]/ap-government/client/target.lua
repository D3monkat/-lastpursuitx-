QBCore = exports[Config.FrameworkExport]:GetCoreObject()

local cfg = Config.Target
local qbTarget = Config.Interactions.qbTarget
local oxTarget = Config.Interactions.oxTarget
local qTarget = Config.Interactions.qTarget

RegisterNetEvent('ap-government:notify')
AddEventHandler('ap-government:notify', function(msg)
	QBCore.Functions.Notify(msg)
end)

local PlayerData = QBCore.Functions.GetPlayerData()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
  PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
  PlayerData = {}
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
  PlayerData.job = JobInfo
end)

checkJob = function(name, grade)
  if not PlayerData then return false end
  if not PlayerData.job then return false end
  if grade ~= nil then
    if PlayerData.job.name == name and PlayerData.job.grade.level >= tonumber(grade) then
      return true
    end
  else
    if PlayerData.job.name == name then
      return true
    end
  end
  return false   
end

Citizen.CreateThread(function()
  local qbtargetcfg, oxtargetcfg = cfg['qb-target'], cfg['ox-target']
  if qbTarget == true then
    if qbtargetcfg['votingSystem']['votingStaff']['active'] == true then
      local input = {
        { 
          type = "client",
          event = "ap-government:client:applyCandidate", 
          icon = 'fas fa-sign-in-alt',
          label = 'Apply As Candidate'
        },
      }
      if Config.VotingSettings.Job then
        table.insert(input, {type = "client", event = "ap-government:client:staffVotingMenu", icon = 'fas fa-sign-in-alt', label = 'Voting Management', job = {[qbtargetcfg['votingSystem']['votingStaff']['ped'].job.name] = qbtargetcfg['votingSystem']['votingStaff']['ped'].job.grade}})
      end
      exports['qb-target']:SpawnPed({
        model = qbtargetcfg['votingSystem']['votingStaff']['ped'].ped.model, 
        coords = qbtargetcfg['votingSystem']['votingStaff']['ped'].coords, 
        minusOne = qbtargetcfg['votingSystem']['votingStaff']['ped'].minusOne, 
        freeze = qbtargetcfg['votingSystem']['votingStaff']['ped'].freeze,
        invincible = qbtargetcfg['votingSystem']['votingStaff']['ped'].invincible, 
        blockevents = qbtargetcfg['votingSystem']['votingStaff']['ped'].blockevents, 
        target = { 
          options = input,
          distance = 2.5, 
        },
        spawnNow = true,
      })
    end
    if qbtargetcfg['votingSystem']['votingPoints']['active'] == true then
      local onSelect = {
        {
            type = "server",
            event = "ap-government:server:isRegistered",
            icon = "fas fa-sign-in-alt",
            label = "Vote For Candidate"
        }
      }
      if Config.VotingLaws then
        table.insert(onSelect, {
          type = "client",
          event = "ap-government:client:openLawVoting",
          icon = "fas fa-sign-in-alt",
          label = "Vote For Laws"
        })
      end
      for k,v in pairs(qbtargetcfg['votingSystem']['votingPoints']['points']) do
        if v.active == true then
          exports['qb-target']:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name=v.name,
            heading=v.heading,
            debugPoly=false, 
            minZ=v.minZ,
            maxZ=v.maxZ,
            }, {
              options = onSelect,
            distance = 2.5
          })
        end
      end
    end
    if qbtargetcfg['majorOffice']['active'] == true then
      local onSelect = {
        {
            type = "client",
            event = "ap-government:client:majorOffice",
            icon = "fas fa-sign-in-alt",
            label = "Major Options",
            job = {[qbtargetcfg['majorOffice']['job'].name] = qbtargetcfg['majorOffice']['job'].grade},
        }
      }
      for k,v in pairs(qbtargetcfg['majorOffice']['points']) do
        if v.active == true then
          exports['qb-target']:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name=v.name,
            heading=v.heading,
            debugPoly=false, 
            minZ=v.minZ,
            maxZ=v.maxZ,
            }, {
              options = onSelect,
            distance = 2.5
          })
        end
      end
    end
    if qbtargetcfg['appointmentsPed']['active'] == true then

      local options = {
        {
          type = "server",
          event = "ap-government:server:appointmentData", 
          icon = 'fas fa-sign-in-alt',
          label = 'Mayor Appointments'
        },
      }

      if Config.VotingLaws then
        table.insert(options, {
          type = "client",
          event = "ap-government:client:passedLaws", 
          icon = 'fas fa-sign-in-alt',
          label = 'Passed Laws'
        })
      end

      exports['qb-target']:SpawnPed({
        model = qbtargetcfg['appointmentsPed']['ped'].ped.model, 
        coords = qbtargetcfg['appointmentsPed']['ped'].coords, 
        minusOne = qbtargetcfg['appointmentsPed']['ped'].minusOne, 
        freeze = qbtargetcfg['appointmentsPed']['ped'].freeze,
        invincible = qbtargetcfg['appointmentsPed']['ped'].invincible, 
        blockevents = qbtargetcfg['appointmentsPed']['ped'].blockevents, 
        target = { 
          options = options,
          distance = 2.5, 
        },
        spawnNow = true,
      })
    end
  elseif oxTarget == true then
    if oxtargetcfg['votingSystem']['votingStaff']['active'] == true then
      local hash = GetHashKey(oxtargetcfg['votingSystem']['votingStaff']['ped'].ped.model)
  
      while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
      end

      local ent = CreatePed(0, hash, oxtargetcfg['votingSystem']['votingStaff']['ped'].coords.x, oxtargetcfg['votingSystem']['votingStaff']['ped'].coords.y, oxtargetcfg['votingSystem']['votingStaff']['ped'].coords.z, oxtargetcfg['votingSystem']['votingStaff']['ped'].coords[4], false, false)
  
      FreezeEntityPosition(ent,true)
      TaskSetBlockingOfNonTemporaryEvents(ent,true)
      SetEntityInvincible(ent,true)

      local input = {
        { 
          name = 'apply_candidate_menu',
          event = "ap-government:client:applyCandidate", 
          icon = 'fa-solid fa-sign-in-alt',
          label = 'Apply As Candidate'
        },
      }

      if Config.VotingSettings.Job then
        table.insert(input, {name = 'viewRequestedCandidates', event = "ap-government:client:staffVotingMenu", icon = 'fas fa-sign-in-alt', label = 'Voting Management', groups = oxtargetcfg['votingSystem']['votingStaff']['ped'].job.name})
      end
      
      exports["ox_target"]:addLocalEntity(ent, input)
    end
    if oxtargetcfg['votingSystem']['votingPoints']['active'] == true then
      local onSelect = {
        {
            name = "isRegistered",
            serverEvent = "ap-government:server:isRegistered",
            icon = "fas fa-sign-in-alt",
            label = "Vote For Candidate"
        }
      }
      if Config.VotingLaws then
        table.insert(onSelect, {
          name = "openLawVoting",
          event = "ap-government:client:openLawVoting",
          icon = "fas fa-sign-in-alt",
          label = "Vote For Laws"
        })
      end
      for k,v in pairs(oxtargetcfg['votingSystem']['votingPoints']['points']) do
        if v.active == true then
          exports.ox_target:addBoxZone({
            coords=v.coords,
            size=v.size,
            rotation=v.rotation, 
            debug=false,
            drawSprite=true,
            options=onSelect
          })
        end
      end
    end
    if oxtargetcfg['majorOffice']['active'] == true then
      local onSelect = {
        {
            name = "majorOffice",
            event = "ap-government:client:majorOffice",
            icon = "fas fa-sign-in-alt",
            label = "Major Options",
            groups = oxtargetcfg['majorOffice']['job'].name,
        }
      }
      for k,v in pairs(oxtargetcfg['majorOffice']['points']) do
        if v.active == true then
          exports.ox_target:addBoxZone({
            coords=v.coords,
            size=v.size,
            rotation=v.rotation, 
            debug=false,
            drawSprite=true,
            options=onSelect
          })
        end
      end
    end
    if oxtargetcfg['appointmentsPed']['active'] == true then
      local hash = GetHashKey(oxtargetcfg['appointmentsPed']['ped'].ped.model)
  
      while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
      end

    
      local ent = CreatePed(0, hash, oxtargetcfg['appointmentsPed']['ped'].coords, false, false)
  
      FreezeEntityPosition(ent,true)
      TaskSetBlockingOfNonTemporaryEvents(ent,true)
      SetEntityInvincible(ent,true)

      local input = {
        { 
          name = 'appointmentData',
          serverEvent = "ap-government:server:appointmentData", 
          icon = 'fa-solid fa-sign-in-alt',
          label = 'Mayor Appointments'
        },
      }

      if Config.VotingLaws then
        table.insert(input, {
          name = 'passedLaws',
          event = "ap-government:client:passedLaws", 
          icon = 'fa-solid fa-sign-in-alt',
          label = 'Passed Laws'
        })
      end

      exports["ox_target"]:addLocalEntity(ent, input)
    end
  end
end)

RegisterNetEvent('ap-government:target:appointmentData', function()
	TriggerServerEvent('ap-government:server:appointmentData')
end)

RegisterNetEvent('ap-government:target:isRegistered', function()
	TriggerServerEvent('ap-government:server:isRegistered')
end)

Citizen.CreateThread(function()
  local qtargetcfg = cfg['qtarget']
  if qTarget == true then
    if qtargetcfg['votingSystem']['votingStaff']['active'] == true then
      local hash = GetHashKey(qtargetcfg['votingSystem']['votingStaff']['ped'].ped.model)
  
      while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
      end

      local sex = 0
      if qtargetcfg['votingSystem']['votingStaff']['ped'].ped.sex == 'male' then
        sex = 4
      elseif qtargetcfg['votingSystem']['votingStaff']['ped'].ped.sex == 'female' then
        sex = 5
      end
    
      local ent = CreatePed(sex, hash, qtargetcfg['votingSystem']['votingStaff']['ped'].coords.x, qtargetcfg['votingSystem']['votingStaff']['ped'].coords.y, qtargetcfg['votingSystem']['votingStaff']['ped'].coords.z, qtargetcfg['votingSystem']['votingStaff']['ped'].coords.h, false, false)
  
      FreezeEntityPosition(ent,true)
      TaskSetBlockingOfNonTemporaryEvents(ent,true)
      SetEntityInvincible(ent,true)

      local input = {
        { 
          event = "ap-government:client:applyCandidate", 
          icon = 'fas fa-sign-in-alt',
          label = 'Apply As Candidate'
        },
      }

      if Config.VotingSettings.Job then
        table.insert(input, {event = "ap-government:client:staffVotingMenu", icon = 'fas fa-sign-in-alt', label = 'Voting Management', job = {[qtargetcfg['votingSystem']['votingStaff']['ped'].job.name] = qtargetcfg['votingSystem']['votingStaff']['ped'].job.grade}})
      end
      
      exports['qtarget']:AddTargetModel({qtargetcfg['votingSystem']['votingStaff']['ped'].ped.model}, {
        options = input,
        distance = 2.5,
      })
    end
    if qtargetcfg['appointmentsPed']['active'] == true then
      local hash = GetHashKey(qtargetcfg['appointmentsPed']['ped'].ped.model)
  
      while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
      end

      local sex = 0
      if qtargetcfg['appointmentsPed']['ped'].ped.sex == 'male' then
        sex = 4
      elseif qtargetcfg['appointmentsPed']['ped'].ped.sex == 'female' then
        sex = 5
      end
    
      local ent = CreatePed(sex, hash, qtargetcfg['appointmentsPed']['ped'].coords.x, qtargetcfg['appointmentsPed']['ped'].coords.y, qtargetcfg['appointmentsPed']['ped'].coords.z, qtargetcfg['appointmentsPed']['ped'].coords.h, false, false)
  
      FreezeEntityPosition(ent,true)
      TaskSetBlockingOfNonTemporaryEvents(ent,true)
      SetEntityInvincible(ent,true)

      local options = {
        {
          event = "ap-government:target:appointmentData", 
          icon = 'fas fa-sign-in-alt',
          label = 'Mayor Appointments'
        },
      }

      if Config.VotingLaws then
        table.insert(options, {
          event = "ap-government:client:passedLaws", 
          icon = 'fas fa-sign-in-alt',
          label = 'Passed Laws'
        })
      end

      exports['qtarget']:AddTargetModel({qtargetcfg['appointmentsPed']['ped'].ped.model}, {
        options = options,
        distance = 2.5,
      })
    end
    if qtargetcfg['votingSystem']['votingPoints']['active'] == true then
      local onSelect = {
        {
            event = "ap-government:target:isRegistered",
            icon = "fas fa-sign-in-alt",
            label = "Vote For Candidate"
        }
      }
      if Config.VotingLaws then
        table.insert(onSelect, {
          event = "ap-government:client:openLawVoting",
          icon = "fas fa-sign-in-alt",
          label = "Vote For Laws"
        })
      end
      for k,v in pairs(qtargetcfg['votingSystem']['votingPoints']['points']) do
        if v.active == true then
          exports['qtarget']:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name=v.name,
            heading=v.heading,
            debugPoly=false, 
            minZ=v.minZ,
            maxZ=v.maxZ,
            }, {
              options = onSelect,
            distance = 2.5
          })
        end
      end
    end
    if qtargetcfg['majorOffice']['active'] == true then
      local onSelect = {
        {
            event = "ap-government:client:majorOffice",
            icon = "fas fa-sign-in-alt",
            label = "Major Options",
            job = {[qtargetcfg['majorOffice']['job'].name] = qtargetcfg['majorOffice']['job'].grade},
        }
      }
      for k,v in pairs(qtargetcfg['majorOffice']['points']) do
        if v.active == true then
          exports['qtarget']:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name=v.name,
            heading=v.heading,
            debugPoly=false, 
            minZ=v.minZ,
            maxZ=v.maxZ,
            }, {
              options = onSelect,
            distance = 2.5
          })
        end
      end
    end
  end
end)

local GovControlPress = 0
GovControl = function (v)
  CreateThread(function()
    while GovControlPress ~= 0 do
      if IsControlPressed(0, 38) then
        exports[Config.FrameworkExport]:KeyPressed()
        if v.isServer == true then
          TriggerServerEvent(v.trigger)
        else
          TriggerEvent(v.trigger)
        end
        Citizen.Wait(1000)
      end
      Wait(0)
    end
  end)
end

CreateThread(function()
  local dcfg = cfg['DrawText']
  if Config.Interactions.drawText then
    for k, v in pairs(dcfg['govpoints']) do
        local govPoly = BoxZone:Create(vector3(v.pos.x, v.pos.y, v.pos.z), v.pos.length, v.pos.width, {
            heading = -20,
            name=v.pos.boxName,
            debugPoly = false,
            minZ = v.pos.z - 1,
            maxZ = v.pos.z + 1,
        })
        govPoly:onPlayerInOut(function(isPointInside)
            if isPointInside then
              if v.enable then
                if v.job.check then
                  if checkJob(v.job.name, v.job.grade) then
                    exports[Config.FrameworkExport]:DrawText(v.text,'left')
                    GovControl(v)
                    GovControlPress = k
                  end
                else
                  exports[Config.FrameworkExport]:DrawText(v.text,'left')
                  GovControl(v)
                  GovControlPress = k
                end
              end
            else
                GovControlPress = 0
                exports[Config.FrameworkExport]:HideText()
            end
        end)
    end  
  end
end)

local VotingControlPress = 0
function VotingControl()
  while VotingControlPress ~= 0 do
    if IsControlPressed(0, 38) then
      exports[Config.FrameworkExport]:KeyPressed()
      TriggerEvent('ap-government:client:drawtext:vote')
      Citizen.Wait(1000)
    end
    Wait(0)
  end
end

CreateThread(function()
  local dcfg = cfg['DrawText']
  if Config.Interactions.drawText then
    local votingPoly = {}
    for k, v in pairs(dcfg['votingPoints']) do
      votingPoly[#votingPoly+1] = BoxZone:Create(vector3(v.x, v.y, v.z), 1.35, 0.6, {
            heading = -20,
            name="voting"..k,
            debugPoly = false,
            minZ = v.z - 1,
            maxZ = v.z + 1,
        })
        local votingCombo = ComboZone:Create(votingPoly, {name = "votingPoly"})
        votingCombo:onPlayerInOut(function(isPointInside)
            if isPointInside then
                exports[Config.FrameworkExport]:DrawText("[E] Vote For Candidate",'left')
                VotingControl()
                VotingControlPress = k
            else
                VotingControlPress = 0
                exports[Config.FrameworkExport]:HideText()
            end
        end)
    end  
  end
end)

RegisterNetEvent('ap-government:client:drawtext:vote', function()
  local registerVoteMenu = ContextMenu({
    {
      header = "Register Your Vote",
      txt = "Click here to register your vote.",
      params = {
        isServer = true,
        event = "ap-government:server:isRegistered",
        args = {}
      }
    }
  })
end)

RegisterNetEvent('ap-government:client:drawtext:voteSystem', function()
  local job = cfg['DrawText']['govpoints']['voting'].job
  local VotingOptionsMenu = {
    {
      header = "Candidate Application",
      txt = "Apply/View Application Status.",
      params = {
        isServer = false,
        event = "ap-government:client:applyCandidate",
        args = {}
      }
    },
  }
  if Config.VotingSettings.Job then
    if checkJob(job.name, job.grade) then
      table.insert(VotingOptionsMenu, {header = LangClient[Config.Language].menus['staffVotingMenu_header_one'], txt = LangClient[Config.Language].menus['staffVotingMenu_txt_one'], params = {isServer = false, event = "ap-government:client:staffVotingMenu", args = {}}})
    end
  end
  ContextMenu(VotingOptionsMenu)
end)