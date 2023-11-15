--[[
---------------------------------------------------
LUXART VEHICLE CONTROL V3 (FOR FIVEM)
---------------------------------------------------
Coded by Lt.Caine
ELS Clicks by Faction
Additions by TrevorBarns
---------------------------------------------------
FILE: SIRENS.lua
PURPOSE: Associate specific sirens with specific
vehicles. Siren assignments. 
---------------------------------------------------
SIREN TONE TABLE: 
	ID- Generic Name	(SIREN STRING)									[vehicles.awc name]
	1 - Airhorn 		(SIRENS_AIRHORN)								[AIRHORN_EQD]
	2 - Wail 			(VEHICLES_HORNS_SIREN_1)						[SIREN_PA20A_WAIL]
	3 - Yelp 			(VEHICLES_HORNS_SIREN_2)						[SIREN_2]
	4 - Priority 		(VEHICLES_HORNS_POLICE_WARNING)					[POLICE_WARNING]
	5 - CustomA* 		(RESIDENT_VEHICLES_SIREN_WAIL_01)				[SIREN_WAIL_01]
	6 - CustomB* 		(RESIDENT_VEHICLES_SIREN_WAIL_02)				[SIREN_WAIL_02]
	7 - CustomC* 		(RESIDENT_VEHICLES_SIREN_WAIL_03)				[SIREN_WAIL_03]
	8 - CustomD* 		(RESIDENT_VEHICLES_SIREN_QUICK_01)				[SIREN_QUICK_01]
	9 - CustomE* 		(RESIDENT_VEHICLES_SIREN_QUICK_02)				[SIREN_QUICK_02]
	10 - CustomF* 		(RESIDENT_VEHICLES_SIREN_QUICK_03)				[SIREN_QUICK_03]
	11 - Powercall 		(VEHICLES_HORNS_AMBULANCE_WARNING)				[AMBULANCE_WARNING]
	12 - FireHorn	 	(VEHICLES_HORNS_FIRETRUCK_WARNING)				[FIRE_TRUCK_HORN]
	13 - Firesiren 		(RESIDENT_VEHICLES_SIREN_FIRETRUCK_WAIL_01)		[SIREN_FIRETRUCK_WAIL_01]
	14 - Firesiren2 	(RESIDENT_VEHICLES_SIREN_FIRETRUCK_QUICK_01)	[SIREN_FIRETRUCK_QUICK_01]
]]
-- CHANGE SIREN NAMES, AUDIONAME, AUDIOREF
RequestScriptAudioBank("DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_SAHP_NEW", false)
RequestScriptAudioBank("DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_BCSO_NEW", false)
RequestScriptAudioBank("DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_SANFIRE_NEW", false)
RequestScriptAudioBank("DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_LSPD_NEW", false)

