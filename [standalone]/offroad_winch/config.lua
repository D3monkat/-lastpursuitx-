Config = {}

Config.Debug = false
Config.MaxLengthRope = 19.0
Config.ResyncRopeFrenquency = 10000 --ms
Config.VehicleModel = {'modelname'}         -- Spawn names of vehicles
Config.ValidModel = {
  [`modelname`] =  {                        -- Must match the model name above
    ropeBone = "engine",                    -- What part of the vehicle it should attach to (I dont reccomend you change this unless you know what you are doing)
    ropeOffset = vector3(0.0,0.94,-0.80),   -- X,Y,Z coordinates of where the rope should start from 
    ropeDistanceTake = 1.5                  -- Adjusts the distance you are able to grab the rope from
  }
}
Config.HookModel = 'prop_rope_hook_01'      -- DO not change unless you would like another prop to spawn when the winch is in hand

-- HOW TO SETUP TO ANY VEHICLE --

-- Add model names to: 
-- Config.VehicleModel = {'modelname','modelname2','modelname3','modelname4'} YOU CAN ADD AS MANY AS YOU LIKE

-- EXAMPLE of multiple vehicles:

-- Config2.VehicleModel = {'sof250','sof250bb','sof250bbk9','sof250slick','sof250slickk9','fd250life'}
-- Config2.ValidModel = {
--  [`sof250`] =  {
--    ropeBone = "engine",
--    ropeOffset = vector3(0.0,0.94,-0.80),
--    ropeDistanceTake = 1.5
--  },
--  [`sof250bb`] =  {
--    ropeBone = "engine",
--    ropeOffset = vector3(0.0,0.94,-0.80),
--    ropeDistanceTake = 1.5
--  },
--  [`sof250bbk9`] =  {
--   ropeBone = "engine",
--    ropeOffset = vector3(0.0,0.94,-0.80),
--    ropeDistanceTake = 1.5
--  },
--  [`sof250slick`] =  {
--    ropeBone = "engine",
--    ropeOffset = vector3(0.0,0.94,-0.80),
--   ropeDistanceTake = 1.5
--  },
--  [`sof250slickk9`] =  {
--    ropeBone = "engine",
--    ropeOffset = vector3(0.0,0.94,-0.80),
--    ropeDistanceTake = 1.5
--  },
--  [`fd250life`] =  {
--    ropeBone = "engine",
--    ropeOffset = vector3(0.0,0.94,-0.80),
--    ropeDistanceTake = 1.5
--  }
--}