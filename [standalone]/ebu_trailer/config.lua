Config = {}

Config.CheckDistance = 11           -- Distance to check for nearby trailers
Config.InteractDistance = 2.5       -- Distance from point control works

Config.rampInstant = false          -- Instantly open/close ramp. Enable if ramps won't close

Config.AttachNotify = true                      -- Enable notifications
Config.NotiLoadMessage = 'Vehicle Loaded'
Config.NotiUnLoadMessage = 'Vehicle Unloaded'

Config.UseExternalTrailerConnect = false    -- Set to True if you want to use ebu_trailerconnect with the whitelist/blacklist control

--========Markers & Prompts=======--
--Increases tick rate from 0.01 to 0.08 - 0.1 when in range
Config.WaitTimer = 3000             -- Update rate to check for nearby trailer seconds * 1000 (Default 3000)
Config.ShowMarkers = true           -- Display markers at interaction points
Config.ShowHelp = true              -- Display help prompts
Config.MessageDistance = 2.0        -- Distance from point to display message (Default 2.0)
Config.Marker = {
    type = 1,                      -- marker shape: https://docs.fivem.net/docs/game-references/markers/ (Default 27)

    Size = 1.0,                     -- marker size (Default 2.0)

    Color = {                       -- RGBA color
        red = 100,
        green = 200,
        blue = 200,
        alpha = 150
    },
    heightOffset = 0.0,             -- Height from ground for marker. Marker at ground Z (Default 0.0)
    Bob = false,                    -- Marker bobbing up and down (Default false)
    faceCamera = false,             -- Marker always faces camera (Default false)
    rotate = false                  -- Marker rotates (Default false)
}
Config.Controlmessages = {
    RampInteract = " to interact with the ramp",
    AttachVehicle = " to Attach/Detach vehicle"
}

