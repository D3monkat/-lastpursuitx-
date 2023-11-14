---- Adjust the 'PLT.Clothing' table following according to the job clothes on your server.
PLT.Clothing={
	male ={
	--[[ Arms ]]		['arms'] = 67,							
	--[[ Tshirt ]] 		['tshirt_1'] = 85, 	 ['tshirt_2'] = 0,
	--[[ Torso Parts ]]	['torso_1'] = 177, 	 ['torso_2'] = 11,
	--[[ Decals ]]--	['decals_1'] = 0,  	 ['decals_2'] = 0,
	--[[ Pants ]] 		['pants_1'] = 67, 	 ['pants_2'] = 2,
	--[[ Shoes ]] 		['shoes_1'] = 22, 	 ['shoes_2'] = 1,
	--[[ Helmet ]] 		['helmet_1'] = 89, 	 ['helmet_2'] = 0,
	--[[ Chain ]]--		['chain_1'] = 0, 	 ['chain_2'] = 0,
	--[[ Ears  ]]--		['ears_1'] = -1, 	 ['ears_2'] = -1,
	--[[ Mask ]]--		['mask_1'] = 0, 	 ['mask_2'] = 0,
	--[[ Bag ]]--		['bags_1'] = 0, 	 ['bags_2'] = 0,
	--[[ Glasses ]]--	['glasses_1'] = -1,  ['glasses_2'] = -1,
	--[[ Bulletproof ]] ['bproof_1'] = 3,  	 ['bproof_2'] = 0,
	--[[ Watches ]]--	['watches_1'] = -1,  ['watches_2'] = -1,
	--[[ Bracelets ]]--	['bracelets_1'] = -1,['bracelets_2'] = -1,
	},
	female={
	--[[ Arms ]]		['arms'] = 0,
	--[[ Tshirt ]] 		['tshirt_1'] = 2, 	['tshirt_2'] = 0,
	--[[ Torso Parts ]] ['torso_1'] = 161, 	['torso_2'] = 0,
	--[[ Decals ]]-- 	['decals_1'] = 0, 	['decals_2'] = 0,
	--[[ Pants ]] 		['pants_1'] = 69, 	['pants_2'] = 0,
	--[[ Shoes ]] 		['shoes_1'] = 27, 	['shoes_2'] = 7,
	--[[ Helmet ]]-- 	['helmet_1'] = -1, 	['helmet_2'] = 0,
	--[[ Chain ]]-- 	['chain_1'] = 0, 	['chain_2'] = 0,
	--[[ Ears  ]]-- 	['ears_1'] = -1, 	['ears_2'] = 0,
	--[[ Mask ]]-- 		['mask_1'] = 0, 	['mask_2'] = 0,
	--[[ Bag ]]-- 		['bags_1'] = 0, 	['bags_2'] = 0,
	--[[ Glasses ]] 	['glasses_1'] = 18, ['glasses_2'] = 0,
	--[[ Bulletproof ]] ['bproof_1'] = 5,  	['bproof_2'] = 0,
	--[[ Watches ]]-- 	['watches_1'] = 0,  ['watches_2'] = 0,
	--[[ Bracelets ]]-- ['bracelets_1'] = 0,['bracelets_2'] = 0,
	}
}
function ChangeOutfit()
	ChangeOutfitStandalone()-- if you want to use the esx_skin or qb-clothing system; Deactivate the this function then Activate the following which you want.
	--ChangeOutfitEsx()		-- if you want to use the esx_skin system; Deactivate the ChangeOutfitStandalone() function then Activate the this function.
	--ChangeOutfitQB()		-- if you want to use the qb-clothing system; Deactivate the ChangeOutfitStandalone() function then Activate the this function.
	TriggerEvent("plt_lumberjack:ClotheChangeAnim")
