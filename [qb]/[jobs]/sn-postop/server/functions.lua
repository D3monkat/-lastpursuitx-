function Salary(id, type)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local money = 0
    local mem = exports["ps-playergroups"]:getGroupMembers(id)
    local nguoi = 0
    for k, v in ipairs(mem) do
        nguoi = nguoi + 1
    end
    if type == "prime" then
        money = Config.MoneyP
        if Config.Company then
            if Config.Management == 'qb-management' then
                exports["qb-management"]:AddMoney('postop', math.floor((money * Config.CompanyCut) / 100))
            elseif Config.Management == 'renewed-banking' then
                exports['Renewed-Banking']:addAccountMoney('postop', math.floor((money * Config.CompanyCut) / 100))
            elseif Config.Management == 'qb-bossmenu' then
                TriggerEvent('qb-bossmenu:server:addAccountMoney', 'postop', math.floor((money * Config.CompanyCut) / 100))
            end
        end
    elseif type == "express" then
        money = Config.MoneyE
    elseif type == "freight" then
        money = Config.MoneyF
    end
    if nguoi == 2 then
        money = math.floor(money * Config.groupMoney)
    end
    if Config.PsBuff then
        local buff = exports['ps-buffs']:HasBuff(Player.PlayerData.citizenid, Config.Buff)
        if buff then
            money = math.floor(money * Config.buffMoney)
        end
    end
    if Config.Meta.status then
        local x = Player.PlayerData.metadata[Config.Meta.type]
        Player.Functions.SetMetaData(Config.Meta.type, x + Config.Meta.amount)
    end
    Player.Functions.AddMoney('cash', money)
    TriggerClientEvent('QBCore:Notify', src, Lang:t("success.money", { value = money }), 'primary')
end