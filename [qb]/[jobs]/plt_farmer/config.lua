plt_farmer = {}
local PLT = plt_farmer
---------------------------------------------------------------------------------------------------------------------------------------------------------
PLT.U = Lang["EN"]                                          -- SET = ("EN" or "TR" or "Custom"), if you edit on locale.lua you can add more.
PLT.UseEsxFramework = true                                  -- SET = (true or false), if you  want to use esx menu system and using esx framework set this true. or set false for menuv.
PLT.UseEsxMenu  = false                                     -- SET = (true or false), if you want to esx menu set true elseif want to menuV set false.if you set true You should comment line from fxmanifest file please check.
PLT.UseEsxSkin  = true                                      -- SET = (true or false), if you use esx_skin and skinchanger set true elseif set false and edit WearJob() and WearCitizen() functions on client.lua
PLT.jobRequired = false                                      -- SET = (true or false), This will set whether a profession control will be made in order to do the job or not. If you set "false" anyone can do the job.
PLT.jobName     = "farmer"                                  -- SET = ("job.name"), if "PLT.jobRequired" is set "true" then type the name u want for the job in "job name", if you allready used "farmer.sql" do not change this.
PLT.CanDoHalfJob  = true                                    -- SET = (true or false), if you set true; Players will be able to stop working at the half of the job if they want to. That way they will receive half of the money.
-------------------------------------------------------------- The system will ask the players if they want to continue working or not before they start loading the bales on to the tuck.
PLT.HalfPayment = 750                                       -- SET = (money), if the player does the work halfway. that is, the amount to be paid if he does not deliver by truck.
PLT.FullPayment = 1500                                      -- SET = (money), if the player completes the job. including delivery by truck.
PLT.HarvesterVehicleWheelEasyMode = true                    -- SET = (true or false), Since the wheels of the harvester turning left and right are at the back, you have to press left when you want to turn right. 
PLT.PaymentMethodWithBank = true                            -- SET = (true or false), if you set true the payment is made to the bank else set false payment is cash        
------------------------------------------------------------ You can set it to "true" to turn on "easy mode". In easy mode, you can press D to turn right and A to turn left.
PLT.PedCoord = vector4(2121.29, 4783.20, 40.97, 329.88)     -- SET = vector4(x,y,z,heading), Here you can change the location of the spawned ped at the starting point.
PLT.ActionCoord = vector3(2122.77, 4785.09, 40.970)         -- SET = vector3(x,y,z), Coordinates to interact with to start the job.
PLT.JobBlipSprite = 569                                     -- SET = (number), Blip sprite of starting place. Choose another one from this site if you want to change it: https://docs.fivem.net/docs/game-references/blips/
PLT.JobBlipColor = 83                                       -- SET = (number), Blip color of the starting point. Choose another one from this site if you want to change it: https://docs.fivem.net/docs/game-references/blips/
PLT.VehicleDelete = vector3(2105.95, 4786.14, 41.31)        -- SET = vector3(x,y,z), Final stage, The coordinate to which the truck will deliver..
PLT.DeliveryCoords = vector3(45.29,6302.17,31.22)           -- SET = vector3(x,y,z), Coordinates where the bales loaded on the truck will be delivered. You have to change "PLT.DeliveryPoints" as well if you change this coordinates.
PLT.DeliveryBlipSprite = 477                                -- SET = (number), Blip sprite of the place where the bales loaded on the truck will be delivered. Choose another one from this site if you want to change it: https://docs.fivem.net/docs/game-references/blips/
PLT.DeliveryBlipColor = 83                                  -- SET = (number), The blip color of the place where the bales loaded on the truck will be delivered. Choose another one from this site if you want to change it: https://docs.fivem.net/docs/game-references/blips/
PLT.TractorName = "tractor2"                                -- SET = ("carName"), If you want to change the existing tractor, you can change the spawn code of the tractor with the mod you want to change by typing it here.
PLT.TruckName = "packer"                                    -- SET = ("carName"), If you want to change the existing truck, you can change the spawn code of the truck you want to change by typing it here.
PLT.CommandCancelJob = "cancelfarmjob"                      -- SET = ("CommandName"), If the player somehow gets into a bug (vehicle explosion, bugs of objects, death, etc.), he/she can cancel her active job using this command.
------------------------------------------------------------ After using this command, all objects and tools created by the script will be deleted. The player becomes able to go and start the job again.
PLT.CommandFixVehicle = "fixfarmvehicle"                    -- SET =  ("CommandName"), Since the harvester is modded, sometimes there may be problems such as hanging or gets bugged. Using this command, teleport the vehicle a little higher.
------------------------------------------------------------ It randomly changes its direction and teleports slightly to the right or left. This command only works in work vehicles and only while in the active profession.
PLT.CommandFixVehicleWait = 5                               -- SET =  (second), Time it takes to type the command "PLT.CommandFixVehicle" again.
PLT.CloakRoomCoord = vector3(2126.73, 4776.51, 40.97)       -- SET = vector3(x,y,z), Coordinates for wearing workwear.
PLT.EnableJobClothe = true                                  -- SET = (true or false), If you do not want to have a professional dress option, set it to "false". and set "false" if you are not using esx_skin
PLT.Uniforms = {                                            -- If "PLT.EnableJobClothe" is set "true" here you need to set the workwear for your server. 
    ["male"] ={                                             -- Irregular outfits may appear on your server as the outfit pack is different on each server.
        ['tshirt_1'] = 15, ['tshirt_2'] = 0,                -- You need to adapt it according to your own server by changing the values below. If you don't know about this, you can contact me.
        ['torso_1'] = 319, ['torso_2'] = 2,
        ['decals_1'] = 0, ['decals_2'] = 0,
        ['arms'] = 68,
        ['pants_1'] = 120, ['pants_2'] = 19,
        ['shoes_1'] = 25, ['shoes_2'] = 0,
        ['helmet_1'] = 58, ['helmet_2'] = 0,
        ['chain_1'] = 0, ['chain_2'] = 0,
        ['ears_1'] = -1, ['ears_2'] = 0,
        ['mask_1'] = 0, ['mask_2'] = 0,
        ['bags_1'] = 0, ['bags_2'] = 0,
        ['glasses_1'] = 0, ['glasses_2'] = 0,
        ['bproof_1'] = 0,  ['bproof_2'] = 0
    },
    ["female"] ={
        ['tshirt_1'] = 15, ['tshirt_2'] = 0,
        ['torso_1'] = 333, ['torso_2'] = 2,
        ['decals_1'] = 0, ['decals_2'] = 0,
        ['arms'] = 76,
        ['pants_1'] = 124, ['pants_2'] = 19,
        ['shoes_1'] = 63, ['shoes_2'] = 0,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['chain_1'] = 0, ['chain_2'] = 0,
        ['ears_1'] = -1, ['ears_2'] = 0,
        ['mask_1'] = 0, ['mask_2'] = 0,
        ['bags_1'] = 0, ['bags_2'] = 0,
        ['glasses_1'] = 5, ['glasses_2'] = 0,
        ['bproof_1'] = 0,  ['bproof_2'] = 0
    }
}


