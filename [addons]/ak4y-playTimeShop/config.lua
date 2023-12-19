-- ak4y dev.

-- IF YOU HAVE ANY PROBLEM OR DO YOU NEED HELP PLS COME TO MY DISCORD SERVER AND CREATE A TICKET
-- IF YOU DONT HAVE ANY PROBLEM YET AGAIN COME TO MY DISCORD :)
-- https://discord.gg/kWwM3Bx

AK4Y = {}

AK4Y.Framework = "qb" -- qb / oldqb | qb = export system | oldqb = triggerevent system
AK4Y.Mysql = "oxmysql" -- Check fxmanifest.lua when you change it! | ghmattimysql / oxmysql / mysql-async
AK4Y.OpenCommand = "playtimeShop"
AK4Y.DefaultGarage = "pillboxgarage" -- purchased vehicles will be sent to this garage
AK4Y.RewardCoin = 25
AK4Y.NeededPlayTime = 120 -- Minutes

AK4Y.Language = {
    title1 = "AK4Y",
    title2 = "Playtime",
    coin = "COIN",
    nextReward = "FOR THE NEXT COIN REWARD",
    exit = "EXIT",
    reward = "REWARD :",
    title3 = "TOP",
    title4 = "PLAYERS",
    title5 = "PLAYTIME",
    title6 = "SHOP",
    cancel = "CANCEL",
    buy = "BUY",
    accept = "ACCEPT",
    realCurrency = "$",
    nextPage = "NEXT PAGE",
    previousPage = "PRIVIOUS PAGE",
    succesfully = "SUCCESSFULLY",
    purchased = "PURCHASED",
    invalidCode = "INVALID CODE!",
    thxForPurch = "Thanks for purchasing!",
    top = "TOP",
    youDntHvEngMoney = "YOU DONT HAVE ENOUGH MONEY!",
    text6 = "6",
}

AK4Y.Categories = {
    { category = "vehicles", icon = "fa-solid fa-car", items = {} }, -- do not touch items section..
}

-- itemType : vehicle, weapon, item, money
AK4Y.Items = {
    { id = 1, itemName = "lpi8004", label = "lpi8004", price = 150, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/zentorno.png" },
    { id = 2, itemName = "rrc7w", label = "rrc7w", price = 100, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/kuruma.png" },
}

AK4Y.CoinList = {
    { coinCount = 300, realPrice = 30, link = "https://www.yourTebexLink.com/crediAmountPage.html", image = "./images/coin.png" },
    { coinCount = 100, realPrice = 50, link = "https://www.yourTebexLink.com/crediAmountPage.html", image = "./images/coin.png" },
    { coinCount = 700, realPrice = 70, link = "https://www.yourTebexLink.com/crediAmountPage.html", image = "./images/coin.png" },
    { coinCount = 900, realPrice = 90, link = "https://www.yourTebexLink.com/crediAmountPage.html", image = "./images/coin.png" },
    { coinCount = 1200, realPrice = 120, link = "https://www.yourTebexLink.com/crediAmountPage.html", image = "./images/coin.png" },
    { coinCount = 1500, realPrice = 150, link = "https://www.yourTebexLink.com/crediAmountPage.html", image = "./images/coin.png" },
}