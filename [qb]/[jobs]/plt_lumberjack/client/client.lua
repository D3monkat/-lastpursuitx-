__["uiCuttingMoney"]  =PLT.Salaries.cutting.."$"
__["uiStacking1Money"]=PLT.Salaries.stacking.eachWoodPile.."$"
__["uiStacking2Money"]=PLT.Salaries.stacking.eachForklift.."$"
__["uiDelivery1Money"]=PLT.Salaries.delivery.truckEndOfTheJob.."$"
__["uiDelivery2Money"]=(PLT.Info.delivery.MinGasolinePayment*2).."$".." & "..(PLT.Info.delivery.MaxGasolinePayment*2).."$"
playerPedId,playerServerId,playerCoord = PlayerPedId(), GetPlayerServerId(PlayerId()),vector3(0.0,0.0,0.0)
workStage, scaleType ,scaleString = nil, nil, nil
flipTime,FPS = 0,120
permenantNotificationText,NuiActive,PedClothes,jobOutfitWorn,playerJobName,playerJobGrade,wayPoindActive,WoodPileOnProcess,InfoOnProcess,lastWoodPileOnProcess,updateConstructionsOnAction = false,false,false,false,false,false,false,false,false,false
Network,InfoServer,InfoServerTable,objeGrounds,InfoConstructionsTable,playerVehicles= {entities={},infos={}},{},{},{},{},{}
wpfwc = {[1]={0.0,4.0,0.4},[2]={0.0,0.0,0.4},[3]={0.0,-4.5,0.85},[4]={0.0,-4.5,0.85}}
objeGrounds={[1] = 0.360,[2] = 0.360,[3] = 0.350,[4] = 0.340,[5] = 0.335,[6] = 0.330,[7] = 0.330,[8] = 0.330,[9] = 0.330,[10] = 0.330,[11] = 0.325,[12] = 0.320,[13] = 0.315,[14] = 0.310,[15] = 0.305,[16] = 0.295,[17] = 0.290,[18] = 0.285,[19] = 0.280,[20] = 0.275,[21] = 0.270,[22] = 0.265,[23] = 0.260,[24] = 0.255,[25] = 0.255,[26] = 0.255,[27] = 0.255,[28] = 0.255,[29] = 0.255,[30] = 0.255,[31] = 0.260,[32] = 0.260,[33] = 0.260,[34] = 0.260,[35] = 0.265,[36] = 0.268,[37] = 0.270,[38] = 0.270,[39] = 0.270,[40] = 0.271,[41] = 0.273,[42] = 0.275,[43] = 0.282,[44] = 0.284,[45] = 0.285,[46] = 0.287,[47] = 0.289,[48] = 0.291,[49] = 0.293,[50] = 0.295,[51] = 0.297,[52] = 0.299,[53] = 0.300,[54] = 0.301,[55] = 0.302,[56] = 0.303,[57] = 0.305,[58] = 0.307,[59] = 0.308,[60] = 0.310,[61] = 0.310,[62] = 0.310,[63] = 0.310,[64] = 0.310,[65] = 0.310,[66] = 0.310,[67] = 0.310,[68] = 0.310,[69] = 0.310,[70] = 0.310,[71] = 0.310,[72] = 0.310,[73] = 0.310,[74] = 0.310,[75] = 0.310,[76] = 0.310,[77] = 0.310,[78] = 0.310,[79] = 0.310,[80] = 0.310,[81] = 0.310,[82] = 0.310,[83] = 0.310,[84] = 0.307,[85] = 0.304,[86] = 0.301,[87] = 0.298,[88] = 0.295,[89] = 0.293,[90] = 0.290,[91] = 0.288,[92] = 0.286,[93] = 0.284,[94] = 0.282,[95] = 0.280,[96] = 0.278,[97] = 0.276,[98] = 0.274,[99] = 0.272,[100] = 0.270,[101] = 0.268,[102] = 0.266,[103] = 0.264,[104] = 0.262,[105] = 0.260,[106] = 0.258,[107] = 0.256,[108] = 0.254,[109] = 0.252,[110] = 0.250,[111] = 0.248,[112] = 0.246,[113] = 0.244,[114] = 0.242,[115] = 0.240,[116] = 0.238,[117] = 0.236,[118] = 0.234,[119] = 0.232,[120] = 0.230,[121] = 0.228,[122] = 0.226,[123] = 0.224,[124] = 0.220,[125] = 0.218,[126] = 0.216,[127] = 0.214,[128] = 0.212,[129] = 0.210,[130] = 0.208,[131] = 0.206,[132] = 0.204,[133] = 0.202,[134] = 0.200,[135] = 0.200,}
animInfos ={
	["felling"] = {wait = 5000, dict ="core", particleName = "ent_brk_wood_planks", offSets={{0.10,-0.1,-0.1100},{0.15,-0.1,-0.1125},{0.20,-0.1,-0.1150},{0.25,-0.1,-0.1175},{0.30,-0.1,-0.1200},{0.35,-0.1,-0.1225},{0.40,-0.1,-0.1250},{0.45,-0.1,-0.1275},{0.50,-0.1,-0.1300},{0.55,-0.1,-0.1325},},},
	["wood"]    = {wait = 5555, dict ="core", particleName = "ent_brk_wood_planks", offSets={{0.10,-0.1,-0.0300},{0.15,-0.1,-0.0325},{0.20,-0.1,-0.0350},{0.25,-0.1,-0.0375},{0.30,-0.1,-0.0400},{0.35,-0.1,-0.0425},{0.40,-0.1,-0.0450},{0.45,-0.1,-0.0475},{0.50,-0.1,-0.0500},{0.55,-0.1,-0.0525},},},
	["leaves"]  = {wait = 2222, dict ="core", particleName = "ent_brk_tree_leaves", offSets={{0.10,-0.1,-0.0300},{0.15,-0.1,-0.0325},{0.20,-0.1,-0.0350},{0.25,-0.1,-0.0375},{0.30,-0.1,-0.0400},{0.35,-0.1,-0.0425},{0.40,-0.1,-0.0450},{0.45,-0.1,-0.0475},{0.50,-0.1,-0.0500},{0.55,-0.1,-0.0525},{0.10,-0.1,-0.1100},{0.15,-0.1,-0.1125},{0.20,-0.1,-0.1150},{0.25,-0.1,-0.1175},{0.30,-0.1,-0.1200},{0.35,-0.1,-0.1225},{0.40,-0.1,-0.1250},{0.45,-0.1,-0.1275},{0.50,-0.1,-0.1300},{0.55,-0.1,-0.1325},},},
}
Citizen.CreateThread(function()
	PLT.Info.cutting.treeInfos = {}
	PLT.Info.delivery.truckTrailerInfos = {}
	refrehPedBlip()
	CreateActionPed()
	UpdateJobBlips()
	TriggerServerEvent("plt_lumberjack:GiveMeInfo")
	local playerToJobAction = 1000
	local actionlWait
 	Citizen.CreateThread(function()
		while true do Citizen.Wait(10000)
			if workStage == "cutting" or playerToJobAction < 500 then 
				CalculateFPS()
			end
		end
	end) 
	while true do actionlWait = 1000
		playerToJobAction = #(vector3(PLT.ActionCoords.x,PLT.ActionCoords.y,PLT.ActionCoords.z) - playerCoord)
		if playerToJobAction < 25 and not NuiActive then 	
			actionlWait = 0
			DrawMarker(6,PLT.ActionCoords.x,PLT.ActionCoords.y,PLT.ActionCoords.z-1,  0.0, 0.0, 0.0, -90, -90, -90, -1.0, 1.0, 1.0, 0, 0, 0,255,false, false, 2, false, false, false, false)
			if playerToJobAction < 2.5 then 
				if SetupButton(__["interactionToAction"].button,__["interactionToAction"].text,__["interactionToAction"].key) then OpenUi() end
			end
		elseif playerToJobAction > 500 then
			actionlWait = 5000
			if workStage ~= nil and workStage ~= "delivery" then 
				if playerToJobAction < 600 then 
					Notification(__["jobWillCancelAwayToCenter"].type,__["jobWillCancelAwayToCenter"].text,__["jobWillCancelAwayToCenter"].duration)
				else
					Notification(__["jobCancelledAwayToCenter"].type,__["jobCancelledAwayToCenter"].text,__["jobCancelledAwayToCenter"].duration)
					CancelJob()
				end
			end
		elseif workStage == nil then
			for k,v in pairs(PLT.Info.delivery.readyTrucks) do
				local x = PLT.Info.delivery.truckTrailer[k]
				v = #(x.deliveryActionCoord - playerCoord)
				if v < 20 then  actionlWait = 0
					DrawMarker(39,x.deliveryActionCoord.x,x.deliveryActionCoord.y,x.deliveryActionCoord.z, 0, 0.50, 0, 0, 0, 0, 1.0,1.0,1.0, 0, 0, 255, 150, true, 0.10, 0, 1, 0, 0.0, 0)  
					if v < 2 and SetupButton(__["interactionToDelivery"].button,__["interactionToDelivery"].text,__["interactionToDelivery"].key) then 
						TriggerServerEvent("plt_lumberjack:CanStartJob","delivery",k)
					end
				end
			end
		end
		Citizen.Wait(actionlWait)
	end
end)
Citizen.CreateThread(function()
	while true do Citizen.Wait(1000)
		playerPedId = PlayerPedId()
		playerCoord = GetEntityCoords(playerPedId)
		if workStage ~= nil then 
			CheckNetworkEntites()
			SyncTelehandlerExtras()
		end
		if workStage == nil then 
			UpdateReadyTruckTrailer()
		elseif workStage == "cutting" then 
			if Network.infos.inTelehandler  and Network.infos.chainSawAttached == true then
				AttachChainSawTeleHandler()
			elseif not Network.infos.inTelehandler and  Network.infos.chainSawAttached ~= true then 
				AttachChainSawToPedAnim()
			end
			Network.infos.inTelehandler = IsPedInVehicle(playerPedId,Network.entities.telehandler ,false)
			Network.infos.telehandlerToDelete = #(PLT.Info.cutting.telehandlerDeleteCoord - GetEntityCoords(Network.entities.telehandler))
			UpdateTreeInfos()
		elseif workStage == "stacking" then 
			Network.infos.forkliftCoord =  GetEntityCoords(Network.entities.forklift)
			Network.infos.inForklift = IsPedInVehicle(playerPedId,Network.entities.forklift ,false)
			Network.infos.forkliftToDelete = #(PLT.Info.stacking.forkliftDeleteCoord-Network.infos.forkliftCoord)
			UpdateTruckTrailerInfos()
		elseif workStage == "delivery" then 
			if Network.entities.woodPileOnForklift then 
				if Network.infos.forksCoord and Network.infos.forkliftCoord and calDistance(Network.infos.forksCoord.z,Network.infos.forkliftCoord.z-0.4) < 0.3 then 
					DeleteNetworkEntity(Network.entities.woodPileOnForklift)
					Network.entities.woodPileOnForklift = nil
					SetNetworkVehicleExtra(Network.entities.forklift,1,0)
					SetForkliftForkHeight(Network.entities.forklift,0.1)
				end
			end
		end
	end
end)
Citizen.CreateThread(function()
	while true do Citizen.Wait(1000)
		while workStage == "cutting" do Citizen.Wait(0)
			playerCoord = GetEntityCoords(playerPedId)
			if Network.infos.inTelehandler and Network.infos.telehandlerToDelete < 50 then 
				Network.infos.telehandlerToDelete = #(PLT.Info.cutting.telehandlerDeleteCoord - playerCoord)
				DrawMarker(6,PLT.Info.cutting.telehandlerDeleteCoord.x,PLT.Info.cutting.telehandlerDeleteCoord.y,PLT.Info.cutting.telehandlerDeleteCoord.z,0.0, 0.0, 0.0,-90,-90,-90, 6.0,6.0,6.0,0,0,0,50,false, true, 2, false, false, false, false) 
				DrawMarker(24,PLT.Info.cutting.telehandlerDeleteCoord.x,PLT.Info.cutting.telehandlerDeleteCoord.y,PLT.Info.cutting.telehandlerDeleteCoord.z+(Network.infos.telehandlerToDelete/10)+1, 0, 0, 0, 0, 0, 0, 0.5,0.5,0.5, 255, 0, 0, 100, true, 0.10, 0, 1, 0, 0.0, 0)  
				DrawMarker(6, PLT.Info.cutting.telehandlerDeleteCoord.x,PLT.Info.cutting.telehandlerDeleteCoord.y,PLT.Info.cutting.telehandlerDeleteCoord.z+(Network.infos.telehandlerToDelete/10)+1, 0, 0, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 255, 255, 100, false, 0.10, 0, 0, 0, 0.0, 0)
			end
			if Network.infos.inTelehandler and Network.infos.telehandlerToDelete < 3 then 
				if SetupButton(__["interactionCompltCutting"].button,__["interactionCompltCutting"].text,__["interactionCompltCutting"].key) then 
					if type(Network.infos.tree2Attached) == "number" and type(Network.infos.tree3Attached) == "number" and type(Network.infos.tree4Attached) == "number" then
						Notification(__["deliveyWoodToStand"].type,string.format(__["deliveyWoodToStand"].text,PLT.Blips.cutting.deliveryWoodsName),__["deliveyWoodToStand"].duration)
					else
						CancelJob()	 
					end
				end
			elseif Network.infos.OnCuttingTreeRoot then
				Citizen.Wait(1000)
			elseif Network.infos.CuttedTreeNum == nil then
				if PLT.Info.cutting.treeInfos.closest then 
					permenantNotification(__["goForCuttableTree"])
					DrawMarker(28,PLT.Info.cutting.trees[PLT.Info.cutting.treeInfos.closest].coord.x,PLT.Info.cutting.trees[PLT.Info.cutting.treeInfos.closest].coord.y,PLT.Info.cutting.trees[PLT.Info.cutting.treeInfos.closest].coord.z+0.63,  0.0, 0.0, 0.0, 0, 0, 0, 1.0, 1.0, 0.1, 100, 255, 100,255,false, false, 2, false, false, false, false)
					if PLT.Info.cutting.treeInfos.rondoms then 
						DrawMarker(28,PLT.Info.cutting.trees[PLT.Info.cutting.treeInfos.rondoms].coord.x,PLT.Info.cutting.trees[PLT.Info.cutting.treeInfos.rondoms].coord.y,PLT.Info.cutting.trees[PLT.Info.cutting.treeInfos.rondoms].coord.z+0.63,  0.0, 0.0, 0.0, 0, 0, 0, 1.0, 1.0, 0.1, 255, 255, 100,255,false, false, 2, false, false, false, false)
					end
					if #(playerCoord - PLT.Info.cutting.trees[PLT.Info.cutting.treeInfos.closest].coord) < 3 and not Network.infos.inTelehandler then
						if SetupButton(__["interactionWantCuttinTree"].button,__["interactionWantCuttinTree"].text,__["interactionWantCuttinTree"].key) then
							playerCoord = GetEntityCoords(playerPedId)
							local newhead = GetHeadingFromVector_2d(PLT.Info.cutting.trees[PLT.Info.cutting.treeInfos.closest].coord.x-playerCoord.x,PLT.Info.cutting.trees[PLT.Info.cutting.treeInfos.closest].coord.y-playerCoord.y) 
							newhead = newhead <= 270 and newhead + 90 or newhead - 270
							local min = 360 local newAngleForFelling for kc2,v2 in pairs(PLT.Info.cutting.trees[PLT.Info.cutting.treeInfos.closest]) do  if type(kc2)== "number" then if calDistance(kc2,newhead) < min then min = calDistance(kc2,newhead)newAngleForFelling = kc2 end end end
							if CanCutThisHeading(PLT.Info.cutting.treeInfos.closest,newAngleForFelling) then 
								TriggerServerEvent("plt_lumberjack:CanICutTree",PLT.Info.cutting.treeInfos.closest,newAngleForFelling)
								local overTimeStatus = true Citizen.CreateThread(function() Citizen.Wait(30000)  overTimeStatus = false end)								
								while PLT.Info.cutting.trees[PLT.Info.cutting.treeInfos.closest].status == true and overTimeStatus do Citizen.Wait(100) end Citizen.Wait(1000) break
							else
								Notification(__["cantFellingThisHeading"].type,__["cantFellingThisHeading"].text,__["cantFellingThisHeading"].duration)
							end
						end
					end
				end
			else
				if Network.infos.woodReady  == nil then 
					permenantNotification(__["goForCutWood"])
					if not Network.infos.coords.tree30 then 
					elseif Network.infos.leaves3Cutted == nil then
						Network.infos.plyrToCutting = #(vec2(Network.infos.coords.leaves30.x,Network.infos.coords.leaves30.y)-vec2(playerCoord.x,playerCoord.y))
						DrawMarker(0, Network.infos.coords.leaves30.x,Network.infos.coords.leaves30.y,Network.infos.coords.leaves30.z+0.5, 0, 0, 0, 0, 0, 0, 0.75,0.75,0.75, 0, 255, 0, 100, true, 0.10, 0, 1, 0, 0.0, 0)
 						if  Network.infos.plyrToCutting < 2.5 and CheckPressed() and PlayAnimCutting(PLT.Info.cutting.trees[Network.infos.CuttedTreeNum].entities.leaves3,"leaves",{0.90,  0.75, 0.60},{-0.90,  0.75, 0.60}) then 
							TriggerServerEvent("plt_lumberjack:OnCuttingTree","leaves3",Network.infos.CuttedTreeNum,Network.infos.CuttedTreeHeading)
							Network.infos.leaves3Cutted = true
						end   
					elseif Network.infos.leaves4Cutted == nil then 
						Network.infos.plyrToCutting = #(vec2(Network.infos.coords.leaves40.x,Network.infos.coords.leaves40.y)-vec2(playerCoord.x,playerCoord.y))
						DrawMarker(0, Network.infos.coords.leaves40.x,Network.infos.coords.leaves40.y,Network.infos.coords.leaves40.z+0.5, 0, 0, 0, 0, 0, 0, 0.75,0.75,0.75, 0, 255, 0, 100, true, 0.10, 0, 1, 0, 0.0, 0)
 						if  Network.infos.plyrToCutting < 2.5 and CheckPressed() and PlayAnimCutting(PLT.Info.cutting.trees[Network.infos.CuttedTreeNum].entities.leaves4,"leaves",{1.30,  0.75, 0.25},{-1.30,  0.75, 0.25}) then 
							TriggerServerEvent("plt_lumberjack:OnCuttingTree","leaves4",Network.infos.CuttedTreeNum,Network.infos.CuttedTreeHeading)
							Network.infos.leaves4Cutted = true
						end   
					elseif Network.infos.tree5Cutted == nil then 
						Network.infos.plyrToCutting = #(vec2(Network.infos.coords.tree50.x,Network.infos.coords.tree50.y)-vec2(playerCoord.x,playerCoord.y))
						DrawMarker(0, Network.infos.coords.tree50.x,Network.infos.coords.tree50.y,Network.infos.coords.tree50.z+0.5, 0, 0, 0, 0, 0, 0, 0.75,0.75,0.75, 0, 255, 0, 100, true, 0.10, 0, 1, 0, 0.0, 0)
 						if Network.infos.plyrToCutting < 2.5  and CheckPressed() and PlayAnimCutting(PLT.Info.cutting.trees[Network.infos.CuttedTreeNum].entities.tree5,"wood",{0.8,  0.81,  0.350},{-0.8,  0.81,  -0.350}) then 
							TriggerServerEvent("plt_lumberjack:OnCuttingTree","tree5",Network.infos.CuttedTreeNum,Network.infos.CuttedTreeHeading)
							Network.infos.tree5Cutted = true
						end  
					elseif Network.infos.tree4Cutted == nil then 
						Network.infos.plyrToCutting = #(vec2(Network.infos.coords.tree40.x,Network.infos.coords.tree40.y)-vec2(playerCoord.x,playerCoord.y))
						DrawMarker(0, Network.infos.coords.tree40.x,Network.infos.coords.tree40.y,Network.infos.coords.tree40.z+0.5, 0, 0, 0, 0, 0, 0, 0.75,0.75,0.75, 0, 255, 0, 100, true, 0.10, 0, 1, 0, 0.0, 0)
 						if  Network.infos.plyrToCutting  < 2.5  and CheckPressed() and PlayAnimCutting(PLT.Info.cutting.trees[Network.infos.CuttedTreeNum].entities.tree4,"wood",{0.9,0.75,0.425},{-0.9,0.75,-0.250}) then 
							TriggerServerEvent("plt_lumberjack:OnCuttingTree","tree4",Network.infos.CuttedTreeNum,Network.infos.CuttedTreeHeading)
							Network.infos.tree4Cutted = true
						end  
					elseif Network.infos.tree3Cutted == nil then 
						Network.infos.plyrToCutting = #(vec2(Network.infos.coords.tree30.x,Network.infos.coords.tree30.y)-vec2(playerCoord.x,playerCoord.y))
						DrawMarker(0, Network.infos.coords.tree30.x,Network.infos.coords.tree30.y,Network.infos.coords.tree30.z+0.5, 0, 0, 0, 0, 0, 0, 0.75,0.75,0.75, 0, 255, 0, 100, true, 0.10, 0, 1, 0, 0.0, 0)
 						if  Network.infos.plyrToCutting < 2.5 and CheckPressed() and PlayAnimCutting(PLT.Info.cutting.trees[Network.infos.CuttedTreeNum].entities.tree3,"wood",{0.8,  0.725,  0.350},{-0.8,  0.725,  -0.350}) then 
							TriggerServerEvent("plt_lumberjack:OnCuttingTree","tree3",Network.infos.CuttedTreeNum,Network.infos.CuttedTreeHeading)
							Network.infos.tree3Cutted = true
						end
					end
				elseif not Network.infos.inTelehandler then 
					permenantNotification(__["needGetInTelehandler"]) 
					Network.infos.coords.Telehandler = GetOffsetFromEntityInWorldCoords(Network.entities.telehandler,  0.0,   0.0,  3.50)		
					DrawMarker(39,Network.infos.coords.Telehandler.x,Network.infos.coords.Telehandler.y,Network.infos.coords.Telehandler.z, 0, 0.50, 0, 0, 0, 0, 1.0,1.0,1.0, 0, 0, 255, 150, true, 0.10, 0, 1, 0, 0.0, 0)  
				elseif Network.infos.tree2Attached == nil or Network.infos.tree3Attached == nil or Network.infos.tree4Attached == nil then
					Network.infos.kepceCoord  =	GetWorldPositionOfEntityBone(Network.entities.telehandler,35)  
					Network.infos.telehandlerHeading = GetEntityHeading(Network.entities.telehandler)
					permenantNotification(__["loadWoodToTelehandler"])
					if Network.infos.tree2Attached == nil then 	
						Network.infos.tree2Dist = #(Network.infos.coords.woodObj2-Network.infos.kepceCoord)
						if Network.infos.tree2Dist < 3 then
							if calDistancePieceOfWooodHeading(Network.infos.coords.woodObj2Heading,Network.infos.telehandlerHeading) then 
								if Network.infos.tree2Dist < 0.7 and calDistance(Network.infos.coords.woodObj2.z,Network.infos.kepceCoord.z) < 0.4 then 
									TriggerServerEvent("plt_lumberjack:CanDeleteLocalWood",Network.infos.CuttedTreeNum,"tree2")
									Network.infos.tree2Attached = ApplyExtraToTeleHandler(PLT.Props.tree2,PLT.Info.cutting.trees[Network.infos.CuttedTreeNum].entities.tree2)
								else
									permenantNotification(__["forksNeedCloserToMarker"])
									DrawMarker(28,Network.infos.coords.woodObj2.x,Network.infos.coords.woodObj2.y,Network.infos.coords.woodObj2.z,0.0, 0.0, 0.0,0,0,0, 0.35 ,0.35 ,0.35 ,255,0,0,255,false, true, 2, false, false, false, false) 
									DrawMarker(28,Network.infos.kepceCoord.x,Network.infos.kepceCoord.y,Network.infos.kepceCoord.z,0.0, 0.0, 0.0,0,0,0, 0.25 ,0.25 ,0.25 ,255,0,0,255,false, true, 2, false, false, false, false) 
								end
							else
								permenantNotification(__["forksNeedParallelMarker"])
								ShapeBoxDraw(vector3(Network.infos.coords.woodObj2A.x,Network.infos.coords.woodObj2A.y,Network.infos.coords.woodObj2A.z),(Network.infos.coords.woodObj2Rot.y+Network.infos.coords.woodObj2Rot.z), 2.0, 0.25, 0.1,255,0,0,255)
								ShapeBoxDraw(vector3(Network.infos.coords.woodObj2B.x,Network.infos.coords.woodObj2B.y,Network.infos.coords.woodObj2B.z),(Network.infos.coords.woodObj2Rot.y+Network.infos.coords.woodObj2Rot.z), 2.0, 0.25, 0.1,255,0,0,255)
							end
						else
							DrawMarker(0, Network.infos.coords.woodObj2.x,Network.infos.coords.woodObj2.y,Network.infos.coords.woodObj2.z+1.5, 0, 0, 0, 0, 0, 0, 0.75,0.75,0.75, 0, 255, 0, 100, true, 0.10, 0, 1, 0, 0.0, 0)
						end
					end
					if Network.infos.tree3Attached == nil then 
						Network.infos.tree3Dist = #(Network.infos.coords.woodObj3-Network.infos.kepceCoord)
						if Network.infos.tree3Dist < 3 then 
							if calDistancePieceOfWooodHeading(Network.infos.coords.woodObj3Heading,Network.infos.telehandlerHeading) then 
								if Network.infos.tree3Dist  < 0.7 and calDistance(Network.infos.coords.woodObj3.z,Network.infos.kepceCoord.z) < 0.4 then 
									TriggerServerEvent("plt_lumberjack:CanDeleteLocalWood",Network.infos.CuttedTreeNum,"tree3")
									Network.infos.tree3Attached = ApplyExtraToTeleHandler(PLT.Props.tree3,PLT.Info.cutting.trees[Network.infos.CuttedTreeNum].entities.tree3)
								else
									permenantNotification(__["forksNeedCloserToMarker"])
									DrawMarker(28,Network.infos.coords.woodObj3.x,Network.infos.coords.woodObj3.y,Network.infos.coords.woodObj3.z,0.0, 0.0, 0.0,0,0,0, 0.35 ,0.35 ,0.35 ,255,0,0,255,false, true, 2, false, false, false, false) 
									DrawMarker(28,Network.infos.kepceCoord.x,Network.infos.kepceCoord.y,Network.infos.kepceCoord.z,0.0, 0.0, 0.0,0,0,0, 0.25 ,0.25 ,0.25 ,255,0,0,255,false, true, 2, false, false, false, false) 
								end
							else
								permenantNotification(__["forksNeedParallelMarker"])
								ShapeBoxDraw(vector3(Network.infos.coords.woodObj3A.x,Network.infos.coords.woodObj3A.y,Network.infos.coords.woodObj3A.z),(Network.infos.coords.woodObj3Rot.y+Network.infos.coords.woodObj3Rot.z), 2.0, 0.25, 0.1,255,0,0,255)
								ShapeBoxDraw(vector3(Network.infos.coords.woodObj3B.x,Network.infos.coords.woodObj3B.y,Network.infos.coords.woodObj3B.z),(Network.infos.coords.woodObj3Rot.y+Network.infos.coords.woodObj3Rot.z), 2.0, 0.25, 0.1,255,0,0,255)
							end
						else 
							DrawMarker(0, Network.infos.coords.woodObj3.x,Network.infos.coords.woodObj3.y,Network.infos.coords.woodObj3.z+1.5, 0, 0, 0, 0, 0, 0, 0.75,0.75,0.75, 0, 255, 0, 100, true, 0.10, 0, 1, 0, 0.0, 0)
						end
					end
					if Network.infos.tree4Attached == nil then 
						Network.infos.tree4Dist = #(Network.infos.coords.woodObj4-Network.infos.kepceCoord)
						if Network.infos.tree4Dist < 3 then 
							if calDistancePieceOfWooodHeading(Network.infos.coords.woodObj4Heading,Network.infos.telehandlerHeading) then 
								if Network.infos.tree4Dist  < 0.7 and calDistance(Network.infos.coords.woodObj4.z,Network.infos.kepceCoord.z) < 0.4 then  
									TriggerServerEvent("plt_lumberjack:CanDeleteLocalWood",Network.infos.CuttedTreeNum,"tree4")
									Network.infos.tree4Attached = ApplyExtraToTeleHandler(PLT.Props.tree4,PLT.Info.cutting.trees[Network.infos.CuttedTreeNum].entities.tree4)
								else
									permenantNotification(__["forksNeedCloserToMarker"])
									DrawMarker(28,Network.infos.coords.woodObj4.x,Network.infos.coords.woodObj4.y,Network.infos.coords.woodObj4.z,0.0, 0.0, 0.0,0,0,0, 0.35 ,0.35 ,0.35 ,255,0,0,255,false, true, 2, false, false, false, false) 
									DrawMarker(28,Network.infos.kepceCoord.x,Network.infos.kepceCoord.y,Network.infos.kepceCoord.z,0.0, 0.0, 0.0,0,0,0, 0.25 ,0.25 ,0.25 ,255,0,0,255,false, true, 2, false, false, false, false) 
								end
							else
								permenantNotification(__["forksNeedParallelMarker"])
								ShapeBoxDraw(vector3(Network.infos.coords.woodObj4A.x,Network.infos.coords.woodObj4A.y,Network.infos.coords.woodObj4A.z),(Network.infos.coords.woodObj4Rot.y+Network.infos.coords.woodObj4Rot.z), 2.0, 0.25, 0.1,255,0,0,255)
								ShapeBoxDraw(vector3(Network.infos.coords.woodObj4B.x,Network.infos.coords.woodObj4B.y,Network.infos.coords.woodObj4B.z),(Network.infos.coords.woodObj4Rot.y+Network.infos.coords.woodObj4Rot.z), 2.0, 0.25, 0.1,255,0,0,255)
							end
						else
							DrawMarker(0, Network.infos.coords.woodObj4.x,Network.infos.coords.woodObj4.y,Network.infos.coords.woodObj4.z+1.5, 0, 0, 0, 0, 0, 0, 0.75,0.75,0.75, 0, 255, 0, 100, true, 0.10, 0, 1, 0, 0.0, 0)
						end
					end 
				elseif Network.infos.tree2Attached ~= true and Network.infos.tree3Attached ~= true and Network.infos.tree4Attached ~= true then
					Network.infos.kepceCoord  =	GetWorldPositionOfEntityBone(Network.entities.telehandler , 35	)
					Network.infos.kepceToDelivery = #(vec2(Network.infos.kepceCoord.x,Network.infos.kepceCoord.y)-vec2(PLT.Info.cutting.deliveryWoodPoint.x,PLT.Info.cutting.deliveryWoodPoint.y))
					if  Network.infos.kepceToDelivery < 1.5 and calDistance(Network.infos.kepceCoord.z,PLT.Info.cutting.deliveryWoodPoint.z) < 0.2  then
						FreezeEntityPosition(Network.entities.telehandler, true)
						local tree2ToTelehandler =  CreateLocalObject(PLT.Props.tree3, playerCoord.x, playerCoord.y,playerCoord.z,-5)
						local tree3ToTelehandler =  CreateLocalObject(PLT.Props.tree3, playerCoord.x, playerCoord.y,playerCoord.z,-5)
						local tree4ToTelehandler =  CreateLocalObject(PLT.Props.tree3, playerCoord.x, playerCoord.y,playerCoord.z,-5)
						AttachEntityToEntity(tree2ToTelehandler, Network.entities.telehandler, 35, -1.85, -0.25, 0.35, 0.0, 90.0, 0.0, false, false, false, false, 2, true) 
						AttachEntityToEntity(tree3ToTelehandler, Network.entities.telehandler, 35, -1.85, -0.85, 0.35, 0.0, 90.0, 0.0, false, false, false, false, 2, true) 
						AttachEntityToEntity(tree4ToTelehandler, Network.entities.telehandler, 35, -1.85, -1.45, 0.35, 0.0, 90.0, 0.0, false, false, false, false, 2, true) 
						TriggerServerEvent("plt_lumberjack:CanAddPieceWoodToStand",Network.infos.CuttedTreeNum,GetEntityCoords(tree2ToTelehandler),GetEntityCoords(tree3ToTelehandler),GetEntityCoords(tree4ToTelehandler))
						DeleteEntity(tree2ToTelehandler)DeleteEntity(tree3ToTelehandler)DeleteEntity(tree4ToTelehandler)		
						SetNetworkVehicleExtra(Network.entities.telehandler,1,1)SetNetworkVehicleExtra(Network.entities.telehandler,2,1)SetNetworkVehicleExtra(Network.entities.telehandler,3,1)
						Network ={infos = {bone = Network.infos.bone},entities = {telehandler = Network.entities.telehandler,chainSaw = Network.entities.chainSaw}}
						SetNewWaypoint(PLT.Info.cutting.telehandlerDeleteCoord.x,PLT.Info.cutting.telehandlerDeleteCoord.y)
						Citizen.CreateThread(function()
							Citizen.Wait(4000)
							FreezeEntityPosition(Network.entities.telehandler, false)
						end)
					elseif Network.infos.kepceToDelivery < 20 then 
						permenantNotification(__["dropWoodsLikeMarker"])
						DrawMarker(42,PLT.Info.cutting.deliveryWoodPoint.x,    PLT.Info.cutting.deliveryWoodPoint.y,      PLT.Info.cutting.deliveryWoodPoint.z+0.36,0.0, 0.0, 0.0,200.0, 90.0, 0.0, 0.70, 90.5, 0.70, 80, 67, 33,255,false, false, 2, false, false, false, false)
						DrawMarker(42,PLT.Info.cutting.deliveryWoodPoint.x+0.55,PLT.Info.cutting.deliveryWoodPoint.y-0.20,PLT.Info.cutting.deliveryWoodPoint.z+0.38,0.0, 0.0, 0.0,200.0, 90.0, 0.0, 0.70, 90.5, 0.70, 80, 67, 33,255,false, false, 2, false, false, false, false)
						DrawMarker(42,PLT.Info.cutting.deliveryWoodPoint.x-0.55,PLT.Info.cutting.deliveryWoodPoint.y+0.20,PLT.Info.cutting.deliveryWoodPoint.z+0.34,0.0, 0.0, 0.0,200.0, 90.0, 0.0, 0.70, 90.5, 0.70, 80, 67, 33,255,false, false, 2, false, false, false, false)
						ShapeBoxDraw(vector3(PLT.Info.cutting.deliveryTelehandlerPoint.x,PLT.Info.cutting.deliveryTelehandlerPoint.y,PLT.Info.cutting.deliveryTelehandlerPoint.z-0.15), PLT.Info.cutting.deliveryTelehandlerPoint.w, 2.50,  5.0, 0.30,255,255,0,100)
						DrawMarker(39,PLT.Info.cutting.deliveryTelehandlerPoint.x,PLT.Info.cutting.deliveryTelehandlerPoint.y,PLT.Info.cutting.deliveryTelehandlerPoint.z+3, 0, 0.50, 0, 0, 0, 0, 1.0,1.0,1.0, 90, 67, 33, 255, true, 0.10, 0, 1, 0, 0.0, 0) 
						
					else
						PltSetNewWaypoint(PLT.Info.cutting.deliveryTelehandlerPoint.x,PLT.Info.cutting.deliveryTelehandlerPoint.y)
						permenantNotification(string.format(__["moveWoodsToDeliveryPoint"],PLT.Blips.cutting.deliveryWoodsName))
						Network.infos.mSize = Network.infos.kepceToDelivery/20 > 5 and 5.0 or Network.infos.kepceToDelivery/20
						DrawMarker(39,PLT.Info.cutting.deliveryTelehandlerPoint.x,PLT.Info.cutting.deliveryTelehandlerPoint.y,PLT.Info.cutting.deliveryTelehandlerPoint.z+1+(math.max(Network.infos.kepceToDelivery/10,2.0)), 0, 0.50, 0, 0, 0, 0, Network.infos.mSize,Network.infos.mSize,Network.infos.mSize, 90, 67, 33, 255, true, 0.10, 0, 1, 0, 0.0, 0) 		
						DrawMarker(6,PLT.Info.cutting.deliveryTelehandlerPoint.x,PLT.Info.cutting.deliveryTelehandlerPoint.y,PLT.Info.cutting.deliveryTelehandlerPoint.z+1+(math.max(Network.infos.kepceToDelivery/10,2.0)), 0, 0, 0, 0, 0, 0, Network.infos.mSize+1,Network.infos.mSize+1,Network.infos.mSize+1, 255, 255, 255, 100, false, 0.90, 0, 0, 0, 0.0, 0)
						if  Network.infos.kepceToDelivery > 70 then 
							DrawMarker(22,-556.5620, 5380.230, 74.00684, 0.0,0.0, 0.0,  0.0,105.0,0.0,0.75,0.75,0.75, 0, 0, 255, 200, false, 0, 0, 0, 0, 0, 0)  
							DrawMarker(6,-556.5620, 5380.230, 74.00684, 0, 0, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 255, 255, 100, false, 0.90, 0, 0, 0, 0.0, 0)
						end
					end					
				end
			end		
		end
 		while workStage == "stacking" do Citizen.Wait(0)
			Network.infos.forkliftCoord =  GetEntityCoords(Network.entities.forklift)
			if not Network.infos.forkliftToDelete or  Network.infos.forkliftToDelete < 30 then 
				Network.infos.forkliftToDelete = #(PLT.Info.stacking.forkliftDeleteCoord-Network.infos.forkliftCoord)
				DrawMarker(6,PLT.Info.stacking.forkliftDeleteCoord.x,PLT.Info.stacking.forkliftDeleteCoord.y,PLT.Info.stacking.forkliftDeleteCoord.z-0.35,0.0, 0.0, 0.0,-90,-90,-90, 6.0,6.0,6.0,0,0,0,50,false, true, 2, false, false, false, false) 
				DrawMarker(24,PLT.Info.stacking.forkliftDeleteCoord.x,PLT.Info.stacking.forkliftDeleteCoord.y,PLT.Info.stacking.forkliftDeleteCoord.z+(Network.infos.forkliftToDelete/10)+2, 0, 0, 0, 0, 0, 0, 0.5,0.5,0.5, 255, 0, 0, 100, true, 0.10, 0, 1, 0, 0.0, 0)  
				DrawMarker(6, PLT.Info.stacking.forkliftDeleteCoord.x,PLT.Info.stacking.forkliftDeleteCoord.y,PLT.Info.stacking.forkliftDeleteCoord.z+(Network.infos.forkliftToDelete/10)+2, 0, 0, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 255, 255, 100, false, 0.10, 0, 0, 0, 0.0, 0)
			end
			if not Network.infos.inForklift then 
				Network.infos.inForklift = IsPedInVehicle(playerPedId,Network.entities.forklift ,false)
				permenantNotification(__["needGetInForklift"])
				DrawMarker(39,Network.infos.forkliftCoord.x,Network.infos.forkliftCoord.y,Network.infos.forkliftCoord.z+2.5, 0, 0.50, 0, 0, 0, 0, 1.0,1.0,1.0, 0, 0, 255, 150, true, 0.10, 0, 1, 0, 0.0, 0)  
			elseif Network.infos.forkliftToDelete  < 1 then
				if Network.infos.woodPile then 
					if SetupButton(__["interactionDropToWoodPile"].button,__["interactionDropToWoodPile"].text,__["interactionDropToWoodPile"].key) then
						Network.infos.woodPile = nil
						SetNetworkVehicleExtra(Network.entities.forklift,1,1) 
						TriggerServerEvent("plt_lumberjack:AddWoodPile") 
						UpdateJobBlips()
					end
				else
					if SetupButton(__["interactionCompltStacking"].button,__["interactionCompltStacking"].text,__["interactionCompltStacking"].key) then					
						CancelJob()
					end
				end
			elseif not Network.infos.woodPile then
				Network.infos.forkliftCoord =  GetEntityCoords(Network.entities.forklift)
				Network.infos.anyWoodPilePalaceAvaible = anyAvaiblePalacaForWoodPile()
				Network.infos.anyForkliftPalaceAvaible = anyAvaiblePalacaForForklift()
				if PLT.Info.stacking.standCoord[1].obje and Network.infos.anyForkliftPalaceAvaible and Network.infos.anyWoodPilePalaceAvaible then 
					permenantNotification(__["takeWoodOrParkForklift"])
				elseif PLT.Info.stacking.standCoord[1].obje and Network.infos.anyWoodPilePalaceAvaible then 
					permenantNotification(__["goTakeWoodpile"])
				elseif Network.infos.anyForkliftPalaceAvaible then
					permenantNotification(__["goParkForklift"])
				else
					permenantNotification(__["noMoreJobStacking"])
				end
				for kt2,vt2 in pairs(PLT.Info.delivery.truckTrailer) do
					if vt2.AvaibleToStacking == true and vt2.entities.woodPile1 ~= nil and  vt2.entities.woodPile2 ~= nil  and vt2.entities.forklift == nil then 
						Network.infos.anyForkliftPalaceAvaible = true
						Network.infos.forkliftToTrailer = #(Network.infos.forkliftCoord-vt2.forkliftWorldCooord)
						if Network.infos.forkliftToTrailer < 3.5 then
							Network.infos.forkliftHeading = GetEntityHeading(Network.entities.forklift)
							ShapeBoxDraw(vector3(vt2.forkliftWorldCooord.x,vt2.forkliftWorldCooord.y,vt2.forkliftWorldCooord.z-0.5), vt2.coord.w, 2.0, 3.10, 0.2,0,255,0,50)
							ShapeBoxDraw(vector3(Network.infos.forkliftCoord.x,Network.infos.forkliftCoord.y,Network.infos.forkliftCoord.z-0.5), Network.infos.forkliftHeading, 1.50, 2.6, 0.2,0,0,255,(math.floor(calDistance(Network.infos.forkliftToTrailer,6)))*5)
							if Network.infos.forkliftToTrailer < 0.25 then
								if calDistance(Network.infos.forkliftHeading,vt2.coord.w) < 5 then 
									if GetEntitySpeed(Network.entities.forklift) < 3 then
										AddNetworkForkliftToTrailer(Network.entities.forklift,kt2)
										TriggerServerEvent("plt_lumberjack:CanAddEntityToTrailer","forklift",kt2)
										break
									else
										permenantNotification(__["slowDown"])
									end
								else
									permenantNotification(__["forkliftParallelToTrailer"])
								end	
							else
								permenantNotification(__["parkForkliftLikeMarker"])
							end 
						else
							DrawMarker(39,vt2.forkliftWorldCooord.x,vt2.forkliftWorldCooord.y,vt2.forkliftWorldCooord.z+1.5, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 0, 0, 255, 50, true, 0.10, 0, 1, 0, 0.0, 0)  
						end
					end
				end
				if PLT.Info.stacking.standCoord[1].obje and Network.infos.anyWoodPilePalaceAvaible then 
					Network.infos.firstWoodpile = GetOffsetFromEntityInWorldCoords(PLT.Info.stacking.standCoord[1].obje, 0.0, 0.0, 0.0)
					Network.infos.forksCoord  =	GetWorldPositionOfEntityBone(Network.entities.forklift , 4)
					Network.infos.forkToWoodpile = #(Network.infos.forksCoord - Network.infos.firstWoodpile)
					if Network.infos.forkToWoodpile < 0.25 then 
						if calDistance(Network.infos.forksCoord.z-0.1,Network.infos.firstWoodpile.z) < 0.125 then 
							FreezeEntityPosition(Network.entities.forklift, true)
							Network.infos.woodPile = true
							Network.infos.standObje = PLT.Info.stacking.standCoord[1].obje
							TriggerServerEvent("plt_lumberjack:CanTakeWoodPile")
						else
							permenantNotification(__["moveForksUpDown"])
						end						
					elseif Network.infos.forkToWoodpile < 3.0 then 
						addShapeBoxToWoodPile(PLT.Info.stacking.standCoord[1].obje)
						permenantNotification(__["moveForksLikeMarker"])
					else
						DrawMarker(2,Network.infos.firstWoodpile.x,Network.infos.firstWoodpile.y,Network.infos.firstWoodpile.z+2.25, 0, 0.50, 0, 0, 0, 0, 0.7,0.7,0.5, 0, 0, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
					end
				end
			elseif PLT.Info.delivery.truckTrailerInfos.closest then 
				Network.infos.forksCoord  =	GetWorldPositionOfEntityBone(Network.entities.forklift , 4)			
				Network.infos.anyWoodPilePalaceAvaible = false
				permenantNotification(__["dropWoodPileToTrailer"])
				if PLT.Info.delivery.truckTrailerInfos.rondoms then 
					if PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.rondoms].entities.woodPile1 == nil then
						DrawMarker(2,PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.rondoms].woodPile1WorldCooord.x,PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.rondoms].woodPile1WorldCooord.y,PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.rondoms].woodPile1WorldCooord.z+1.75, 0, 0.50, 0, 0, 0, 0, 0.7,0.7,0.5, 0, 0, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
					end
					if PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.rondoms].entities.woodPile2 == nil then
						DrawMarker(2,PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.rondoms].woodPile2WorldCooord.x,PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.rondoms].woodPile2WorldCooord.y,PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.rondoms].woodPile2WorldCooord.z+1.75, 0, 0.50, 0, 0, 0, 0, 0.7,0.7,0.5, 0, 0, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
					end
				end
				if PLT.Info.delivery.truckTrailerInfos.second then 
					if PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.second].entities.woodPile1 == nil then
						DrawMarker(2,PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.second].woodPile1WorldCooord.x,PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.second].woodPile1WorldCooord.y,PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.second].woodPile1WorldCooord.z+1.75, 0, 0.50, 0, 0, 0, 0, 0.7,0.7,0.5, 0, 0, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
					end
					if PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.second].entities.woodPile2 == nil then
						DrawMarker(2,PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.second].woodPile2WorldCooord.x,PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.second].woodPile2WorldCooord.y,PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.second].woodPile2WorldCooord.z+1.75, 0, 0.50, 0, 0, 0, 0, 0.7,0.7,0.5, 0, 0, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
					end
				end
				local vt1 = PLT.Info.delivery.truckTrailer[PLT.Info.delivery.truckTrailerInfos.closest]
				if vt1.entities.woodPile1 == nil then
					Network.infos.anyWoodPilePalaceAvaible = true
					Network.infos.forksToTrailer = #(Network.infos.forksCoord - vt1.woodPile1WorldCooord)
					if Network.infos.forksToTrailer < 3.5 then 
						Network.infos.forkliftHeading = GetEntityHeading(Network.entities.forklift)
						ShapeBoxDraw(vector3(vt1.woodPile1WorldCooord.x,vt1.woodPile1WorldCooord.y,vt1.woodPile1WorldCooord.z+0.12), vt1.coord.w, 1.50, 3.6, 0.90,0, 255, 0,100)
						if Network.infos.forksToTrailer < 0.70 then 
							if calDistanceWoodPile2Heading(Network.infos.forkliftHeading ,vt1.coord.w) then 
								if calDistance(Network.infos.forksCoord.z,vt1.woodPile2WorldCooord.z) < 0.125  then
									TriggerServerEvent("plt_lumberjack:CanAddEntityToTrailer","woodPile1",PLT.Info.delivery.truckTrailerInfos.closest)
									while Network.infos.woodPile do Citizen.Wait(100) end
								else
									permenantNotification(__["moveForksUpDown"])
								end
							else
								permenantNotification(__["WoodpileParellelToTrailer"])
							end
						else 
							permenantNotification(__["moveWoodpileToMarker"])
						end
					else
						DrawMarker(2,vt1.woodPile1WorldCooord.x,vt1.woodPile1WorldCooord.y,vt1.woodPile1WorldCooord.z+1.75, 0, 0.50, 0, 0, 0, 0, 0.7,0.7,0.5, 0, 0, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
					end
				end
				if vt1.entities.woodPile2 == nil then
					Network.infos.anyWoodPilePalaceAvaible = true
					Network.infos.forksToTrailer = #(Network.infos.forksCoord-vt1.woodPile2WorldCooord)
					if Network.infos.forksToTrailer < 3.5 then 
						Network.infos.forkliftHeading = GetEntityHeading(Network.entities.forklift)
						ShapeBoxDraw(vector3(vt1.woodPile2WorldCooord.x,vt1.woodPile2WorldCooord.y,vt1.woodPile2WorldCooord.z+0.12), vt1.coord.w, 1.50, 3.6, 0.90,0, 255, 0,100)
						if Network.infos.forksToTrailer < 0.70 then 
							if calDistanceWoodPile2Heading(Network.infos.forkliftHeading ,vt1.coord.w) then 
								if calDistance(Network.infos.forksCoord.z,vt1.woodPile2WorldCooord.z) < 0.125  then
									TriggerServerEvent("plt_lumberjack:CanAddEntityToTrailer","woodPile2",PLT.Info.delivery.truckTrailerInfos.closest)
									while Network.infos.woodPile do Citizen.Wait(100) end
								else
									permenantNotification(__["moveForksUpDown"])
								end
							else
								permenantNotification(__["WoodpileParellelToTrailer"])
							end
						else 
							permenantNotification(__["moveWoodpileToMarker"])
						end
					else
						DrawMarker(2,vt1.woodPile2WorldCooord.x,vt1.woodPile2WorldCooord.y,vt1.woodPile2WorldCooord.z+1.75, 0, 0.50, 0, 0, 0, 0, 0.7,0.7,0.5, 0, 0, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
					end
				end
			else
				permenantNotification(__["noTrailerDeliveryForklift"])				
			end
		end  
		while workStage == "delivery" do Citizen.Wait(0)
			Network.infos.inTruck = IsPedInVehicle(playerPedId,Network.entities.truck ,false)
			Network.infos.inForklift = IsPedInVehicle(playerPedId,Network.entities.forklift ,true)
			Network.infos.truckCoord =  GetEntityCoords(Network.entities.truck)
			Network.infos.forkliftCoord =  GetEntityCoords(Network.entities.forklift)
			trailerAtachedtoTrailer =  IsVehicleAttachedToTrailer(Network.entities.truck)
			Network.infos.minDistConstruction = 9999
			Network.infos.nowNearestConstruction = false
			for kd1,vd1 in pairs( PLT.Info.delivery.constructions) do
				Network.infos.distConstruction = #(Network.infos.truckCoord-vd1.coord)
				if Network.infos.distConstruction < 100 then
					if Network.infos.distConstruction < Network.infos.minDistConstruction  then
						local canWoodPile = 0
						for kd2,kv2 in pairs(vd1.props) do 
							if kv2[1] == nil then canWoodPile = canWoodPile + 1 end
							if kv2[2] == nil then canWoodPile = canWoodPile + 1 end
						end
						if canWoodPile >= 1 then
							Network.infos.nowNearestConstruction = kd1
							Network.infos.minDistConstruction = Network.infos.distConstruction
						end
					end
				end
			end
			Network.infos.nearestConstruction = Network.infos.nowNearestConstruction
			Network.infos.trailerWorldCooordForForklift = GetOffsetFromEntityInWorldCoords(Network.entities.trailer, wpfwc[4][1],wpfwc[4][2],wpfwc[4][3])
			Network.infos.forkliftToTrailer = #(Network.infos.forkliftCoord-Network.infos.trailerWorldCooordForForklift)
			if not trailerAtachedtoTrailer then 
				Network.infos.truckWorldCooordAttach = GetOffsetFromEntityInWorldCoords(Network.entities.truck, 0.0, -3.10, 0.8)
				Network.infos.trailerWorldCooordAttach = GetOffsetFromEntityInWorldCoords(Network.entities.trailer, 0.0, 4.725, -0.2)
				permenantNotification(__["attachTrailerToTruck"])
				DrawMarker(20,Network.infos.truckWorldCooordAttach.x,Network.infos.truckWorldCooordAttach.y,Network.infos.truckWorldCooordAttach.z,0,0.50,0,0,0,0,0.5,0.5,0.5,255,0,0,255,true,0.10,0,1,0,0.0,0)  
				DrawMarker(20,Network.infos.trailerWorldCooordAttach.x,Network.infos.trailerWorldCooordAttach.y,Network.infos.trailerWorldCooordAttach.z,0,0.50,0,180.0,0,0,0.5,0.5,0.5,255,0,0,255,true,0.10,0,1,0,0.0, 0) 
			elseif Network.infos.inForklift and Network.infos.forkliftToTrailer < 2.5 then 
				if Network.infos.forkliftAttached then 
					if SetupButton(__["interactionForUseForklift"].button,__["interactionForUseForklift"].text,__["interactionForUseForklift"].key) then
						Network.infos.forkliftAttached = nil
						DetachEntity(Network.entities.forklift, true, false)
						AttachVehicleOnToTrailer(Network.entities.forklift, Network.entities.trailer, 0.0,0.0,0.0,wpfwc[4][1],wpfwc[4][2],wpfwc[4][3] ,0.0,0.0,0.0,false)
						Citizen.Wait(500)
						DetachEntity(Network.entities.forklift, true, false)
						SyncAttachRampToTrailer()
						Citizen.Wait(5000)
					end
				else
					Network.infos.forkliftHeading = GetEntityHeading(Network.entities.forklift)
					Network.infos.trailerHeading =  GetEntityHeading(Network.entities.trailer)
					ShapeBoxDraw(vector3(Network.infos.trailerWorldCooordForForklift.x,Network.infos.trailerWorldCooordForForklift.y,Network.infos.trailerWorldCooordForForklift.z-0.5), Network.infos.trailerHeading, 2.0, 3.10, 0.2,0,255,0,50)
					ShapeBoxDraw(vector3(Network.infos.forkliftCoord.x,Network.infos.forkliftCoord.y,Network.infos.forkliftCoord.z-0.5), Network.infos.forkliftHeading, 1.50, 2.6, 0.2,0,0,255,(math.floor(calDistance(Network.infos.forkliftToTrailer,6)))*5)
					if Network.infos.forkliftToTrailer < 0.25 then
						if calDistance(Network.infos.forkliftHeading,Network.infos.trailerHeading) < 5 then 
							if GetEntitySpeed(Network.entities.forklift) < 3 then
								if SetupButton(__["interactionForkliftToPark"].button,__["interactionForkliftToPark"].text,__["interactionForkliftToPark"].key) or (not Network.infos.woodPiles[1].onTrailer and not Network.infos.woodPiles[2].onTrailer) then
									Network.infos.forkliftAttached = true
									--AttachVehicleOnToTrailer(Network.entities.forklift, Network.entities.trailer, 0.0,0.0,0.0,wpfwc[4][1],wpfwc[4][2],wpfwc[4][3] ,0.0,0.0,0.0,false)
									AttachEntityToEntity(Network.entities.forklift, Network.entities.trailer, 0, wpfwc[4][1],wpfwc[4][2],wpfwc[4][3], 0.0, 0.0, 0.0, false, false, true, false, 2, true) 
									SyncAttachRampToTrailer()
									TaskLeaveVehicle(playerPedId, Network.entities.forklift,1)
									Citizen.Wait(2500)									
								end
							else
								permenantNotification(__["slowDown"])
							end
						else
							permenantNotification(__["forkliftParallelToTrailer"])
						end
					else
						permenantNotification(__["parkForkliftLikeMarker"])
					end 
					if Network.infos.nearestConstruction then 
						if Network.infos.woodPiles[1].onTrailer then
							Network.infos.woodPiles[1].Coord = GetOffsetFromEntityInWorldCoords(Network.entities.trailer,wpfwc[1][1],wpfwc[1][2],wpfwc[1][3]+0.1)
							DrawMarker(2,Network.infos.woodPiles[1].Coord.x,Network.infos.woodPiles[1].Coord.y,Network.infos.woodPiles[1].Coord.z+1.65, 0, 0.50, 0, 0, 0, 0, 0.7,0.7,0.5, 0, 0, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
						end
						Network.infos.woodPiles[2].Coord = GetOffsetFromEntityInWorldCoords(Network.entities.trailer,wpfwc[2][1],wpfwc[2][2],wpfwc[2][3]+0.1)
						if Network.infos.woodPiles[2].onTrailer then
							DrawMarker(2,Network.infos.woodPiles[2].Coord.x,Network.infos.woodPiles[2].Coord.y,Network.infos.woodPiles[2].Coord.z+1.65, 0, 0.50, 0, 0, 0, 0, 0.7,0.7,0.5, 0, 0, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
						end
					else
						DrawMarker(39,Network.infos.trailerWorldCooordForForklift.x,Network.infos.trailerWorldCooordForForklift.y,Network.infos.trailerWorldCooordForForklift.z+1.5, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 0, 0, 255, 50, true, 0.10, 0, 1, 0, 0.0, 0) 
					end
				end
			elseif not Network.infos.inForklift and not Network.infos.forkliftAttached then
				permenantNotification(__["needGetInForklift"])
				DrawMarker(39,Network.infos.forkliftCoord.x,Network.infos.forkliftCoord.y,Network.infos.forkliftCoord.z+2.5, 0, 0.50, 0, 0, 0, 0, 1.0,1.0,1.0, 0, 0, 255, 150, true, 0.10, 0, 1, 0, 0.0, 0)  
			elseif Network.infos.woodPiles[1].onTrailer or Network.infos.woodPiles[2].onTrailer or Network.infos.woodPileOnForklift then 
				if not Network.infos.nearestConstruction then
					if Network.infos.inTruck then 
						permenantNotification(string.format(__["goAnyConstructionDelivery"],PLT.Blips.delivery.nameDeliverable))
					elseif not Network.infos.forkliftAttached then 
						if Network.infos.inForklift then
							DrawMarker(39,Network.infos.trailerWorldCooordForForklift.x,Network.infos.trailerWorldCooordForForklift.y,Network.infos.trailerWorldCooordForForklift.z+1.5, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 0, 0, 255, 50, true, 0.10, 0, 1, 0, 0.0, 0) 
							permenantNotification(__["noConstructionsInDistance"])
						else
							DrawMarker(39,Network.infos.forkliftCoord.x,Network.infos.forkliftCoord.y,Network.infos.forkliftCoord.z+2.5, 0, 0.50, 0, 0, 0, 0, 1.0,1.0,1.0, 0, 0, 255, 150, true, 0.10, 0, 1, 0, 0.0, 0)  
							permenantNotification(__["needGetInForklift"])
						end
					else
						permenantNotification(__["needGetInTruck"])
						DrawMarker(39,Network.infos.truckCoord.x,Network.infos.truckCoord.y,Network.infos.truckCoord.z+3.75, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 0, 0, 255, 150, true, 0.10, 0, 1, 0, 0.0, 0)  
					end
				else
					if Network.infos.inTruck then
						permenantNotification(string.format(__["getOutTrailerForDelivery"],PLT.Salaries.delivery.truckEndOfTheJob,(math.floor(PLT.Salaries.delivery.distancePaymentEach1Km*PLT.Info.delivery.constructions[Network.infos.nearestConstruction].distance/1000*2))))
						for kd5 = 1,#PLT.Info.delivery.constructions[Network.infos.nearestConstruction].props,1 do
							local vd5 = PLT.Info.delivery.constructions[Network.infos.nearestConstruction].props[kd5]
							if vd5[1] == nil then 
								DrawMarker(22,vd5.coord.x,vd5.coord.y,vd5.coord.z+4, 0, 0.50, 0, 0, 0, 0, 3.0,3.0,3.0, 0, 0, 255, 150, true, 0.10, 0, 1, 0, 0.0, 0)
								ShapeBoxDraw(vector3(vd5.coord.x,vd5.coord.y,vd5.coord.z+0.12+(1.025*0)), vd5.rot.z, 1.50, 3.6, 0.90,0, 0, 255,100)
								break
							elseif vd5[2] == nil then 
								DrawMarker(22,vd5.coord.x,vd5.coord.y,vd5.coord.z+5.25, 0, 0.50, 0, 0, 0, 0, 3.0,3.0,3.0, 0, 0, 255, 150, true, 0.10, 0, 1, 0, 0.0, 0)
								ShapeBoxDraw(vector3(vd5.coord.x,vd5.coord.y,vd5.coord.z+0.12+(1.025*1)), vd5.rot.z, 1.50, 3.6, 0.90,0, 0, 255,100)
								break
							end
						end
					elseif not Network.infos.inForklift then 
						permenantNotification(__["getInForkliftTakeWoodpile"])
						DrawMarker(39,Network.infos.forkliftCoord.x,Network.infos.forkliftCoord.y,Network.infos.forkliftCoord.z+2.5, 0, 0.50, 0, 0, 0, 0, 1.0,1.0,1.0, 0, 0, 255, 150, true, 0.10, 0, 1, 0, 0.0, 0)  
					else
						Network.infos.forkliftHeading = GetEntityHeading(Network.entities.forklift)
						Network.infos.forksCoord  =	GetWorldPositionOfEntityBone(Network.entities.forklift , 4)
						if not Network.infos.woodPileOnForklift then 
							Network.infos.trailerHeading = GetEntityHeading(Network.entities.trailer)
							permenantNotification(__["takeWoodpileFromTrailer"])
							for x = 1,2,1 do 
								if Network.infos.woodPiles[x].onTrailer then
									Network.infos.woodPiles[x].Coord = GetOffsetFromEntityInWorldCoords(Network.entities.trailer,wpfwc[x][1],wpfwc[x][2],wpfwc[x][3]+0.1)
									Network.infos.woodPiles[x].toFork = #(vec2(Network.infos.forksCoord.x,Network.infos.forksCoord.y)-vec2(Network.infos.woodPiles[x].Coord.x,Network.infos.woodPiles[x].Coord.y))
									DrawMarker(2,Network.infos.woodPiles[x].Coord.x,Network.infos.woodPiles[x].Coord.y,Network.infos.woodPiles[x].Coord.z+1.65, 0, 0.50, 0, 0, 0, 0, 0.7,0.7,0.5, 0, 0, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
									if Network.infos.woodPiles[x].toFork < 0.99 then
										if calDistance(Network.infos.woodPiles[x].Coord.z,Network.infos.forksCoord.z) < 0.50  then
											if calDistanceWoodPileHeading(Network.infos.trailerHeading ,Network.infos.forkliftHeading) then 
												FreezeEntityPosition(Network.entities.forklift, true) 
												Network.entities.woodPileOnForklift =  CreateNetworkObject(PLT.Props.pltwoodpile1,  Network.infos.forksCoord.x, Network.infos.forksCoord.y,Network.infos.forksCoord.z-5, true, true, false) 
												AttachEntityToEntity(Network.entities.woodPileOnForklift, Network.entities.forklift, 4, 0.0, 0.05, 0.0,0.0,0.0,90.0, false, false, false, false, 2, true) 
												Network.infos.woodPiles[x].onTrailer = nil 
												SetNetworkVehicleExtra(Network.entities.trailer, x, 1)
												SetTrailerLegsRaised(Network.entities.trailer)
												Network.infos.woodPileOnForklift = true
												FreezeEntityPosition(Network.entities.forklift, false) 
											else
												permenantNotification(__["forkliftPerpenToTrailer"])
											end
										else
											permenantNotification(__["moveForksUpDown"])
										end
										addShapeBoxToTrailer(Network.entities.trailer,x)
									elseif Network.infos.woodPiles[x].toFork < 3 then
										permenantNotification(__["moveForksLikeMarker"])
										addShapeBoxToTrailer(Network.entities.trailer,x)
									end
								end
							end
						else
							for kd3 = 1,#PLT.Info.delivery.constructions[Network.infos.nearestConstruction].props,1 do
								local vd3 = PLT.Info.delivery.constructions[Network.infos.nearestConstruction].props[kd3]
								if not vd3[1] or not vd3[2] then 
									local carpan = vd3[1] and 1 or 0
									Network.infos.forkliftHeading = GetEntityHeading(Network.entities.forklift)
									Network.infos.woodPileToConstruction = #(vec2(Network.infos.forksCoord.x,Network.infos.forksCoord.y)-vec2(vd3.coord.x,vd3.coord.y))
									ShapeBoxDraw(vector3(vd3.coord.x,vd3.coord.y,vd3.coord.z+0.12+(1.025*carpan)), vd3.rot.z, 1.50, 3.6, 0.90,0, 255, 0,100)
									permenantNotification(__["MoveWoodpileLikeMarker"])
									if Network.infos.woodPileToConstruction < 0.15 then 
										if calDistance(Network.infos.forksCoord.z,vd3.coord.z+(1.025*carpan)) < 0.15 then 
											if calDistanceWoodPileConsHeading(Network.infos.forkliftHeading+90 ,vd3.rot.z) < 5.0 then 
												FreezeEntityPosition(Network.entities.forklift,true)
												TriggerServerEvent("plt_lumberjack:CanAddWoodPileToConstruction",Network.infos.nearestConstruction,kd3,carpan+1)
												if Network.entities.woodPileOnForklift then 
													DeleteNetworkEntity(Network.entities.woodPileOnForklift)
													Network.entities.woodPileOnForklift = nil
												else
													SetNetworkVehicleExtra(Network.entities.forklift,1,1)
												end 
												Network.infos.woodPileOnForklift = nil
												FreezeEntityPosition(Network.entities.forklift,false) 
											else
												permenantNotification(__["setWoodpileHeadingMarker"])
											end
										else
											permenantNotification(__["moveForksUpDown"])
										end										
									end 
									break
								end
							end
						end
					end
				end
			elseif not Network.infos.forkliftAttached then 
				if Network.infos.inForklift then
					DrawMarker(39,Network.infos.trailerWorldCooordForForklift.x,Network.infos.trailerWorldCooordForForklift.y,Network.infos.trailerWorldCooordForForklift.z+1.5, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 0, 0, 255, 50, true, 0.10, 0, 1, 0, 0.0, 0)  
					permenantNotification(__["parkForliftToTrailer"])
				else
					DrawMarker(39,Network.infos.forkliftCoord.x,Network.infos.forkliftCoord.y,Network.infos.forkliftCoord.z+2.5, 0, 0.50, 0, 0, 0, 0, 1.0,1.0,1.0, 0, 0, 255, 150, true, 0.10, 0, 1, 0, 0.0, 0)  
					permenantNotification(__["needGetInForklift"])
				end
			elseif not Network.infos.inTruck then 
				permenantNotification(__["needGetInTruck"])
				DrawMarker(39,Network.infos.truckCoord.x,Network.infos.truckCoord.y,Network.infos.truckCoord.z+3.75, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 0, 0, 255, 150, true, 0.10, 0, 1, 0, 0.0, 0)  
			else
				Network.infos.truckToJobCenter = #(Network.infos.truckCoord-vector3(PLT.ActionCoords.x,PLT.ActionCoords.y,PLT.ActionCoords.z))
				if Network.infos.truckToJobCenter < 250 then  
					Network.infos.trailerCoord =  GetEntityCoords(Network.entities.trailer)
					Network.infos.trailerHeading =  GetEntityHeading(Network.entities.trailer)
					Network.infos.truckHeading = GetEntityHeading(Network.entities.truck)
					permenantNotification(__["goToJobCenter"])
					for kd4,vd4 in pairs(PLT.Info.delivery.truckTrailer) do
						if vd4.AvaibleToStacking == playerServerId then 
							Network.infos.truckToJobCenter = #(Network.infos.truckCoord-vector3(vd4.coord.x,vd4.coord.y,vd4.coord.z))
							if Network.infos.truckToJobCenter < 25 then 
								ShapeBoxDraw(vector3(vd4.coord.x,vd4.coord.y,vd4.coord.z-1.15), vd4.coord.w	,    						4.95,  9.50, 0.25,0,0,255,50)
								ShapeBoxDraw(vector3(Network.infos.truckCoord.x,Network.infos.truckCoord.y,Network.infos.truckCoord.z-1.15), Network.infos.truckHeading,2.95,  7.50, 0.30,0,0,255,100)
								ShapeBoxDraw(vector3(vd4.trailerCoord.x,vd4.trailerCoord.y,vd4.trailerCoord.z-1.3), vd4.trailerCoord.w, 4.90, 12.75, 0.25,0,255,0,50)
								ShapeBoxDraw(vector3(Network.infos.trailerCoord.x,Network.infos.trailerCoord.y,Network.infos.trailerCoord.z-1.3), Network.infos.trailerHeading, 2.90, 10.75, 0.30,0,255,0,100)
								if Network.infos.truckToJobCenter < 1 then 
									if calDistance(Network.infos.truckHeading,vd4.coord.w) < 10 then 
										if calDistance(Network.infos.truckHeading,Network.infos.trailerHeading) < 20 then 
											if IsVehicleSeatFree(Network.entities.truck,0) then  
												if GetEntitySpeed(Network.entities.truck) < 1 then
													TaskLeaveVehicle(playerPedId , Network.entities.truck , 1 )
													TriggerServerEvent("plt_lumberjack:CompleteDeliveyJob",kd4) 
													Citizen.Wait(2500)
													CancelJob()
												else
													permenantNotification(__["slowDown"])
												end
											else
												permenantNotification(__["nearSeatShouldEmpty"])
											end
										else
											permenantNotification(__["trailerParallelToTrailer"])
										end
									else
										permenantNotification(__["truckHeadingNeedParallel"])
									end
								else
									permenantNotification(__["parkTruckLikeMarker"])
								end
							elseif Network.infos.truckToJobCenter < 100 then 
								DrawMarker(39,vd4.coord.x,vd4.coord.y,vd4.coord.z+3+(Network.infos.truckToJobCenter/25), 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 0, 255, 0, 100, true, 0.10, 0, 1, 0, 0.0, 0)  
								DrawMarker(6,vd4.coord.x,vd4.coord.y,vd4.coord.z+3+(Network.infos.truckToJobCenter/25), 0, 0, 0, 0, 0, 0, 2.5,2.5,2.5, 255, 255, 255, 100, false, 0.90, 0, 0, 0, 0.0, 0)								
							end
							break
						end
					end
				else
					PltSetNewWaypoint(-586.32,5293.63)
					permenantNotification(__["goToJobCenter"])
				end
			end
		end
	end
end)
Citizen.CreateThread(function()
	local coord = PLT.Info.stacking.standCoord[0].coord
	Citizen.CreateThread(function() while true do Citizen.Wait(1000) if  flipTime > 0 then flipTime = flipTime - 1 end end end)
	while true do Citizen.Wait(0)
		if flipTime > 1 then
			playerCoord = GetEntityCoords(playerPedId)
			local playertotext = #(playerCoord-coord)
			if playertotext < 5 then  
				DrawText3Ds(coord.x,coord.y,coord.z+1, 0.30-(playertotext/200), 0.30-(playertotext/200), __["clearAreaForWoodpile"])
				DrawMarker(6,coord.x,coord.y,coord.z-0.1,0.0, 0.0, 0.0,-90,-90,-90, 6.0,6.0,6.0,0,0,0,255,false, true, 2, false, false, false, false) 
			else 
				Citizen.Wait(1000)
			end
		else 
			Citizen.Wait(1000)
		end
	end
end)
Citizen.CreateThread(function()
	while true do Citizen.Wait(1000)
		if workStage == "cutting" then 
			local playerPedInSeat1 = GetPedInVehicleSeat(Network.entities.telehandler,-1)
			if playerPedId ~= playerPedInSeat1 then
				if playerPedInSeat1 ~= 0 then
					local inSeatPlayer1 = GetPlayerServerId(NetworkGetPlayerIndexFromPed(playerPedInSeat1))
					if inSeatPlayer1 ~= 0 then 
						TriggerServerEvent("plt_lumberjack:CanThrowPlayerOutOfTheCar",inSeatPlayer1,NetworkGetNetworkIdFromEntity(Network.entities.telehandler))
					end					
				end				
			end
		elseif workStage == "stacking" then 
			local playerPedInSeat1 = GetPedInVehicleSeat(Network.entities.forklift,-1)
			if playerPedId ~= playerPedInSeat1 then
				if playerPedInSeat1 ~= 0 then
					local inSeatPlayer1 = GetPlayerServerId(NetworkGetPlayerIndexFromPed(playerPedInSeat))
					if inSeatPlayer1 ~= 0 then 
						TriggerServerEvent("plt_lumberjack:CanThrowPlayerOutOfTheCar",inSeatPlayer,NetworkGetNetworkIdFromEntity(Network.entities.forklift))
					end					
				end				
			end
		elseif workStage == "delivery" then 
			local playerPedInSeat1 = GetPedInVehicleSeat(Network.entities.truck,-1)
			local playerPedInSeat2 = GetPedInVehicleSeat(Network.entities.truck,0)
			local playerPedInSeat3 = GetPedInVehicleSeat(Network.entities.forklift,-1)
			if playerPedId ~= playerPedInSeat1 then
				if playerPedInSeat1 ~= 0 then
					local inSeatPlayer1 = GetPlayerServerId(NetworkGetPlayerIndexFromPed(playerPedInSeat1))
					if inSeatPlayer1 ~= 0 then 
						TriggerServerEvent("plt_lumberjack:CanThrowPlayerOutOfTheCar",inSeatPlayer1,NetworkGetNetworkIdFromEntity(Network.entities.truck))
					end					
				end		
				if playerPedId ~= playerPedInSeat2 then
					if playerPedInSeat2 ~= 0 then
						local inSeatPlayer2 = GetPlayerServerId(NetworkGetPlayerIndexFromPed(playerPedInSeat2))
						if inSeatPlayer2 ~= 0 then 
							TriggerServerEvent("plt_lumberjack:CanThrowPlayerOutOfTheCar",inSeatPlayer2,NetworkGetNetworkIdFromEntity(Network.entities.truck))
						end					
					end				
				end	
			end
			if playerPedId ~= playerPedInSeat3 then
				if playerPedInSeat3 ~= 0 then
					local inSeatPlayer3 = GetPlayerServerId(NetworkGetPlayerIndexFromPed(playerPedInSeat3))
					if inSeatPlayer3 ~= 0 then 
						TriggerServerEvent("plt_lumberjack:CanThrowPlayerOutOfTheCar",inSeatPlayer3,NetworkGetNetworkIdFromEntity(Network.entities.forklift))
					end					
				end				
			end	
		else
			Citizen.Wait(1000)
		end
	end
end)
RegisterNetEvent('plt_lumberjack:ThrowPlayerOutOfTheCar')
AddEventHandler('plt_lumberjack:ThrowPlayerOutOfTheCar', function(entity)
	local trailer = NetworkGetEntityFromNetworkId(entity)
	if DoesEntityExist(trailer) and GetEntitySpeed(trailer) < 3 then 
		TaskLeaveVehicle(playerPedId, trailer,1)
	end
end)
Citizen.CreateThread(function()
	for k,info in pairs(PLT.Info.delivery.truckTrailer) do
		while not info.trailerCoord do Citizen.Wait(1000) end PLT.Info.delivery.truckTrailer[k].VehicleParkPoints = {}
		local truckTrailerDiff = vector3(info.coord.x,info.coord.y,info.coord.z)-vector3(info.trailerCoord.x,info.trailerCoord.y,info.coord.z)
		table.insert(PLT.Info.delivery.truckTrailer[k].VehicleParkPoints,vector3(info.coord.x,info.coord.y,info.coord.z))
		table.insert(PLT.Info.delivery.truckTrailer[k].VehicleParkPoints,vector3(info.trailerCoord.x,info.trailerCoord.y,info.coord.z))
		table.insert(PLT.Info.delivery.truckTrailer[k].VehicleParkPoints,vector3(info.coord.x,info.coord.y,info.coord.z)-(truckTrailerDiff/1.5))
		table.insert(PLT.Info.delivery.truckTrailer[k].VehicleParkPoints,vector3(info.coord.x,info.coord.y,info.coord.z)-(truckTrailerDiff/3))
		table.insert(PLT.Info.delivery.truckTrailer[k].VehicleParkPoints,vector3(info.coord.x,info.coord.y,info.coord.z)-(truckTrailerDiff/0.75))
		table.insert(PLT.Info.delivery.truckTrailer[k].VehicleParkPoints,vector3(info.coord.x,info.coord.y,info.coord.z)-(truckTrailerDiff/0.60))
		table.insert(PLT.Info.delivery.truckTrailer[k].VehicleParkPoints,vector3(info.coord.x,info.coord.y,info.coord.z)-(truckTrailerDiff/0.50))
	end 
	playerServerId = GetPlayerServerId(PlayerId())
 	while true do Citizen.Wait(1000)
		playerVehicles[GetVehiclePedIsIn(playerPedId, false)] = true
		for k,v in pairs(playerVehicles)do
			playerVehicles[k] = GetEntityCoords(k)
			if #(playerVehicles[k]-vector3(0.0,0.0,0.0))< 1 then playerVehicles[k] = nil end
		end
		if #(vector3(PLT.ActionCoords.x,PLT.ActionCoords.y,PLT.ActionCoords.z)-playerCoord) < 300 then 
			for kx,vx in pairs(PLT.Info.delivery.truckTrailer) do Citizen.Wait(100)
				if vx.AvaibleToStacking ~= true and playerServerId ~= vx.AvaibleToStacking then 
					for k,v in pairs(vx.VehicleParkPoints) do Citizen.Wait(10)
						for ky,vy in pairs(playerVehicles) do Citizen.Wait(0)
							while  #(v-vy) < 2.5 and #(v-playerCoord) < 25.0 do Citizen.Wait(0)
								ShapeBoxDraw(vector3(v.x,v.y,v.z-1.25), 90.0,5.0,5.0, 0.30,0,0,0,200)
								DrawMarker(39,v.x,v.y,v.z+1.0, 0, 0.50, 0, 0, 0, 0, 1.0,1.0,1.0, 255, 100, 100, 150, true, 0.10, 0, 1, 0, 0.0, 0)  
								DrawText3Ds(v.x,v.y,v.z-1.0, 0.40, 0.40, __["clearAreaForTruck"])
								vy = GetEntityCoords(ky)
							end
						end
					end
				end
			end
		else
			Citizen.Wait(1000)
		end
	end 
end)
function CheckAreaForLocalTruck(info)
	if info.trailerCoord and #(vector3(PLT.ActionCoords.x,PLT.ActionCoords.y,PLT.ActionCoords.z)-playerCoord) < 150 and info.VehicleParkPoints then 
		playerCoord = GetEntityCoords(playerPedId)
		for k,v in pairs(info.VehicleParkPoints) do Citizen.Wait(0)
			if #(v-playerCoord) < 1.5 then 
				local suitableArea = GetSuitableAreaForTelehandler()
				suitableArea = suitableArea and suitableArea or vector3(-600.8510, 5253.4668, 69.9004)
				SetPedCoordsKeepVehicle(playerPedId, suitableArea.x, suitableArea.y, suitableArea.z)
				break
			end
		end
		for k,v in pairs(playerVehicles)do Citizen.Wait(100)
			playerVehicles[k] = GetEntityCoords(k)
			if #(playerVehicles[k]-vector3(0.0,0.0,0.0))< 1 then playerVehicles[k] = nil end
		end
		for k,v in pairs(info.VehicleParkPoints) do Citizen.Wait(0)
			for ky,vy in pairs(playerVehicles) do Citizen.Wait(0)
				if  #(v-vy) < 2.5 then
					local suitableArea = GetSuitableAreaForTelehandler()
					suitableArea = suitableArea and suitableArea or vector3(-600.8510, 5253.4668, 69.9004)
					SetEntityCoords(ky, suitableArea.x, suitableArea.y, suitableArea.z, false, false, false, false)
				end
			end
		end
	end
end
RegisterNetEvent("plt_lumberjack:ClotheChangeAnim")
AddEventHandler("plt_lumberjack:ClotheChangeAnim", function()
	TaskPlayAnim(playerPedId,loadAnimDict("re@construction"), "out_of_breath", 3.0, 3.0, 1300, 51, 0, false, false, false)
	Citizen.Wait(1300)
	TaskPlayAnim(playerPedId, loadAnimDict("clothingtie"), "try_tie_negative_a", 3.0, 3.0, 1300, 51, 0, false, false, false)
	Citizen.Wait(1300)
	ChainSawAnimIdle()	
end)
RegisterNetEvent('plt_lumberjack:ClientCancelJob')
AddEventHandler('plt_lumberjack:ClientCancelJob', function()
	CancelJob()
end)
RegisterNetEvent('plt_lumberjack:StartJob')
AddEventHandler('plt_lumberjack:StartJob', function(stage,arg1)
	if stage == "cutting" then 
		SpawnTelehandler(arg1)
	elseif stage == "stacking" then 
		SpawnForklift(arg1)
	elseif stage == "delivery" then 
		SpawnNetworkTruckAndAll(arg1)
	end
	workStage = stage
	UpdateJobBlips()
end)
if PLT.CommandSetVolume and type(PLT.CommandSetVolume) == "string" then 
	RegisterCommand(PLT.CommandSetVolume, function(source, args, rawCommand)
		local newVolume = tonumber(args[1])
		if type(newVolume) == "number"  then 
			PLT.ChainSawSoundVolume = newVolume < 0 and 0.0 or newVolume > 100 and 100.0 or newVolume
			Notification(__["newChainSawVolume"].type,string.format(__["newChainSawVolume"].text,PLT.ChainSawSoundVolume),__["newChainSawVolume"].duration)
		else
			Notification(__["wrongChainSawVolume"].type,string.format(__["wrongChainSawVolume"].text,PLT.CommandSetVolume),__["wrongChainSawVolume"].duration)
		end
	end,false)
end
if PLT.CommandFixVehicle and type(PLT.CommandFixVehicle) == "string" then 
	RegisterCommand(PLT.CommandFixVehicle, function(source, args, rawCommand)
		if workStage then 
			local willFixVehicle = GetVehiclePedIsIn(playerPedId, false)
			for k,v in pairs(Network.entities) do if v == willFixVehicle then 
				local willFixVehicleCoord = GetEntityCoords(willFixVehicle)
				SetEntityCoords(willFixVehicle, willFixVehicleCoord.x + math.random(-1, 1), willFixVehicleCoord.y + math.random(-1, 1), willFixVehicleCoord.z + 1, false, false, false, true)
				SetEntityRotation(willFixVehicle ,0.0, 0.0, GetEntityHeading(willFixVehicle) + 90, false, true)
				break
			end end
		end
	end,false)
end
if PLT.CommandCancelJob and type(PLT.CommandCancelJob) == "string" then 
	RegisterCommand(PLT.CommandCancelJob, function(source, args, rawCommand)
		if workStage then 
			CancelJob()
		end
	end,false)
end
function OpenUi()
	NuiActive = true
	SendNUIMessage({
		statu = "openUi",
		jobOutfitWorn  = jobOutfitWorn,
		onWorking = workStage ~= nil,
		cutting = JobControl("cutting"),
		stacking = JobControl("stacking"),
		delivery = JobControl("delivery"),
	}) 
	SetNuiFocus(true, true)
end
RegisterNUICallback('action', function(data, cb)
	if data.event == "cuttting" then 
		local suitableArea = GetSuitableAreaForTelehandler()
		if  suitableArea ~= false then
			TriggerServerEvent("plt_lumberjack:CanStartJob","cutting",suitableArea)
		else
			Notification(__["vehicleSpawnPointsFull"].type,__["vehicleSpawnPointsFull"].text,__["vehicleSpawnPointsFull"].duration)
		end
	elseif data.event == "stacking" then 
		local suitableArea = GetSuitableAreaForForklift() 
		if suitableArea ~= false then
			if anyAvaiblePalacaForForkliftandWoodPile() then
				TriggerServerEvent("plt_lumberjack:CanStartJob","stacking",suitableArea)
			end
		else
			Notification(__["vehicleSpawnPointsFull"].type,__["vehicleSpawnPointsFull"].text,__["vehicleSpawnPointsFull"].duration)
		end
	elseif data.event == "delivery" then
		TriggerServerEvent("plt_lumberjack:CanStartJob","delivery")
	elseif data.event == "job-outfit" then 
		ChangeOutfit()
	elseif data.event == "daily-outfit" then 
		ChangeOutfit()
	elseif data.event == "cancel-job" then 
		CancelJob()
	end
	SendNUIMessage({statu = "closeUi"}) 
	SetNuiFocus(false, false)
	NuiActive = false
end) 
function CheckNetworkEntites()
	for k,v in pairs(Network.entities) do 
		if DoesEntityExist(v) then 
			local entityToPlayer = #(GetEntityCoords(v)-playerCoord)
			if entityToPlayer > 350 then 
				Notification(__["jobCancelledAwayToEntity"].type,string.format(__["jobCancelledAwayToEntity"].text,k),__["jobCancelledAwayToEntity"].duration)
				CancelJob()break
			elseif entityToPlayer >  325 then 
				Notification(__["jobWillCancelAwayToEntity"].type,string.format(__["jobWillCancelAwayToEntity"].text,k),__["jobWillCancelAwayToEntity"].duration)
				Citizen.Wait(2500)
			end
			if GetVehicleEngineHealth(v) < 100 then 
				Notification(__["jobCancelledEngine"].type,string.format(__["jobCancelledEngine"].text,k),__["jobCancelledEngine"].duration) CancelJob() break
			elseif GetVehicleEngineHealth(v) < 300 then 
				Notification(__["jobWillCancelEngine"].type,string.format(__["jobWillCancelEngine"].text,k),__["jobWillCancelEngine"].duration)
				Citizen.Wait(2500)
			elseif GetVehicleBodyHealth(v) < 750 then 
				Notification(__["jobWillCancelBody"].type,string.format(__["jobWillCancelBody"].text,k),__["jobWillCancelBody"].duration)
				SetVehicleBodyHealth(v,1000.0)
			end				
		else
			Citizen.Wait(100)
			if not DoesEntityExist(v) then 
				Notification(__["jobCancelledEntityNtFound"].type,string.format(__["jobCancelledEntityNtFound"].text,k),__["jobCancelledEntityNtFound"].duration)
				CancelJob()
				break
			end
		end
	end
end
function refrehPedBlip()
	if JobControl("cutting") or JobControl("stacking") or JobControl("delivery") then 
		if PLT.Blips.workplace.ID == nil then 
			PLT.Blips.workplace.ID = AddBlipForCoord(PLT.ActionCoords)
			SetBlipSprite (PLT.Blips.workplace.ID, PLT.Blips.workplace.sprite)
			SetBlipColour (PLT.Blips.workplace.ID, PLT.Blips.workplace.colour)
			SetBlipScale  (PLT.Blips.workplace.ID, PLT.Blips.workplace.scale)
			SetBlipAsShortRange(PLT.Blips.workplace.ID, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(PLT.Blips.workplace.name)
			EndTextCommandSetBlipName(PLT.Blips.workplace.ID)
			SetBlipSecondaryColour(PLT.Blips.workplace.ID,255,0,0)
			ShowTickOnBlip(PLT.Blips.workplace.ID, false)
		end
	else
		if PLT.Blips.workplace.ID then  RemoveBlip(PLT.Blips.workplace.ID) PLT.Blips.workplace.ID = nil end
	end
end
function CreateActionPed()
	PLT.Blips.workplace.Ped = CreatePed(2,LoadModel(PLT.ActionPed), PLT.ActionCoords.x, PLT.ActionCoords.y, PLT.ActionCoords.z -1, PLT.ActionCoords.w, false, false)
	SetEntityHeading(PLT.Blips.workplace.Ped, PLT.ActionCoords.w)
	FreezeEntityPosition(PLT.Blips.workplace.Ped, true)
	SetEntityInvincible(PLT.Blips.workplace.Ped, true)
	SetBlockingOfNonTemporaryEvents(PLT.Blips.workplace.Ped, true)
	TaskStartScenarioInPlace(PLT.Blips.workplace, "PROP_HUMAN_PARKING_METER", 0, true)
end
function PlayAnimCutting(CuttedObje,animName,offsetLeft,offsetRight)
	SetEntityVelocity(playerPedId,0.0,0.0,0.0)
	playerCoord = GetEntityCoords(playerPedId)
	local treeLeftCoord = GetOffsetFromEntityInWorldCoords(CuttedObje,  offsetLeft[1],  offsetLeft[2],  offsetLeft[3])			
	local treeRightCoord = GetOffsetFromEntityInWorldCoords(CuttedObje, offsetRight[1],  offsetRight[2],  offsetRight[3])
	local playerToTreeLeft  = #(vec2(treeLeftCoord.x,treeLeftCoord.y)-vec2(playerCoord.x,playerCoord.y))
	local playerToTreeRight = #(vec2(treeRightCoord.x,treeRightCoord.y)-vec2(playerCoord.x,playerCoord.y))
	local newHeading =  playerToTreeLeft < playerToTreeRight and Network.infos.CuttedTreeHeading - 270 or Network.infos.CuttedTreeHeading - 90 
	while newHeading > 360 do Citizen.Wait(0) newHeading -=360 end while newHeading < 0 do Citizen.Wait(0) newHeading +=360 end
	local actionCoord = playerToTreeLeft < playerToTreeRight and treeLeftCoord or treeRightCoord
	local firstZ = actionCoord.z
	local retval , groundZ  =	GetGroundZFor_3dCoord(actionCoord.x , actionCoord.y , actionCoord.z+1, true)
	if calDistance(groundZ+1,actionCoord.z) <= 0.75 then actionCoord = vector3(actionCoord.x , actionCoord.y ,groundZ+1) end
	TaskGoStraightToCoord(playerPedId, actionCoord, 0.2, 2500, 0.0, 0.5)
	local overTimeCoord = true Citizen.CreateThread(function() Citizen.Wait(3000)  overTimeCoord = false end)
	while (#(vec3(playerCoord.x,playerCoord.y,playerCoord.z)-vec3(actionCoord.x,actionCoord.y,actionCoord.z)) > 0.15) and overTimeCoord do Citizen.Wait(100)  playerCoord = GetEntityCoords(playerPedId) end
	local overTimeHeading = true Citizen.CreateThread(function() Citizen.Wait(2000)  overTimeHeading = false end)
	while calDistance(newHeading,GetEntityHeading(playerPedId)) > 1 and overTimeHeading do TaskAchieveHeading(playerPedId, newHeading+0.0 , 1000) Citizen.Wait(25) end
	FreezeEntityPosition(playerPedId, true)
	loadAnimDict("plt_lumberjack@tree_cutting")
	ClearPedTasks(playerPedId)
	playerCoord = GetEntityCoords(playerPedId)
	TaskPlayAnimAdvanced(playerPedId, "plt_lumberjack@tree_cutting", animName, vector3(actionCoord.x,actionCoord.y,actionCoord.z), (firstZ-actionCoord.z)*40, 0.0, newHeading+0.0, 2.0, -2.0, -1, 1, 0.0, 1, 1)
	SetSoundEffect("start",animName) 
	local durum = true 
	local effectActive = true 
	Citizen.CreateThread(function()	Citizen.Wait(10000) durum = false end)
	Citizen.CreateThread(function()
		Citizen.Wait(animInfos[animName].wait)
		local offSet
		RequestNamedPtfxAsset(animInfos[animName].dict)	while not HasNamedPtfxAssetLoaded(animInfos[animName].dict) do Citizen.Wait(0)end
		while effectActive and durum do Citizen.Wait(100) 
			offSet = animInfos[animName].offSets[math.random(1,#animInfos[animName].offSets)]
			chainSawEffectCoord = GetOffsetFromEntityInWorldCoords(Network.entities.chainSaw,  offSet[1],  offSet[2], offSet[3])
			UseParticleFxAssetNextCall(animInfos[animName].dict)
			StartParticleFxNonLoopedAtCoord(animInfos[animName].particleName, chainSawEffectCoord.x , chainSawEffectCoord.y , chainSawEffectCoord.z, 0.0, 0.0, 0.0, 0.2, false, false, false)
		end
	end)
	while durum and workStage do Citizen.Wait(0) if CancelAnim() == true then durum = "cancel" break end  end
	effectActive = false local feedBack = false if durum == false then feedBack = true end
	Citizen.CreateThread(function()	
		if feedBack == true then Citizen.Wait(2000) end
		SetSoundEffect("stop") 
		StopAnimTask(playerPedId , animDictionary, animationName , 1.0 )
		local groundCoords  = GetGroundCoords(GetEntityCoords(playerPedId))
		SetEntityCoords(playerPedId, groundCoords.x, groundCoords.y, groundCoords.z)
		FreezeEntityPosition(playerPedId, false)
		ChainSawAnimIdle()
	end)
	return feedBack
end
function PlayAnimCuttingTreeRoot(num,heading)
	Network.infos.OnCuttingTreeRoot = true
	playerCoord = GetEntityCoords(playerPedId)
	local actionCoord
	SetEntityHeading(PLT.Info.cutting.trees[num].entities.tree2, heading+90.0)
	actionCoord = vector3(PLT.Info.cutting.trees[num].coord.x +  GetEntityForwardVector(PLT.Info.cutting.trees[num].entities.tree2)["x"] * 0.9,PLT.Info.cutting.trees[num].coord.y +  GetEntityForwardVector(PLT.Info.cutting.trees[num].entities.tree2)["y"] * 0.9,PLT.Info.cutting.trees[num].coord.z+1.3) 
	local retval , groundZ  =	GetGroundZFor_3dCoord(actionCoord.x , actionCoord.y , actionCoord.z+1, true)
	if calDistance(groundZ+1,actionCoord.z) <= 0.75 then actionCoord = vector3(actionCoord.x , actionCoord.y ,groundZ+1) end
	TaskGoStraightToCoord(playerPedId, actionCoord, 0.2, 2500, 0.0, 0.5)
	local overTimeCoord = true Citizen.CreateThread(function() Citizen.Wait(3000)  overTimeCoord = false end)
	while (#(vec2(playerCoord.x,playerCoord.y)-vec2(actionCoord.x,actionCoord.y)) > 0.15 ) and overTimeCoord do Citizen.Wait(100)  playerCoord = GetEntityCoords(playerPedId) end
	local newHeading = GetHeadingFromVector_2d(PLT.Info.cutting.trees[num].coord.x-playerCoord.x,PLT.Info.cutting.trees[num].coord.y-playerCoord.y) 
	local overTimeHeading = true Citizen.CreateThread(function() Citizen.Wait(2000)  overTimeHeading = false end)
	while calDistance(newHeading,GetEntityHeading(playerPedId)) > 1 and overTimeHeading do TaskAchieveHeading(playerPedId,newHeading+0.0,1000) Citizen.Wait(25) end
	local animDictionary = "plt_lumberjack@tree_cutting"
	local animationName = "tree"
	FreezeEntityPosition(playerPedId, true)
	loadAnimDict(animDictionary)
	ClearPedTasks(playerPedId)
	TaskPlayAnimAdvanced(playerPedId, animDictionary, animationName, actionCoord, 0.0, 0.0, newHeading+0.0, 2.0, -2.0, -1, 1, 0.0, 1, 1)	
	SetSoundEffect("start","felling") 
	local durum = true 
	local effectActive = true 
	Citizen.CreateThread(function()	Citizen.Wait(10000) durum = false end)
	Citizen.CreateThread(function()
		Citizen.Wait(animInfos["felling"].wait)
		local offSet RequestNamedPtfxAsset(animInfos["felling"].dict)	while not HasNamedPtfxAssetLoaded(animInfos["felling"].dict) do Citizen.Wait(0)end
		while effectActive and durum do Citizen.Wait(100) 
			offSet = animInfos.felling.offSets[math.random(1,#animInfos.wood.offSets)]
			chainSawEffectCoord = GetOffsetFromEntityInWorldCoords(Network.entities.chainSaw,  offSet[1], offSet[2], offSet[3])
			UseParticleFxAssetNextCall(animInfos["felling"].dict)
			StartParticleFxNonLoopedAtCoord(animInfos["felling"].particleName, chainSawEffectCoord.x , chainSawEffectCoord.y , chainSawEffectCoord.z, 0.0, 0.0, 0.0, 0.2, false, false, false)
		end
	end)
	while durum and workStage do Citizen.Wait(0) if CancelAnim() == true then durum = "cancel" break end  end
	effectActive = false
	if durum == false and workStage then 
		Network.infos.coords ={}
		Network.infos.CuttedTreeNum =  num
		Network.infos.CuttedTreeHeading =  heading
		TriggerServerEvent("plt_lumberjack:OnCuttingTree","felling",num,heading)
		Citizen.Wait(2000)
	else
		TriggerServerEvent("plt_lumberjack:CancelCutTree",num)
	end
	SetSoundEffect("stop") 
	StopAnimTask(playerPedId , animDictionary, animationName , 1.0 )
	local groundCoords  = GetGroundCoords(GetEntityCoords(playerPedId))
	SetEntityCoords(playerPedId, groundCoords.x, groundCoords.y, groundCoords.z)
	FreezeEntityPosition(playerPedId, false)
	ChainSawAnimIdle()
	Network.infos.OnCuttingTreeRoot = nil
end
function AttachChainSawToPedAnim()
	DetachEntity(Network.entities.chainSaw)
	AttachEntityToEntity(Network.entities.chainSaw, playerPedId, GetPedBoneIndex(playerPedId, 57005), 0.233, 0.1, -0.095, -102.0, 19.0, 61.0, false, false, false, true, 1, true)
	ChainSawAnimIdle()
	Network.infos.chainSawAttached = true
end 
function ChainSawAnimIdle()
	if workStage == "cutting" then 
		loadAnimDict('anim@heists@narcotics@trash')
		TaskPlayAnim(playerPedId, 'anim@heists@narcotics@trash', 'walk', 1.0, -1.0,-1,49,0,0, 0,0)
	end
end
function AttachChainSawTeleHandler()
	if IsEntityPlayingAnim(playerPedId, "anim@heists@narcotics@trash", "walk", 3) then 
		StopAnimTask(playerPedId, 'anim@heists@narcotics@trash', 'walk', 1.0)
	end
	DetachEntity(Network.entities.chainSaw)
	AttachEntityToEntity(Network.entities.chainSaw, Network.entities.telehandler, Network.infos.bone, -0.50 ,-1.0, 1.85, 145.0, 90.0, 180.0, false, false, false, false, 2, true)  
	Network.infos.chainSawAttached = nil
end
function CanCutThisHeading(num,heading)
	local area4 = PLT.Info.cutting.trees[num][heading].tree4x4.coord
	local area3 = PLT.Info.cutting.trees[num][heading].tree3x3.coord
	local area2 = PLT.Info.cutting.trees[num][heading].tree2x2.coord
	local areaDist =3.0
	if IsAreaClear(area2, areaDist) and  IsAreaClear(area3, areaDist) and IsAreaClear(area4, areaDist) then
		return true
	end
	for x=1,360,1 do Citizen.Wait(0)
		DrawMarker(39,area4.x,area4.y,area4.z+0.5, 0, 0.50, 0, 0, 0, 0, 0.5,0.5,0.5, 255, 255, 255, 100, true, 0.10, 0, 1, 0, 0.0, 0)  
		DrawMarker(39,area3.x,area3.y,area3.z+0.5, 0, 0.50, 0, 0, 0, 0, 0.5,0.5,0.5, 255, 255, 255, 100, true, 0.10, 0, 1, 0, 0.0, 0)  
		DrawMarker(39,area2.x,area2.y,area2.z+0.5, 0, 0.50, 0, 0, 0, 0, 0.5,0.5,0.5, 255, 255, 255, 100, true, 0.10, 0, 1, 0, 0.0, 0)  
		DrawMarker( 6,area3.x,area3.y,area3.z+0.5, 0, 0.00, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 0, 0, 100, false, 0.90, 0, 0, 0, 0.0, 0)	
		DrawMarker( 6,area4.x,area4.y,area4.z+0.5, 0, 0.00, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 0, 0, 100, false, 0.90, 0, 0, 0, 0.0, 0)	
		DrawMarker( 6,area2.x,area2.y,area2.z+0.5, 0, 0.00, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 0, 0, 100, false, 0.90, 0, 0, 0, 0.0, 0)	
	end
	return false
end
function DrawText3Ds(x,y,z, sx, sy, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	SetTextScale(sx, sy)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
end
