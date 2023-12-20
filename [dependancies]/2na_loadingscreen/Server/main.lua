ConfigUpdateKeys = {}

AddEventHandler('playerConnecting', function(_, _, deferrals)
    local source = source
    local loadingScreenData = {}
    
    deferrals.defer()

    loadingScreenData.update = Config.RecentUpdate
    loadingScreenData.gallery = Config.GalleryImages
    loadingScreenData.rpvideo = Config.RPVideo
    loadingScreenData.keyboard = Config.KeyboardBindings
    loadingScreenData.player = {
        id = source,
        name = GetPlayerName(source)
    }

    deferrals.handover(loadingScreenData)

    deferrals.done()

end)