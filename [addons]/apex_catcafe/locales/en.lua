--██╗      █████╗ ███╗   ██╗ ██████╗ ██╗   ██╗ █████╗  ██████╗ ███████╗
--██║     ██╔══██╗████╗  ██║██╔════╝ ██║   ██║██╔══██╗██╔════╝ ██╔════╝
--██║     ███████║██╔██╗ ██║██║  ███╗██║   ██║███████║██║  ███╗█████╗  
--██║     ██╔══██║██║╚██╗██║██║   ██║██║   ██║██╔══██║██║   ██║██╔══╝  
--███████╗██║  ██║██║ ╚████║╚██████╔╝╚██████╔╝██║  ██║╚██████╔╝███████╗
--╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝

local Translations = {
    --[[ General ]]--
    error = {
        someone_sitting_here = 'There is someone sitting here!',
        missing_ingredients = 'You don\'t have all the ingredients',
        cancelled = 'You changed your mind',
    },
    warning = {
    },
    info = {
        player_id = 'ID of Player',
        alreadyplaying = 'Music is already playing',
    },
    success = {
    },
    --[[ Commands ]]--
    commands = {
    },
    --[[ Menu ]]--
    menu = {
        cuttingboard = 'Cuttingboard',
        cuttingboardicon = 'fas fa-tablet',
        prepare = 'Prepare Food',
        prepareicon = 'fas fa-hamburger',
        stove = 'Stove',
        stoveicon = 'fas fa-fire-burner',
        oven = 'Oven',
        ovenicon = 'fas fa-temperature-high',
        drinkmachine = 'Drinks Dispenser',
        drinkmachineicon = 'fas fa-faucet',
        exit = 'Return',
        exiticon = 'fas fa-circle-arrow-left',
        wardrobe = 'Wardrobe',
        wardrobeicon = 'fas fa-shirt',
        buyuniform = 'Buy Uniform',
        buyuniformtext = 'Open our builtin store',
        buyuniformicon = 'fas fa-tags',
        changeuniform = 'Change Uniform',
        changeuniformtext = 'Open your wardrobe',
        changeuniformicon = 'fas fa-shirt',
        personallocker = 'Personal Locker',
        personallockertext = 'Your personal locker',
        personallockericon = 'fas fa-lock',
    },
    --[[ Input ]]--

    --[[ Progressbar ]]--
    progressbar = {
        makingdrink = 'Making drink...',
        makingfood = 'Making food...',
    },
    --[[ Functions ]]--

    --[[ Targets ]]--
    target = {
        sit = 'Sit',
        siticon = 'fas fa-chair',
        bossmenu = 'Boss Menu',
        bossmenuicon = 'fas fa-chart-simple',
        toggleduty = 'Change Duty Status',
        toggledutyicon = 'fas fa-clipboard',
        wardrobe = 'Wardrobe',
        wardrobeicon = 'fas fa-shirt',
        cuttingboard = 'Use Cuttingboard',
        cuttingboardicon = 'fas fa-tablet',
        prepare = 'Prepare Food',
        prepareicon = 'fas fa-hamburger',
        stove = 'Use Stove',
        stoveicon = 'fas fa-fire-burner',
        oven = 'Use Oven',
        ovenicon = 'fas fa-temperature-high',
        storage = 'Storage',
        storageicon = 'fas fa-box',
        ingredients = 'Ingredients',
        ingredientsicon = 'fas fa-temperature-low',
        freezer = 'Freezer',
        freezericon = 'fas fa-cubes',
        drinkmachine = 'Use Drinks Dispenser',
        drinkmachineicon = 'fas fa-faucet',
        cashregister = 'Cash Register',
        cashregistericon = 'fas fa-cash-register',
        table = 'Table',
        tableicon = 'fas fa-tablet',
        tray = 'Tray',
        trayicon = 'fas fa-tablet',
    },
    --[[ Other ]]--
    other = {
        storage = ' | Storage',
        personalstash = 'Personal Stash',
        requirements = 'Requirements:',
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})