config = {
    -- Set whether you want to be informed in your server's console about updates regarding this resource.
    ['updatesCheck'] = true,

    -- Enabling debug will draw lines useful for debugging, especially when creating a new config entry.
    ['debug'] = false,

    -- The DUI URL, by default loaded locally.
    ['duiUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/index.html',

    -- Strings through-out the resource to translate them if you wish.
    ['lang'] = {
        ['addToQueue'] = 'Add to Queue',
        ['videoToggle'] = 'Video Toggle',
        ['remoteControl'] = 'Remote Control',
        ['play'] = 'Play',
        ['queueNow'] = 'Queue Now',
        ['queueNext'] = 'Queue Next',
        ['remove'] = 'Remove',
        ['pause'] = 'Pause',
        ['stop'] = 'Stop',
        ['skip'] = 'Skip',
        ['loop'] = 'Loop',
        ['volume'] = 'Volume',
        ['invalidUrl'] = 'URL invalid.',
        ['invalidYouTubeUrl'] = 'YouTube URL invalid.',
        ['invalidTwitchUrl'] = 'Twitch URL invalid.',
        ['urlPlaceholder'] = 'YouTube / Twitch URL',
        ['sourceError'] = 'Playable media error occured.',
        ['twitchChannelOffline'] = 'Twitch channel offline.',
        ['twitchVodSubOnly'] = 'Twitch video subs-only.',
        ['twitchError'] = 'Twitch error occured.',
        ['youtubeError'] = 'YouTube error occured.',
        ['sourceNotFound'] = 'Playable media not be found.',
        ['liveFeed'] = 'Live Feed',
        ['twitchClip'] = 'Twitch Clip',
        ['queueLimitReached'] = 'The queue has already too many entries.'
    },

    -- Loading related timeouts, default values should work in most servers.
    ['timeouts'] = {
        ['assetLoadMs'] = 5000
    },

    ['featureDelayWithControllerInterfaceClosedMs'] = 500,

    -- This is a catch-all model entry that will work as a default for all vehicle models that do not have a specific model entry configured.
    -- It is highly recommended to configure model entries on a one-by-one basis as you see fit instead of using this catch-all as it might have a bigger impact on performance, use it at your own discretion.
    ['catchAllModel'] = {
        ['enabled'] = false,
        ['range'] = 32.0,
        ['autoAdjustTime'] = false,
        ['maxVolumePercent'] = 25,

        ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',

        ['lowPass'] = {
            ['checkDoors'] = {0, 1, 2, 3, 5},
            ['checkWindows'] = {0, 1}
        },

        ['replacers'] = nil,
        ['monitors'] = nil,

        ['speakers'] = {
            {
                ['soundOffset'] = nil,
                ['directionOffset'] = nil,
                ['maxDistance'] = 16.0,
                ['refDistance'] = 4.0,
                ['rolloffFactor'] = 1.25,
                ['coneInnerAngle'] = 90,
                ['coneOuterAngle'] = 180,
                ['coneOuterGain'] = 0.5,
                ['fadeDurationMs'] = 250,
                ['volumeMultiplier'] = 1.0,
                ['lowPassGainReductionPercent'] = 0
            }
        }
    },

    -- Visit our Discord over at https://criticalscripts.shop/discord to get more model entries and share yours too!

    ['models'] = {
        ['pbus2'] = {
            ['enabled'] = true,
            ['range'] = 128.0,
            ['autoAdjustTime'] = false,
            ['maxVolumePercent'] = 200,

            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',

            ['replacers'] = {
                {
                    ['name'] = 'h4_prop_battle_club_projector',
                    ['texture'] = 'script_rt_club_projector',
                    ['range'] = 32.0
                }
            },

            ['monitors'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(0.6, 0.0, 0.9),
                    ['rotation'] = vector3(0.0, 0.0, 90.0),
                    ['bone'] = 'misc_b',
                    ['lodDistance'] = 128
                },

                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(0.0, 0.0, 0.9),
                    ['rotation'] = vector3(0.0, 0.0, -90.0),
                    ['bone'] = 'misc_b',
                    ['lodDistance'] = 128
                },
                
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(-2.05, -2.0, 1.5),
                    ['rotation'] = vector3(0.0, 0.0, -90.0),
                    ['bone'] = 'pbusspeaker',
                    ['lodDistance'] = 128
                }
            },

            ['speakers'] = {
                {
                    ['soundOffset'] = nil,
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 112.0,
                    ['refDistance'] = 12.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                }
            }
        },

        ['moonbeam2'] = {
            ['enabled'] = false,
            ['range'] = 64.0,
            ['autoAdjustTime'] = false,
            ['maxVolumePercent'] = 50,

            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',

            ['lowPass'] = {
                ['checkDoors'] = {0, 1, 2, 3, 5},
                ['checkWindows'] = {0, 1}
            },

            ['replacers'] = nil,
            ['monitors'] = nil,

            ['speakers'] = {
                {
                    ['soundOffset'] = nil,
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 48.0,
                    ['refDistance'] = 4.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                }
            }
        },

        ['ninefjd'] = {
            ['enabled'] = false,
            ['range'] = 64.0,
            ['autoAdjustTime'] = false,
            ['maxVolumePercent'] = 50,

            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',

            ['lowPass'] = {
                ['checkDoors'] = {0, 2},
                ['checkWindows'] = {0, 1}
            },

            ['replacers'] = {
                {
                    ['name'] = 'xs_prop_arena_tablet_drone',
                    ['texture'] = 'prop_arena_tablet_drone_screen_d',
                    ['range'] = 8.0
                }
            },

            ['monitors'] = {
                {
                    ['hash'] = 'xs_prop_arena_tablet_drone_01',
                    ['position'] = vector3(0.795, 0.075, 0.0475),
                    ['rotation'] = vector3(7.5, -90.0, 0.0),
                    ['bone'] = 'dashglow',
                    ['lodDistance'] = 64
                }
            },

            ['speakers'] = {
                {
                    ['soundOffset'] = nil,
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 48.0,
                    ['refDistance'] = 4.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                }
            }
        },

        ['sultan'] = {
            ['enabled'] = false,
            ['range'] = 64.0,
            ['autoAdjustTime'] = false,
            ['maxVolumePercent'] = 50,

            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',

            ['lowPass'] = {
                ['checkDoors'] = {0, 1, 2, 3, 5},
                ['checkWindows'] = {0, 1}
            },

            ['replacers'] = nil,
            ['monitors'] = nil,

            ['speakers'] = {
                {
                    ['soundOffset'] = nil,
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 48.0,
                    ['refDistance'] = 4.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                }
            }
        }

        -- Below you can find a full model config entry reference.
        
        -- ['key'] = {
        --     ['enabled'] = boolean,
        --     ['range'] = number,
        --     ['maxVolumePercent'] = number,
        --     ['autoAdjustTime'] = boolean,

        --     ['idleWallpaperUrl'] = string,

        --     ['lowPass'] = {
        --         ['checkDoors'] = {number, ...},
        --         ['checkWindows'] = {number, ...}
        --     },

        --     ['replacers'] = {
        --         {
        --             ['name'] = string,
        --             ['texture'] = string,
        --             ['range'] = number

        --         },
        --         ...
        --     },

        --     ['monitors'] = {
        --         {
        --             ['hash'] = string,
        --             ['position'] = vector3(number, number, number),
        --             ['rotation'] = vector3(number, number, number),
        --             ['bone'] = string,
        --             ['lodDistance'] = number
        --         },
        --         ...
        --     },

        --     ['speakers'] = {
        --         {
        --             ['soundOffset'] = vector3(number, number, number),
        --             ['directionOffset'] = vector3(number, number, number),
        --             ['maxDistance'] = number,
        --             ['refDistance'] = number,
        --             ['rolloffFactor'] = number,
        --             ['coneInnerAngle'] = number,
        --             ['coneOuterAngle'] = number,
        --             ['coneOuterGain'] = number,
        --             ['fadeDurationMs'] = number,
        --             ['volumeMultiplier'] = number,
        --             ['lowPassGainReductionPercent'] = number
        --         },
        --         ...
        --     }
        -- }
    }
}
