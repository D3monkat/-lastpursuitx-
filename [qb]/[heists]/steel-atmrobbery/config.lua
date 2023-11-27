Config = {} 

-- Global QBCore Configuration
Config.CoreSettings = {
    Core = 'QBCore', -- Your core name for all QBCore Functions
    CoreFolder = 'qb-core', -- Your core name
}

Config.ServerSideNotify = 'QBCore:Notify' -- If you have other base change
Config.Target = "qb-target" -- Your target script name

-- ALERTS
Config.Alert = 'cd_dispatch'-- ps-dispatch / cd_dispatch
Config.TitleCDispatch = 'ATM Robbery' -- CD Dispatch Title / EDIT THIS IF U USE CD_DISPATCH
Config.TextGPSCDispatch = '911 - ATM Robbery' -- What's shown in GPS CD Dispatch / EDIT THIS IF U USE CD_DISPATCH
Config.PSDispatch = 'ps-dispatch' -- Change this if you renamed the ps-dispatch to some qb-dispatch or other wise....

-- YOU CAN USE BOTH ITEM REWARD AND CASH REWARD IT WILL GIVE CASH AND YOUR ITEM... --
Config.CashReward = true -- Is gonna the atm give cash?
Config.RewardType = 'cash' -- Choose Reward type Cash / Bank
Config.YourRewardCash = math.random(10000, 50000) -- HOW MUCH CASH YOU WILL EARN FROM ATM
-- ITEM REWARD
Config.MinimumCops = 0 -- How many cops to take the atm robbery??
Config.ItemReward = false -- Is this enabled
Config.RewardItem = 'keycard1' -- Item Reward
Config.RewardAmount = 1 -- How much item do you wanna?

-- DRAW
Config.DrawText = '[E] Add The Rope to ATM | [X] Remove Rope'
Config.DrawTextSide = 'left' -- Side of the drawtext

-- ROPE
Config.RopeItemName = "atmrope" -- Rope Item
Config.RopeItemCount = 1 -- how many removed rope you wanna when start

-- TARGET
Config.CrackTarget = 'fas fa-circle'

-- PROGRESSBAR
Config.AttachToAtmTime = 5000
Config.UseRope = 5000
Config.CrackingTheATM = 5000

-- ANIMS
Config.AttachRopeCarAnimDict = "mini@repair"
Config.AttachRopeCarAnim = "fixing_a_ped"
Config.CrackingAnimDict = "mini@repair"
Config.CrackingAnim = "fixing_a_ped"

-- LANGUAGE
Config.Locales = {
    ['crackAtm'] = "Crack the ATM",
    ['gotyouvictory'] = "You got ",
    ['addtoatms'] = 'Adding the Rope to the ATM',
    ['addtovehicle'] = 'Adding the Rope to the Vehicle',
    ['cancel'] = 'Cancelled',
    ['atmcracking'] = "Cracking the ATM....",
    ['failedahh'] = "You failed the robbery...",
    ['successh'] = "You have hacked the ATM!!!!",
    ['nopolicebad'] = "There are currently isn't any Police in the city",
}