end
function ChangeOutfitStandalone()
	if jobOutfitWorn then
		ApplyClothesStandalone(PedClothes)
		PedClothes = false
		jobOutfitWorn = false
	else
		local model = GetEntityModel(PlayerPedId())
		if model == 1885233650 then -- male
			ApplyClothesStandalone({
				['arms']        = PLT.Clothing.male.arms,					
				['tshirt_1']    = PLT.Clothing.male.tshirt_1, 	['tshirt_2']   = PLT.Clothing.male.tshirt_2,
				['torso_1']     = PLT.Clothing.male.torso_1, 	['torso_2']    = PLT.Clothing.male.torso_2,
				['decals_1']    = PLT.Clothing.male.decals_1, 	['decals_2']   = PLT.Clothing.male.decals_2,
				['pants_1']     = PLT.Clothing.male.pants_1, 	['pants_2']    = PLT.Clothing.male.pants_2,
				['shoes_1']     = PLT.Clothing.male.shoes_1, 	['shoes_2']    = PLT.Clothing.male.shoes_2,
				['helmet_1']    = PLT.Clothing.male.helmet_1, 	['helmet_2']   = PLT.Clothing.male.helmet_2,
				['chain_1']     = PLT.Clothing.male.chain_1, 	['chain_2']    = PLT.Clothing.male.chain_2,
				['ears_1']      = PLT.Clothing.male.ears_1, 	['ears_2']     = PLT.Clothing.male.ears_2,
				['mask_1']      = PLT.Clothing.male.mask_1, 	['mask_2']     = PLT.Clothing.male.mask_2,
				['bags_1']      = PLT.Clothing.male.bags_1, 	['bags_2']     = PLT.Clothing.male.bags_2,
				['glasses_1']   = PLT.Clothing.male.glasses_1, 	['glasses_2']  = PLT.Clothing.male.glasses_2,
				['bproof_1']    = PLT.Clothing.male.bproof_1, 	['bproof_2']   = PLT.Clothing.male.bproof_2,
				['watches_1']   = PLT.Clothing.male.watches_1, 	['watches_2']  = PLT.Clothing.male.watches_2,
				['bracelets_1'] = PLT.Clothing.male.bracelets_1,['bracelets_2']= PLT.Clothing.male.bracelets_2,
			})
			jobOutfitWorn = true
		elseif model == -1667301416 then --- female
			ApplyClothesStandalone({
				['arms']        = PLT.Clothing.female.arms,					
				['tshirt_1']    = PLT.Clothing.female.tshirt_1, 	['tshirt_2']   = PLT.Clothing.female.tshirt_2,
				['torso_1']     = PLT.Clothing.female.torso_1, 		['torso_2']    = PLT.Clothing.female.torso_2,
				['decals_1']    = PLT.Clothing.female.decals_1, 	['decals_2']   = PLT.Clothing.female.decals_2,
				['pants_1']     = PLT.Clothing.female.pants_1, 		['pants_2']    = PLT.Clothing.female.pants_2,
				['shoes_1']     = PLT.Clothing.female.shoes_1, 		['shoes_2']    = PLT.Clothing.female.shoes_2,
				['helmet_1']    = PLT.Clothing.female.helmet_1, 	['helmet_2']   = PLT.Clothing.female.helmet_2,
				['chain_1']     = PLT.Clothing.female.chain_1, 		['chain_2']    = PLT.Clothing.female.chain_2,
				['ears_1']      = PLT.Clothing.female.ears_1, 		['ears_2']     = PLT.Clothing.female.ears_2,
				['mask_1']      = PLT.Clothing.female.mask_1, 		['mask_2']     = PLT.Clothing.female.mask_2,
				['bags_1']      = PLT.Clothing.female.bags_1, 		['bags_2']     = PLT.Clothing.female.bags_2,
				['glasses_1']   = PLT.Clothing.female.glasses_1, 	['glasses_2']  = PLT.Clothing.female.glasses_2,
				['bproof_1']    = PLT.Clothing.female.bproof_1, 	['bproof_2']   = PLT.Clothing.female.bproof_2,
				['watches_1']   = PLT.Clothing.female.watches_1, 	['watches_2']  = PLT.Clothing.female.watches_2,
				['bracelets_1'] = PLT.Clothing.female.bracelets_1,  ['bracelets_2']= PLT.Clothing.female.bracelets_2,
			})
			jobOutfitWorn = true
		else
			Notification(__["clothesForYou"].type,__["clothesForYou"].text,__["clothesForYou"].duration)
		end
	end
end

