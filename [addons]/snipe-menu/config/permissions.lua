
--[[
    All the roles here can access the admin menu
    Only the GOD can set the panels for the other roles
    There are 3 options
    1. God -> can access all the commands
    
    IMPORTANT: DO NOT REMOVE GOD ROLE, IF YOU DO SO, YOU WILL NOT BE ABLE TO ACCESS THE ADMIN MENU AT ALL

    If you have a new role, you can add it here and select to give either God, Admin or Moderator or any of the custom perms you want

    eg. ["new_role"] = "God",
    eg. ["dev"] = "Admin",
]]--
Config.GodRoles = {
    ["god"] = "God", -- This is the biggest role (DO NOT REMOVE THIS ROLE)
    ["admin"] = "Admin", -- This is just a custom role
    ["mod"] = "Moderator", -- This is just a custom role
    -- ["new_role1"] = "Test", -- if you want to add more roles just add them here
    -- ["new_role2"] = "Test", -- if you want to add more roles just add them here
    -- ["new_role3"] = "Test",
    -- if you want to add more roles just add them here
    -- ["NEW_ROLE_HERE"] = "God",
    -- ["NEW_ROLE_HERE"] = "Admin",
    -- ["NEW_ROLE_HERE"] = "Moderator",
}

Config.Permissions = {
    ["fivem:1651474"] = "god", -- the role god, admin or mod should be the key from Config.GodRoles which means the values that are added in square brackets.
    -- ["fivem:8420016"] = "god", -- the role god, admin or mod should be the key from Config.GodRoles which means the values that are added in square brackets.
    ["fivem:601252"] = "god", ---Tony license:987a822c2c37b741fe7730121a6b3ce0c3f33de3

    ["license:a0d50cfdb39e0f75bef7ac811598de557281396e"] = "god",
    ["license:987a822c2c37b741fe7730121a6b3ce0c3f33de3"] = "god",
    ["license:ef026ed73ea27e107677db3d886ff38cce730793"] = "god",
    ["license:65477ea61ce5bb25cfb92cfa49285c203cfb1d12"] = "god",
    ["license:30d812d5f5281e72065ab29b21986e503270a667"] = "god", -- discord roles (copy the role id and paste it here) (REQUIRES badger_discord_api)
    ["license:68c5e90217783f07ca806058ee79805aa13a4a0c"] = "mod", -- citizenid for qbcore
    ["license:5969458e78a69dba91d29c5a36a62fb56e11a13f"] = "god", -- charid for ESX
    ["license:09dce0bcf649f1718bb653a3c77a59f53cb5cdb5"] = "god", -- charid for ESX
    ["license:48e5198fb6de7a559e21e62573302350d7e3ada4"] = "god", -- goose

    -- ["license:6d3b6254a50416697dcaa91878e2eb03d9112302"] = {"mod", "admin"}, -- the role god, admin or mod should be the key from Config.GodRoles which means the values that are added in square brackets.
    -- ["license:1234"] = "admin",
    -- ["license:1234"] = "mod",
    -- ["license:1234"] = "new_role1",
    -- ["license:1234"] = "new_role2",
    -- ["license:1234"] = "new_role3",
}