PLT.DeliveryPoints ={ -- if you chage PLT.DeliveryCoords also change this coords / PLT.DeliveryCoords 'u değiştirdiyseniz bu kordinatları da değiştirmelisiniz.
    vector4(73.45816802978516,6423.634765625,31.35027694702148,226.0985870361328),
    vector4(98.56503295898438,6397.771484375,31.32584953308105,220.8632049560547),
    vector4(77.94796752929688,6375.92236328125,31.30701828002929,125.19520568847656),
    vector4(60.51306533813476,6363.39990234375,31.30885124206543,124.92192840576172),
    vector4(68.66979217529297,6337.275390625,31.29727363586425,213.4684295654297),
    vector4(81.99500274658203,6315.51611328125,31.34475708007812,189.40382385253907),
    vector4(63.6574478149414,6300.5908203125,31.34696197509765,114.4088134765625),
    vector4(34.67867660522461,6288.18017578125,31.31850814819336,126.64484405517578),
}

PLT.Area ={
    {vector4(2573.307373046875,4353.44775390625,40.7868423461914,284.52117919921877)},
    {vector4(2551.141845703125,4332.1572265625,40.11727905273437,316.06707763671877)},
    {vector4(2576.96337890625,4803.349609375,33.3885498046875,42.1165885925293)},
    {vector4(2601.38330078125,4716.99658203125,33.92627716064453,225.7292022705078)},
    {vector4(2345.1005859375,5122.1923828125,48.40447616577148,49.3460807800293)},
    {vector4(2082.391357421875,5184.1025390625,53.77392959594726,305.6238098144531)},
    {vector4(2110.009765625,5201.279296875,56.43954467773437,132.7483367919922)}
}