function ChangeOutfitEsx()
	if jobOutfitWorn then
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end) 
		jobOutfitWorn = false
	else
		TriggerEvent('skinchanger:getSkin', function(skin)
			local model = GetEntityModel(PlayerPedId())
			if model == 1885233650 then -- male
				TriggerEvent('skinchanger:loadClothes', skin, {
					['arms']        = PLT.Clothing.male.arms,					
					['tshirt_1']    = PLT.Clothing.male.tshirt_1, 	['tshirt_2']   = PLT.Clothing.male.tshirt_2,
					['torso_1']     = PLT.Clothing.male.torso_1, 	['torso_2']    = PLT.Clothing.male.torso_2,
					['decals_1']    = PLT.Clothing.male.decals_1, 	['decals_2']   = PLT.Clothing.male.decals_2,
					['pants_1']     = PLT.Clothing.male.pants_1, 	['pants_2']    = PLT.Clothing.male.pants_2,
					['shoes_1']     = PLT.Clothing.male.shoes_1, 	['shoes_2']    = PLT.Clothing.male.shoes_2,
					['helmet_1']    = PLT.Clothing.male.helmet_1, 	['helmet_2']   = PLT.Clothing.male.helmet_2,
					['chain_1']     = PLT.Clothing.male.chain_1, 	['chain_2']    = PLT.Clothing.male.chain_2,
					['ears_1']      = PLT.Clothing.male.ears_1, 	['ears_2']     = PLT.Clothing.male.ears_2,
					['mask_1']      = PLT.Clothing.male.mask_1, 	['mask_2']     = PLT.Clothing.male.mask_2,
					['bags_1']      = PLT.Clothing.male.bags_1, 	['bags_2']     = PLT.Clothing.male.bags_2,
					['glasses_1']   = PLT.Clothing.male.glasses_1, 	['glasses_2']  = PLT.Clothing.male.glasses_2,
					['bproof_1']    = PLT.Clothing.male.bproof_1, 	['bproof_2']   = PLT.Clothing.male.bproof_2,
					['watches_1']   = PLT.Clothing.male.watches_1, 	['watches_2']  = PLT.Clothing.male.watches_2,
					['bracelets_1'] = PLT.Clothing.male.bracelets_1,['bracelets_2']= PLT.Clothing.male.bracelets_2,
				})
				jobOutfitWorn = true
			elseif model == -1667301416 then --- female
				TriggerEvent('skinchanger:loadClothes', skin, {
					['arms']        = PLT.Clothing.female.arms,					
					['tshirt_1']    = PLT.Clothing.female.tshirt_1, 	['tshirt_2']   = PLT.Clothing.female.tshirt_2,
					['torso_1']     = PLT.Clothing.female.torso_1, 		['torso_2']    = PLT.Clothing.female.torso_2,
					['decals_1']    = PLT.Clothing.female.decals_1, 	['decals_2']   = PLT.Clothing.female.decals_2,
					['pants_1']     = PLT.Clothing.female.pants_1, 		['pants_2']    = PLT.Clothing.female.pants_2,
					['shoes_1']     = PLT.Clothing.female.shoes_1, 		['shoes_2']    = PLT.Clothing.female.shoes_2,
					['helmet_1']    = PLT.Clothing.female.helmet_1, 	['helmet_2']   = PLT.Clothing.female.helmet_2,
					['chain_1']     = PLT.Clothing.female.chain_1, 		['chain_2']    = PLT.Clothing.female.chain_2,
					['ears_1']      = PLT.Clothing.female.ears_1, 		['ears_2']     = PLT.Clothing.female.ears_2,
					['mask_1']      = PLT.Clothing.female.mask_1, 		['mask_2']     = PLT.Clothing.female.mask_2,
					['bags_1']      = PLT.Clothing.female.bags_1, 		['bags_2']     = PLT.Clothing.female.bags_2,
					['glasses_1']   = PLT.Clothing.female.glasses_1, 	['glasses_2']  = PLT.Clothing.female.glasses_2,
					['bproof_1']    = PLT.Clothing.female.bproof_1, 	['bproof_2']   = PLT.Clothing.female.bproof_2,
					['watches_1']   = PLT.Clothing.female.watches_1, 	['watches_2']  = PLT.Clothing.female.watches_2,
					['bracelets_1'] = PLT.Clothing.female.bracelets_1,  ['bracelets_2']= PLT.Clothing.female.bracelets_2,
				})
				jobOutfitWorn = true
			else
				Notification(__["clothesForYou"].type,__["clothesForYou"].text,__["clothesForYou"].duration)
			end
		end) 
	end
