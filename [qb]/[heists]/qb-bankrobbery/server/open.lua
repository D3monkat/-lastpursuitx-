RegisterNetEvent('qb-bankrobbery:server:callCops', function(type, bank, streetLabel, coords)
    local cameraId = 4
    local bankLabel = 'Fleeca'
    local msg = ''
    if type == 'small' then
        cameraId = Config.FleecaBanks[bank]['camId']
        bankLabel = 'Fleeca'
        msg = 'The Alarm has been activated at '..bankLabel.. ' ' ..streetLabel..' (CAMERA ID: '..cameraId..')'
    elseif type == 'paleto' then
        cameraId = 26
        bankLabel = 'Blaine County Savings'
        msg = 'The Alarm has been activated at '..bankLabel.. ' Paleto Bay (CAMERA ID: '..cameraId..')'
    elseif type == 'pacific' then
        cameraId = Config.PacificBank['camId']
        bankLabel = 'Pacific Standard Bank'
        msg = 'The Alarm has been activated at '..bankLabel.. ' Alta St (CAMERA ID: 1/2/3)'
    end
    local alertData = {
        title = 'Bank robbery',
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = msg,
    }
    TriggerClientEvent('qb-bankrobbery:client:robberyCall', -1, type, bank, streetLabel, coords)
    TriggerClientEvent('qb-phone:client:addPoliceAlert', -1, alertData)
end)