SIRENS = {	
	--[[1]]	  { Name = "Main Horn", 	String = "SIRENS_AIRHORN", 						Ref = 0 }, --1
	--[[2]]	  { Name = "Main Wail", 	String = "VEHICLES_HORNS_SIREN_1", 					Ref = 0 }, --2
	--[[3]]	  { Name = "Main Yelp", 	String = "VEHICLES_HORNS_SIREN_2", 					Ref = 0 }, --3
	--[[4]]	  { Name = "Main Prio", 	String = "VEHICLES_HORNS_POLICE_WARNING", 				Ref = 0 }, --4
	--[[5]]	  { Name = "", 			String = "RESIDENT_VEHICLES_SIREN_WAIL_01", 				Ref = 0 }, --5
	--[[6]]	  { Name = "", 			String = "RESIDENT_VEHICLES_SIREN_WAIL_02", 				Ref = 0 }, --6
	--[[7]]	  { Name = "", 			String = "RESIDENT_VEHICLES_SIREN_WAIL_03", 				Ref = 0 }, --7
	--[[8]]	  { Name = "", 			String = "RESIDENT_VEHICLES_SIREN_QUICK_01", 				Ref = 0 }, --8
	--[[9]]	  { Name = "Second Wail",	String = "RESIDENT_VEHICLES_SIREN_QUICK_02",				Ref = 0 }, --9
	--[[10]]  { Name = "Powercall",		String = "RESIDENT_VEHICLES_SIREN_QUICK_03", 				Ref = 0 }, --10
	--[[11]]  { Name = "Powercall 2", 	String = "VEHICLES_HORNS_AMBULANCE_WARNING", 				Ref = 0 }, --11
	--[[12]]  { Name = "", 			String = "VEHICLES_HORNS_FIRETRUCK_WARNING", 				Ref = 0 }, --12
	--[[13]]  { Name = "Second Yelp", 	String = "RESIDENT_VEHICLES_SIREN_FIRETRUCK_WAIL_01", 			Ref = 0 }, --13
	--[[14]]  { Name = "Second Prio", 	String = "RESIDENT_VEHICLES_SIREN_FIRETRUCK_QUICK_01", 			Ref = 0 }, --14
	-- START OF SAS --
	--[[15]]  { Name = "Whelen Epsilon Alt HORN",         String = "OISS_SSA_VEHAUD_BCSO_NEW_HORN",             Ref = "OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET"}, --39
	--[[16]]  { Name = "Whelen Epsilon Alt Wail",         String = "OISS_SSA_VEHAUD_BCSO_NEW_SIREN_ADAM",       Ref = "OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET"}, --40
	--[[17]]  { Name = "Whelen Epsilon Alt Yelp",          String = "OISS_SSA_VEHAUD_BCSO_NEW_SIREN_BOY",        Ref = "OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET"}, --41
	--[[18]]  { Name = "Whelen Epsilon Alt Pri",      String = "OISS_SSA_VEHAUD_BCSO_NEW_SIREN_CHARLES",    Ref = "OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET"}, --42
	--[[19]]  { Name = "Whelen Epsilon Alt Pri2",        String = "OISS_SSA_VEHAUD_BCSO_NEW_SIREN_DAVID",      Ref = "OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET"}, --43
	--[[20]]  { Name = "New BCSO EDWARD",       String = "OISS_SSA_VEHAUD_BCSO_NEW_SIREN_EDWARD",     Ref = "OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET"}, --44
	--[[21]]  { Name = "Whelen Cencom Red Horn",         String = "OISS_SSA_VEHAUD_SAHP_NEW_HORN",             Ref = "OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET"}, --51
	--[[22]]  { Name = "Whelen Cencom Red Wail",         String = "OISS_SSA_VEHAUD_SAHP_NEW_SIREN_ADAM",       Ref = "OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET"}, --52
	--[[23]]  { Name = "Whelen Cencom Red Yelp",          String = "OISS_SSA_VEHAUD_SAHP_NEW_SIREN_BOY",        Ref = "OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET"}, --53
	--[[24]]  { Name = "Whelen Cencom Red Pri",      String = "OISS_SSA_VEHAUD_SAHP_NEW_SIREN_CHARLES",    Ref = "OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET"}, --54
	--[[25]]  { Name = "New SAHP DAVID",        String = "OISS_SSA_VEHAUD_SAHP_NEW_SIREN_DAVID",      Ref = "OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET"}, --55
	--[[26]]  { Name = "New SAHP EDWARD",       String = "OISS_SSA_VEHAUD_SAHP_NEW_SIREN_EDWARD",     Ref = "OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET"}, --56
	--[[27]]  { Name = "AFT Horn",     String = "OISS_SSA_VEHAUD_SANFIRE_NEW_HORN",          Ref = "OISS_SSA_VEHAUD_SANFIRE_NEW_SOUNDSET"}, --177
	--[[28]]  { Name = "AFT Q2 Wail",     String = "OISS_SSA_VEHAUD_SANFIRE_NEW_SIREN_ADAM",    Ref = "OISS_SSA_VEHAUD_SANFIRE_NEW_SOUNDSET"}, --178
	--[[29]]  { Name = "AFT Q2 Yelp",      String = "OISS_SSA_VEHAUD_SANFIRE_NEW_SIREN_BOY",     Ref = "OISS_SSA_VEHAUD_SANFIRE_NEW_SOUNDSET"}, --179
	--[[30]]  { Name = "AFT Powercall",  String = "OISS_SSA_VEHAUD_SANFIRE_NEW_SIREN_CHARLES", Ref = "OISS_SSA_VEHAUD_SANFIRE_NEW_SOUNDSET"}, --180
	--[[31]]  { Name = "New SanFire DAVID",    String = "OISS_SSA_VEHAUD_SANFIRE_NEW_SIREN_DAVID",   Ref = "OISS_SSA_VEHAUD_SANFIRE_NEW_SOUNDSET"}, --181
	--[[32]]  { Name = "New SanFire EDWARD",   String = "OISS_SSA_VEHAUD_SANFIRE_NEW_SIREN_EDWARD",  Ref = "OISS_SSA_VEHAUD_SANFIRE_NEW_SOUNDSET"}, --182
	--[[33]]  { Name = "Fed Sig SSP3000B Airhorn",         String = "OISS_SSA_VEHAUD_LSPD_NEW_HORN",             Ref = "OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET"}, --15
	--[[34]]  { Name = "Fed Sig SSP3000B Wail",         String = "OISS_SSA_VEHAUD_LSPD_NEW_SIREN_ADAM",       Ref = "OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET"}, --16
	--[[35]]  { Name = "Fed Sig SSP3000B Yelp",          String = "OISS_SSA_VEHAUD_LSPD_NEW_SIREN_BOY",        Ref = "OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET"}, --17
	--[[36]]  { Name = "Fed Sig SSP3000B Pri",      String = "OISS_SSA_VEHAUD_LSPD_NEW_SIREN_CHARLES",    Ref = "OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET"}, --18
	--[[37]]  { Name = "New LSPD DAVID",        String = "OISS_SSA_VEHAUD_LSPD_NEW_SIREN_DAVID",      Ref = "OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET"}, --19
	--[[38]]  { Name = "New LSPD EDWARD",       String = "OISS_SSA_VEHAUD_LSPD_NEW_SIREN_EDWARD",     Ref = "OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET"}, --20
	}