end
function ChangeOutfitQB()
	if jobOutfitWorn then
		TriggerServerEvent("qb-clothes:loadPlayerSkin")
		jobOutfitWorn = false
	else
		local model = GetEntityModel(PlayerPedId())
		if model == 1885233650 then -- male
			local data = {
				["outfitName"] =  __["Blip_Name"],
				["outfitData"] = {
					["arms"]        = { item = PLT.Clothing.male.arms, 		 texture = 0},
					["t-shirt"]     = { item = PLT.Clothing.male.tshirt_1, 	 texture = PLT.Clothing.male.tshirt_2},
					["torso2"]      = { item = PLT.Clothing.male.torso_1, 	 texture = PLT.Clothing.male.torso_2},
					["decals"]      = { item = PLT.Clothing.male.decals_1, 	 texture = PLT.Clothing.male.decals_2},
					["pants"]       = { item = PLT.Clothing.male.pants_1, 	 texture = PLT.Clothing.male.pants_2},
					["shoes"]       = { item = PLT.Clothing.male.shoes_1, 	 texture = PLT.Clothing.male.shoes_2},
					["hat"]         = { item = PLT.Clothing.male.helmet_1, 	 texture = PLT.Clothing.male.helmet_2},
					["accessory"]   = { item = PLT.Clothing.male.chain_1, 	 texture = PLT.Clothing.male.chain_2},
					["ear"]         = { item = PLT.Clothing.male.ears_1, 	 texture = PLT.Clothing.male.ears_2},
					["mask"]        = { item = PLT.Clothing.male.mask_1, 	 texture = PLT.Clothing.male.mask_2},
					["bag"]         = { item = PLT.Clothing.male.bags_1, 	 texture = PLT.Clothing.male.bags_2},
					["glass"]       = { item = PLT.Clothing.male.glasses_1,  texture = PLT.Clothing.male.glasses_2},
					["vest"]        = { item = PLT.Clothing.male.bproof_1, 	 texture = PLT.Clothing.male.bproof_2},
					["watch"]       = { item = PLT.Clothing.male.watches_1,  texture = PLT.Clothing.male.watches_2},
					["bracelet"]    = { item = PLT.Clothing.male.bracelets_1,texture = PLT.Clothing.male.bracelets_2},
				}
			}
			TriggerEvent("qb-clothing:client:loadOutfit",data)
			jobOutfitWorn = true
		elseif model == -1667301416 then --- female
			local data = {
				["outfitName"] = __["Blip_Name"],
				["outfitData"] = {
					["arms"]        = { item = PLT.Clothing.female.arms, 	   texture = 0},
					["t-shirt"]     = { item = PLT.Clothing.female.tshirt_1,   texture = PLT.Clothing.female.tshirt_2},
					["torso2"]      = { item = PLT.Clothing.female.torso_1,    texture = PLT.Clothing.female.torso_2},
					["decals"]      = { item = PLT.Clothing.female.decals_1,   texture = PLT.Clothing.female.decals_2},
					["pants"]       = { item = PLT.Clothing.female.pants_1,    texture = PLT.Clothing.female.pants_2},
					["shoes"]       = { item = PLT.Clothing.female.shoes_1,    texture = PLT.Clothing.female.shoes_2},
					["hat"]         = { item = PLT.Clothing.female.helmet_1,   texture = PLT.Clothing.female.helmet_2},
					["accessory"]   = { item = PLT.Clothing.female.chain_1,    texture = PLT.Clothing.female.chain_2},
					["ear"]         = { item = PLT.Clothing.female.ears_1, 	   texture = PLT.Clothing.female.ears_2},
					["mask"]        = { item = PLT.Clothing.female.mask_1, 	   texture = PLT.Clothing.female.mask_2},
					["bag"]         = { item = PLT.Clothing.female.bags_1, 	   texture = PLT.Clothing.female.bags_2},
					["glass"]       = { item = PLT.Clothing.female.glasses_1,  texture = PLT.Clothing.female.glasses_2},
					["vest"]        = { item = PLT.Clothing.female.bproof_1,   texture = PLT.Clothing.female.bproof_2},
					["watch"]       = { item = PLT.Clothing.female.watches_1,  texture = PLT.Clothing.female.watches_2},
					["bracelet"]    = { item = PLT.Clothing.female.bracelets_1,texture = PLT.Clothing.female.bracelets_2},
				}
			}
			TriggerEvent("qb-clothing:client:loadOutfit",data)
			jobOutfitWorn = true
		else
			Notification(__["clothesForYou"].type,__["clothesForYou"].text,__["clothesForYou"].duration)
		end
	end
end
