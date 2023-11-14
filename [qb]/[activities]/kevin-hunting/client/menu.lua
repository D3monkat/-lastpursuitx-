local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('kevin-hunting:HuntingMenu', function (huntingrep)
    lib.registerContext({
        id = 'mainmenu',
        title = "Paleto Hunters",
        onExit = function()
            QBCore.Functions.Notify('Come again soon..', 'primary', 4500)
        end,
        options = {
            {
                title = 'Buy Supplies',
                image = Config.HunterMenuInfo['huntingbait'][1],
                event = 'kevin-hunting:OpenShop'
            },
            {
                title = 'Go Hunting',
                image = Config.HunterMenuInfo['hunterslogo'][1],
                event = 'kevin-hunting:GoHunt',
            },
            {
                title = 'Check Reputation',
                description = '',
                arrow = true,
                metadata = {
                    {label = 'Reputation', value = huntingrep},
                }
            },
            {
                title = 'Sell Carcasses',
                image = Config.HunterMenuInfo['deer'][3],
                event = 'kevin-hunting:SellMenu',
                menu = 'sellmenu'
            },
        },
        {
            id = 'sellmenu',
            title = 'Sell Carcasses',
            menu = 'mainmenu',
            options = {
                {
                    title = 'Sell Deer',
                    image = Config.HunterMenuInfo['deer'][1],
                    arrow = true,
                    menu = 'deermenu'
                },
                {
                    title = 'Sell Boar',
                    image = Config.HunterMenuInfo['boar'][1],
                    arrow = true,
                    menu = 'boarmenu'
                },
                {
                    title = 'Sell Coyote',
                    image = Config.HunterMenuInfo['coyote'][1],
                    arrow = true,
                    menu = 'coyotemenu'
                },
                {
                    title = 'Sell Mountain Lion',
                    image = Config.HunterMenuInfo['mtlion'][1],
                    arrow = true,
                    menu = 'mtlionmenu'
                },
                {
                    title = 'Sell Big Foot??',
                    image = Config.HunterMenuInfo['bigfoot'][1],
                    arrow = true,
                    menu = 'bigfootmenu'
                }
            },
        },
        {
            id = 'deermenu',
            title = 'Sell Deer',
            menu = 'sellmenu',
            options = {
                {
                    title = 'Sell Deer',
                    image = Config.HunterMenuInfo['deer'][1],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[1].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[1].item, price = Config.StoreInfo[1].price}
                },
                {
                    title = 'Sell Deer',
                    image = Config.HunterMenuInfo['deer'][2],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[2].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[2].item, price = Config.StoreInfo[2].price}
                },
                {
                    title = 'Sell Deer',
                    image = Config.HunterMenuInfo['deer'][3],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[3].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[3].item, price = Config.StoreInfo[3].price}
                },
                {
                    title = 'Sell Deer',
                    image = Config.HunterMenuInfo['deer'][4],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[4].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[4].item, price = Config.StoreInfo[4].price}
                },
            },
        },
        {
            id = 'boarmenu',
            title = 'Sell Boar',
            menu = 'sellmenu',
            options = {
                {
                    title = 'Sell Boar',
                    image = Config.HunterMenuInfo['boar'][1],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[9].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[9].item, price = Config.StoreInfo[9].price}
                },
                {
                    title = 'Sell Boar',
                    image = Config.HunterMenuInfo['boar'][2],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[10].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[10].item, price = Config.StoreInfo[10].price}
                },
                {
                    title = 'Sell Boar',
                    image = Config.HunterMenuInfo['boar'][3],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[11].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[11].item, price = Config.StoreInfo[11].price}
                },
                {
                    title = 'Sell Boar',
                    image = Config.HunterMenuInfo['boar'][4],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[12].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[12].item, price = Config.StoreInfo[12].price}
                },
            },
        },
        {
            id = 'coyotemenu',
            title = 'Sell Coyote',
            menu = 'sellmenu',
            options = {
                {
                    title = 'Sell Coyote',
                    image = Config.HunterMenuInfo['coyote'][1],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[5].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[5].item, price = Config.StoreInfo[5].price}
                },
                {
                    title = 'Sell Coyote',
                    image = Config.HunterMenuInfo['coyote'][2],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[6].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[6].item, price = Config.StoreInfo[6].price}
                },
                {
                    title = 'Sell Coyote',
                    image = Config.HunterMenuInfo['coyote'][3],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[7].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[7].item, price = Config.StoreInfo[7].price}
                },
                {
                    title = 'Sell Coyote',
                    image = Config.HunterMenuInfo['coyote'][4],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[8].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[8].item, price = Config.StoreInfo[8].price}
                },
            },
        },
        {
            id = 'mtlionmenu',
            title = 'Sell Mountain Lion',
            menu = 'sellmenu',
            options = {
                {
                    title = 'Sell Mountain Lion',
                    image = Config.HunterMenuInfo['mtlion'][1],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[13].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[13].item, price = Config.StoreInfo[13].price}
                },
                {
                    title = 'Sell Mountain Lion',
                    image = Config.HunterMenuInfo['mtlion'][2],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[14].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[14].item, price = Config.StoreInfo[14].price}
                },
                {
                    title = 'Sell Mountain Lion',
                    image = Config.HunterMenuInfo['mtlion'][3],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[15].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[15].item, price = Config.StoreInfo[15].price}
                },
                {
                    title = 'Sell Mountain Lion',
                    image = Config.HunterMenuInfo['mtlion'][4],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[16].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[16].item, price = Config.StoreInfo[16].price}
                },
            },
        },
        {
            id = 'bigfootmenu',
            title = 'Sell Big Foot??',
            menu = 'sellmenu',
            options = {
                {
                    title = 'Sell Big Foot',
                    image = Config.HunterMenuInfo['bigfoot'][1],
                    arrow = true,
                    metadata = {
                        {label = 'Price', value = '$ '..Config.StoreInfo[17].price},
                    },
                    serverEvent = 'kevin-hunting:sellcarcass',
                    args = {item = Config.StoreInfo[17].item, price = Config.StoreInfo[17].price}
                },
            },
        },
    })
    lib.showContext('mainmenu')
end)