--ASSIGN SIRENS TO VEHICLES
SIREN_ASSIGNMENTS = {
	--['<gameName>'] = {tones},
	['DEFAULT'] = { 33, 34, 35, 36, }, 
	['FIRETRUK'] = { 12, 13, 14, }, 
	['AMBULAN'] = { 1, 2, 3, 4, 11 }, 
	['LGUARD'] = { 1, 2, 3, 4, 11 },
	--custom cars--
	
	--LSCSO--f TRPDCrownVic
	['trpdsilv'] = { 15, 16, 17, 18, 19, },
	['TRPDCrownVic'] = { 15, 16, 17, 18, 19, },
	['trpdbike'] = { 15, 16, 17, 18, 19, },
	['TRExp'] = { 15, 16, 17, 18, 19, },
	['TRExp2'] = { 15, 16, 17, 18, 19, },
		
	--SAHP--
	-- ['trpdsilv'] = { 21, 22, 23, 24, },
	['11cvpic3'] = { 21, 22, 23, 24, },
	['13capricec3'] = { 21, 22, 23, 24, },
	['13fpiuc3'] = { 21, 22, 23, 24, },
	['14chargerc3'] = { 21, 22, 23, 24, },
	['14tahoec3'] = { 21, 22, 23, 24, },
	['16fpiuc3'] = { 21, 22, 23, 24, },
	['18fpisc3'] = { 21, 22, 23, 24, },
	['19tahoec3'] = { 21, 22, 23, 24, },
	['20fpiuc3'] = { 21, 22, 23, 24, },
	['amggtrleo'] = { 21, 22, 23, 24, },
	['911turboleo'] = { 21, 22, 23, 24, },
	['mustang'] = { 21, 22, 23, 24, },
	['camaro'] = { 21, 22, 23, 24, },
	['challenger18'] = { 21, 22, 23, 24, },
	['2022bmw'] = { 21, 22, 23, 24, },
	['23gtruckbb'] = { 21, 22, 23, 24, },
	['broncobb'] = { 21, 22, 23, 24, },
	['viperleo'] = { 21, 22, 23, 24, },	
		
	--SAFR--
	['emsnspeedo'] = { 27, 28, 29, 30, },
	['emsambulance'] = { 27, 28, 29, 30, },
	['emstahoe'] = { 27, 28, 29, 30, },
	['emstahoe21'] = { 27, 28, 29, 30, },
	['emsraptor'] = { 27, 28, 29, 30, },
	
	--LSPD--
	['tr_pdvic'] = { 33, 34, 35, 36, },
	['tr_pdchar'] = { 33, 34, 35, 36, },
	['tr_pddm'] = { 33, 34, 35, 36, },
	['tr_pdexp'] = { 33, 34, 35, 36, },
	['tr_pdmstang'] = { 33, 34, 35, 36, },
	['tr_pdtaurus'] = { 33, 34, 35, 36, },
	['tr_pdcv'] = { 33, 34, 35, 36, },
	['clrgc8'] = { 33, 34, 35, 36, },
	['clrgcharger14'] = { 33, 34, 35, 36, },
	['polhuracan'] = { 33, 34, 35, 36, },
	['polbike'] = { 33, 34, 35, 36, },
	['polbike2'] = { 33, 34, 35, 36, },
	['polbike3'] = { 33, 34, 35, 36, },
	['polcamaro'] = { 33, 34, 35, 36, },
	['polchallenger'] = { 33, 34, 35, 36, },
	['polcharger'] = { 33, 34, 35, 36, },
	['poldurango'] = { 33, 34, 35, 36, },
	['polexplorer'] = { 33, 34, 35, 36, },
	['polgt4rs'] = { 33, 34, 35, 36, },
	['polmache'] = { 33, 34, 35, 36, },
	['polmustang'] = { 33, 34, 35, 36, },
	['polram'] = { 33, 34, 35, 36, },
	['polraptor'] = { 33, 34, 35, 36, },
	['poltahoe'] = { 33, 34, 35, 36, },
	['poltahoe21'] = { 33, 34, 35, 36, },
	['poltaurus'] = { 33, 34, 35, 36, },
	['polvette'] = { 33, 34, 35, 36, },
	['polvictoria'] = { 33, 34, 35, 36, },
	}