--========Trailers=======--
Config.Trailers = {
    [GetHashKey('3ctrailer')] = { 
        hasRamp = true,
        
        rampPos = {vector3(-2.0,-4.0,0.25),vector3(2.0,-4.0,0.25)},
        rampDoorNum = 5,
    },


    [GetHashKey('cotrailer')] = {        
        hasRamp = true,
        
        rampPos = {vector3(-2.0,-4.0,-0.55),vector3(2.0,-4.0,-0.55)},
        rampDoorNum = 5,
        
    },
    [GetHashKey('shauler')] = { 
        hasRamp = true,
        
        rampPos = {vector3(-2.0,-4.0,0.25),vector3(2.0,-4.0,0.25)},
        rampDoorNum = 5,
    },
    [GetHashKey('godzcoe')] = {
        hasRamp = false,
        
        rampPos = {vector3(-2.0,-4.0,-0.55),vector3(2.0,-4.0,-0.55)},
        rampDoorNum = 5,
    },
    [GetHashKey('thauler')] = {
        hasRamp = true,
        
        rampPos = {vector3(1.5, -3.0, -0.25), vector3(-1.5, -3.0, -0.25)},
        rampDoorNum = 5,
    },
    [GetHashKey('btrailer')] = {
        hasRamp = true,
        
        rampPos = {vector3(1.5, -3.0, -0.45), vector3(-1.5, -3.0, -0.45)},
        rampDoorNum = 5,
    },
    [GetHashKey('bclandscape')] = {
        hasRamp = true,
        
        rampPos = {vector3(1.5, -4.0, -0.45), vector3(-1.5, -4.0, -0.45)},
        rampDoorNum = 5,
    },
    [GetHashKey('trailersmall')] = {
        hasRamp = true,
        
        rampPos = {vector3(1.5, -4.0, -0.45), vector3(-1.5, -4.0, -0.45)},
        rampDoorNum = 5,
    },
    [GetHashKey('camperman')] = { 
        hasRamp = true,
        
        rampPos = {vector3(2.0, -6.0, 0.1), vector3(-1.5, -6.0, 0.1)},
        rampDoorNum = 4,
    },
    [GetHashKey('chauler')] = {

        attNode = 'boot',
        heightOff = 0.5,
        hasRamp = true,
        
        rampPos = {vector3(1.5, -2.7, -0.25), vector3(-1.5, -2.7, -0.25)},
        rampDoorNum = 5,    
    },
    [GetHashKey('cartrailer')] = {
        hasRamp = true,
        
        rampPos = {vector3(1.5, -3.7, -1.0), vector3(-1.5, -3.7, -1.0)},
        isRampExtra = true,
        rampDoorNum = 5,
 
    },
    [GetHashKey('semihauler')] = {
        hasRamp = true,
        
        rampPos = {vector3(-1.8, -7.5, -1.4), vector3(1.8, -7.5, -1.4)},
        rampDoorNum = 5,    
    },
    [GetHashKey('bigtex40')] = {
        hasRamp = true,
        
        rampPos = {vector3(-1.8, -5.0, -0.8), vector3(1.8, -5.0, -0.8)},
        rampDoorNum = 5,    
    },
    [GetHashKey('bigtex20')] = {  --bigtex20hasRamp = true,
        
        rampPos = {vector3(-1.8, -3.0, -0.8), vector3(1.8, -3.0, -0.8)},
        rampDoorNum = 5,    
    },
    [GetHashKey('godzhauler')] = {
        hasRamp = true,
        
        rampPos = {vector3(-1.8, -5.0, 0.1), vector3(1.8, -5.0, 0.1)},
        rampDoorNum = 5,    
    },
    [GetHashKey('godzenclosed')] = { 
        hasRamp = true,
        
        rampPos = {vector3(-1.8, -5.5, -0.5), vector3(1.8, -5.5, -0.5)},
        isRampExtra = true,
        rampDoorNum = 3,
        doorwithRampNums = {2,3},
  
    },
    [GetHashKey('enclosedgoose')] = {
        hasRamp = true,
        
        rampPos = {vector3(-1.8, -5.5, -0.5), vector3(1.8, -5.5, -0.5)},
        rampDoorNum = {0,5},    
    },
    [GetHashKey('godzbenson')] = {  

        hasRamp = true,
        
        rampPos = {vector3(-1.8, -5.5, -1.0), vector3(1.8, -5.5, -1.0)},
        rampDoorNum = 5,    
    },
    [GetHashKey('trailers3')] = {
        hasRamp = true,
        
        rampPos = {vector3(-1.8, -5.5, -3.0), vector3(1.8, -5.5, -3.0)},
        rampDoorNum = 5,    
    },
    [GetHashKey('trflat')] = {
        hasRamp = false,
        
        rampPos = {vector3(-1.8, -5.5, 0.0), vector3(1.8, -5.5, 0.0)},
        rampDoorNum = 5,    
    },
    [GetHashKey('17fontaine')] = {  
        hasRamp = false,
        
        rampPos = {vector3(-1.8, -5.5, -3.0), vector3(1.8, -5.5, -3.0)},
        rampDoorNum = 5,    
    },
    [GetHashKey('17fontainev2')] = {
        hasRamp = false,
        
        rampPos = {vector3(-1.8, -5.5, -3.0), vector3(1.8, -5.5, -3.0)},
        rampDoorNum = 5,    
    },
    [GetHashKey('17fontainev3')] = {
        hasRamp = false,
        
        rampPos = {vector3(-1.8, -5.5, -3.0), vector3(1.8, -5.5, -3.0)},
        rampDoorNum = 5,    
    },
    [GetHashKey('17fontainev4')] = {
        hasRamp = false,
        
        rampPos = {vector3(-1.8, -5.5, -3.0), vector3(1.8, -5.5, -3.0)},
        rampDoorNum = 5,    
    },
    [GetHashKey('20fttrailer')] = { 
        hasRamp = true,
        
        rampPos = {vector3(1.5, -3.7, -1.0), vector3(-1.5, -3.7, -1.0)},
        isRampExtra = true,
        rampDoorNum = 3,
   
    },
    [GetHashKey('8220b')] = {

        hasRamp = true,
        
        rampPos = {vector3(-1.8, -3.0, -0.1), vector3(1.8, -3.0, -0.1)},
        rampDoorNum = 5,    
    },
    [GetHashKey('8220')]= { 

        hasRamp = true,
        
        rampPos = {vector3(-1.8, -3.0, -0.1), vector3(1.8, -3.0, -0.1)},
        rampDoorNum = 5,
        
    },
    [GetHashKey('8250')] = { 
        hasRamp = true,
        
        rampPos = {vector3(-1.8, -9.0, 0.1), vector3(1.8, -9.0, 0.1)},
        rampDoorNum = 5,    
    },
    [GetHashKey('pjutility')] = { 
        hasRamp = true,
        
        rampPos = {vector3(1.5, -3.0, 0.2), vector3(-1.5, -3.0, 0.2)},
        rampDoorNum = 5,
    },
    [GetHashKey('bigtexb')] = { 
        hasRamp = true,
        
        rampPos = {vector3(2.5, -4.0, -1.0), vector3(-2.5, -4.0, -1.0)},
        rampDoorNum = 5,
    },
    [GetHashKey('ehauler')] = { 

        hasRamp = true,
        
        rampPos = {vector3(-1.8, -5.5, -0.0), vector3(1.8, -5.5, -0.0)},
        rampDoorNum = 5,    
    },
    [GetHashKey('pjtrailer')] = {
        hasRamp = true,
        
        rampPos = {vector3(-1.8, -5.0,  -1.0), vector3(1.8, -5.0,  -1.0)},
        rampDoorNum = 5,    
    },
    [GetHashKey('ctrailer')] = {  
        hasRamp = true,
        
        rampPos = {vector3(-1.8, -5.5, -0.6), vector3(1.8, -5.5, -0.6)},
        rampDoorNum = 5,    
    },
    [GetHashKey('btex20')] = {
        hasRamp = true,
        
        rampPos = {vector3(2.0, -5.0, -0.0), vector3(-2.0, -5.0, 0.0)},
        rampDoorNum = 5,

    },
    [GetHashKey('40ft')] = {
        hasRamp = true,
        
        rampPos = {vector3(-1.8, -5.0, -0.8), vector3(1.8, -5.0, -0.8)},
        isRampExtra = true,
        rampDoorNum = 3,

    },
    [GetHashKey('eagerbeaver')] = {
        hasRamp = true,
        
        rampPos = {vector3(2.0, -5.0, -0.0), vector3(-2.0, -5.0, 0.0)},
        rampDoorNum = 5,
        
    },
    [GetHashKey('valdeztrailer')] = {
        hasRamp = true,
        
        rampPos = {vector3(1.5, -3.0, -0.45), vector3(-1.5, -3.0, -0.45)},
        rampDoorNum = 5,
    },
    [GetHashKey('zJuksCarHauler40ft')] = {
        hasRamp = true,
        
        rampPos = {vector3(-1.8, -12.0, 0.1), vector3(1.8, -12.0, 0.1)},
        isRampExtra = true,
        rampDoorNum = 6,
    },

    [GetHashKey('trailkinght')] = {
        hasRamp = true,

        rampPos = {vector3(-1.8, -5.0, -0.8), vector3(1.8, -5.0, -0.8)},
        isRampExtra = true,
        rampDoorNum =  {8,9},
    },
    [GetHashKey('boogie36ftr')] = {
        hasRamp = true,
        
        rampPos = {vector3(-1.8, -5.0, -0.8), vector3(1.8, -5.0, -0.8)},
        isRampExtra = true,
        rampDoorNum = 1,
    },
}

--========Vehicles with Toggled Extras=======--

-- Can be hashes or strings
Config.TogVehs = {  
    ['kamacho'] = {1},
}