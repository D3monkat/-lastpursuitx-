![Brazzers Development Discord](https://i.imgur.com/nXhPxIO.png)

<details>
    <summary><b>Important Links</b></summary>
        <p>
            <a href="https://discord.gg/J7EH9f9Bp3">
                <img alt="GitHub" src="https://logos-download.com/wp-content/uploads/2021/01/Discord_Logo_full.png"
                width="150" height="55">
            </a>
        </p>
        <p>
            <a href="https://ko-fi.com/mannyonbrazzers">
                <img alt="GitHub" src="https://uploads-ssl.webflow.com/5c14e387dab576fe667689cf/61e11149b3af2ee970bb8ead_Ko-fi_logo.png"
                width="150" height="55">
            </a>
        </p>
</details>

# Installation steps

## General Setup
A group based towing system, allowing you to group with your friends and earn rewards together with AI missions and player marked vehicles. This system is also the only system available to finally introduce synced hooking with all players, and saving tow states with state bags. This system also gives you the capability for a full standalone version just in case users don't utilize renewed phone and cannot use the grouping features. This system is absolutely amazing for roleplaying within any server and is a must need for your community.

Make sure to include this line in your qbcore/server/player.lua (IF YOU DON'T HAVE THIS LINE AND YOU'RE OUTDATED LIKE ME)
```lua
    PlayerData.metadata['jobrep'] = PlayerData.metadata['jobrep'] or {}
    PlayerData.metadata['jobrep']['tow'] = PlayerData.metadata['jobrep']['tow'] or 0
```

If you're planning to use the tier system the generate vehicles then, similar to jl-laptop (You must add minimum 2 cars per tier to make it work) Headover to your qb-core/shared/vehicles and add this to all your following vehicles:
```lua
    ["tier"] = "D" -- Can either be D, C, B, A, S
```
Example:
```lua
QBShared.Vehicles = {
    ['vagrant'] = {
        ['name'] = 'Vagrant',
        ['brand'] = 'Maxwell',
        ['model'] = 'vagrant',
        ['price'] = 607500,
        ['category'] = 'compacts',
        ['hash'] = `vagrant`,
        ['shop'] = 'pdm',
        ["tier"] = "B", -- Can either be D, C, B, A, S

    },
    -- Your other cars
}
```

## Compatibility
This system is compatible with (ox_target, ox_lib, ox_fuel, etc) & (qb-target, qb-menu, ps-fuel, etc) All options are in the config to modify your prefered style of installation

## Features
1. Unique-Synced Hooking/ Unhooking Capabilities (Utilizing State Bags)
2. Group Based Towing utilizing Renewed's Phone OR Standalone Option
3. Unique Queue System With Custom AI Missions (35+ Set Locations)
4. Unique Leveling System/ Rep Based With Vehicle Classes (D,C,B,A,S)
5. Group Rewards Both Cash & Rep
6. Ability To Blacklist Models/ Classes
7. Full OX Support
8. Multi-Notification Support
9. Multi-Language Support
10. Runs 0.00ms Idle & During Usage
11. 24/7 Support in discord

## Dependencies
1. qbcore
2. qb-target or ox_target
3. ox_lib or qb-menu