PLT.VehicleSpawn ={vector4(2133.452880859375,4816.78662109375,41.29134750366211,206.23304367),vector4(2130.531494140625,4815.44384765625,41.29312133789062,206.47197532),vector4(2127.73828125,4814.09423828125,41.29234313964844,206.55865859),vector4(2125.01806640625,4812.80224609375,41.2929458618164,206.7101879),vector4(2122.420654296875,4811.34423828125,41.29180145263672,206.55352401),vector4(2119.75244140625,4810.1103515625,41.29072570800781,206.68899726),vector4(2117.08447265625,4808.8095703125,41.29114532470703,206.03996658),vector4(2114.50048828125,4807.24560546875,41.28388595581055,206.03812789),vector4(2111.862548828125,4805.89697265625,41.26286697387695,206.90281677),vector4(2108.915771484375,4804.4892578125,41.24271392822265,206.75727272),vector4(2106.2294921875,4803.01416015625,41.21941757202148,206.51944732),vector4(2103.568359375,4801.74462890625,41.19225692749023,206.04570007),vector4(2100.781494140625,4800.416015625,41.17974853515625,206.20686149),vector4(2098.142822265625,4799.20361328125,41.17882919311523,206.14974975),vector4(2095.4267578125,4797.78466796875,41.18031311035156,206.35161209),vector4(2092.906494140625,4796.6220703125,41.18094635009765,206.43486976),vector4(2090.23486328125,4795.35986328125,41.17909622192383,206.87253761),vector4(2087.740966796875,4793.96875,41.17329025268555,206.97082901),vector4(2085.240966796875,4792.48876953125,41.16060638427734,206.84307098),vector4(2082.638427734375,4791.18212890625,41.17189407348633,206.83695602),vector4(2079.881591796875,4789.70751953125,41.17799758911133,206.17084503),vector4(2077.3515625,4788.40234375,41.17283630371094,206.88661003),vector4(2074.6982421875,4787.13916015625,41.16886901855469,206.64068031),vector4(2072.076416015625,4785.88427734375,41.16541290283203,206.89089775),vector4(2069.277099609375,4784.74853515625,41.17276382446289,206.96844863),vector4(2066.49169921875,4783.48828125,41.17638397216797,206.31265640),vector4(2063.76416015625,4782.30029296875,41.17766571044922,206.34896469),vector4(2060.90087890625,4782.36865234375,41.10327529907226,206.79421234),vector4(2060.20361328125,4781.076171875,41.18378829956055,206.7590389),vector4(2057.503173828125,4779.15380859375,41.17803573608398,206.25488662),vector4(2054.58837890625,4777.54638671875,41.17562103271484,206.55599212),vector4(2052.03662109375,4776.095703125,41.17168045043945,206.26209259),vector4(2049.41015625,4774.45166015625,41.1674690246582,206.76375389),vector4(2046.770751953125,4773.251953125,41.17098236083984,206.59071350),vector4(2044.2613525390626,4771.70556640625,41.17024230957031,206.33675956),vector4(2041.631103515625,4770.42822265625,41.16479873657226,206.06819725),vector4(2038.8421630859376,4769.01904296875,41.16914367675781,206.2092170),vector4(2036.1064453125,4767.73779296875,41.17037963867187,206.99063873),vector4(2033.1483154296876,4766.533203125,41.16816329956055,206.03743934),vector4(2030.6527099609376,4765.08544921875,41.1674919128418,206.03893280),vector4(2028.1197509765626,4763.87353515625,41.1624870300293,206.81921005),vector4(2025.365478515625,4762.7451171875,41.16742706298828,206.62331008),vector4(2022.552490234375,4761.5390625,41.1703872680664,206.22551536),vector4(2019.7567138671876,4760.09326171875,41.16890716552734,206.8874568),vector4(2017.185791015625,4758.8798828125,41.16946792602539,206.10376739),vector4(2014.23828125,4757.86865234375,41.1692008972168,206.6216869),vector4(2011.645751953125,4756.66455078125,41.16809844970703,206.55478286),vector4(2008.912841796875,4755.36328125,41.16510009765625,206.36748123),vector4(2005.86669921875,4753.83642578125,41.17069625854492,206.64175605),vector4(2003.1854248046876,4752.501953125,41.17187118530273,206.79836082),vector4(2000.2091064453126,4751.2255859375,41.17245864868164,206.24281120),vector4(1997.4884033203126,4749.86669921875,41.17141723632812,206.06285858),vector4(1994.495361328125,4748.828125,41.1755485534668,206.48661041),vector4(1991.4224853515626,4747.51904296875,41.17765808105469,206.76885032),vector4(1988.2996826171876,4746.46044921875,41.17894744873047,206.17361450),vector4(1985.2049560546876,4745.208984375,41.18054962158203,206.09859848),vector4(1982.4468994140626,4744.1064453125,41.18366241455078,206.68365287),vector4(1979.4046630859376,4742.6953125,41.18201065063476,206.87860488),vector4(1977.060302734375,4740.84521484375,41.17095947265625,206.94916725),vector4(1974.3072509765626,4739.37060546875,41.17459106445312,206.88680648),vector4(1971.289794921875,4738.5205078125,41.17967987060547,206.57362556),vector4(1968.017822265625,4737.12451171875,41.17974472045898,206.28218460),vector4(1963.814208984375,4735.41357421875,41.18144607543945,206.82899284),vector4(1960.9561767578126,4734.03955078125,41.18037414550781,206.66239547),vector4(1957.9788818359376,4732.86474609375,41.1835823059082,206.32951545),vector4(1954.9173583984376,4731.63525390625,41.18645095825195,206.43713569),vector4(1952.000732421875,4729.43994140625,41.18073272705078,206.26083946),vector4(1949.5499267578126,4727.107421875,41.17274856567383,206.27724266),vector4(1946.3787841796876,4725.59716796875,41.17145919799805,206.01044654),vector4(1946.3787841796876,4725.59716796875,41.17145919799805,206.01044654),vector4(1942.95849609375,4724.814453125,41.17223739624023,206.60321807),vector4(1939.406982421875,4724.18115234375,41.18531036376953,206.75473022),vector4(1937.1929931640626,4722.10546875,41.0885009765625,206.24006271),vector4(1933.5877685546876,4720.80029296875,41.20269775390625,206.4063606),vector4(1930.9432373046876,4718.90234375,41.22670745849609,206.81988143),vector4(1928.02197265625,4717.5078125,41.24966430664062,206.04547119),vector4(1925.2093505859376,4715.54052734375,41.27740859985351,206.6380672),vector4(1923.7904052734376,4710.6220703125,41.28340911865234,206.60626983)}