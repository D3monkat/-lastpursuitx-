local vu_vanilla = GetInteriorAtCoords(113.652557, -1300.96277, 37.40684)

	-- change this:
	
	-- 1 = normal bed, red light
	-- 2 = prison roleplay
	-- 3 = bdsm
	-- 4 = hospital roleplay
	-- example: vu_red4 enabled means that in the "red" room entityset "hospital" will be enabled
	
	-- "red" room
	EnableInteriorProp(vu_vanilla, "vu_red1")
	DisableInteriorProp(vu_vanilla, "vu_red2")
	DisableInteriorProp(vu_vanilla, "vu_red3")
	DisableInteriorProp(vu_vanilla, "vu_red4")
	
	-- "pink" room
	DisableInteriorProp(vu_vanilla, "vu_pink1")
	EnableInteriorProp(vu_vanilla, "vu_pink2")
	DisableInteriorProp(vu_vanilla, "vu_pink3")
	DisableInteriorProp(vu_vanilla, "vu_pink4")
	
	-- "purple" room
	DisableInteriorProp(vu_vanilla, "vu_purple1")
	DisableInteriorProp(vu_vanilla, "vu_purple2")
	EnableInteriorProp(vu_vanilla, "vu_purple3")
	DisableInteriorProp(vu_vanilla, "vu_purple4")
	
	-- "blue" room
	DisableInteriorProp(vu_vanilla, "vu_blue1")
	DisableInteriorProp(vu_vanilla, "vu_blue2")
	DisableInteriorProp(vu_vanilla, "vu_blue3")
	EnableInteriorProp(vu_vanilla, "vu_blue4")
	
	-- EnableInteriorProp means an entityset is ENABLED
	-- DisableInteriorProp means an entityset is DISABLED
	-- Only ONE entityset per room should be enabled at one time, rooms are named after colors: red, pink, purple, blue
	
RefreshInterior(vu_vanilla)	