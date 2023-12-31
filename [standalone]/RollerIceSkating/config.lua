
-- The slot defined here  must be the same slot where you find the roller shoes in your clothing menu (some offset can be needed +1 -1)
-- For example, in your clothing menu if you are a men and the roller shoes are the slot 44 then in the config the slot RollerSlotHomme 
-- should be 44 (again sometimes if you have a lot of addon cloth you can have an offset +1 -1 on it so perhaps 43 or 45)
Config = {
    MaxSpeedKmh = 20,
	MaxSpeedSprintKmh = 35,
    maxJumpHeigh = 5.0,
    LoseConnectionDistance = 50.0,
	
	
	RollerSlotHomme = 7,    -- Model Slot for men
	RollerSlotFemme = 3,   -- Model Slot for women
	RollerColorHomme = 2,   -- Color for men
	RollerColorFemme = 0,   -- Color for women
	
	ICERollerSlotHomme = 1,   -- Model Slot for men
	ICERollerSlotFemme = 1,   -- Model Slot for women
	ICERollerColorHomme = 4,  -- Color for men
	ICERollerColorFemme = 5,  -- Color for women
	
	
	-- RollerSlotHomme = 7,
	-- RollerSlotFemme = 3,
	-- RollerColorHomme = 2,
	-- RollerColorFemme = 2,
}

UseCommands = true -- this is the defaut state of the script, if true you can access to the roller by doing /iceroller or /roller
UseCommandsLeave = true -- this is the defaut state of the script, if true you can take off roller/iceroller by doing /leave

-- If commands are disable you can access to the roller by 2 event : pata_roller:iceroller and pata_roller:roller they work exactly the same has the commands
-- so if you trigger pata_roller:iceroller you will put your iceroller on your foot, if your doing a second trigger on this event the shoes are taken off
-- pata_roller:leaveroller is the last event, it just remove the shoes / iceshoes (if you have it)