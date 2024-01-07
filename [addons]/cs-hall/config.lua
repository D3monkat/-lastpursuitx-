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
        ['bassSmoke'] = 'Bass Smoke',
        ['bassSparklers'] = 'Bass Sparklers',
        ['triggerSmoke'] = 'Trigger Smoke',
        ['triggerSparklers'] = 'Trigger Sparklers',
        ['whiteSpotlights'] = 'White Spotlights',
        ['dynamicSpotlights'] = 'Dynamic Spotlights',
        ['photorythmicSpotlights'] = 'Photorythmic Spotlights',
        ['videoToggle'] = 'Video Toggle',
        ['screenControl'] = 'Screen Control',
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
        ['queueLimitReached'] = 'The queue has already too many entries.',
        ['scenes'] = 'Scenes',
        ['allUrlPlaceholder'] = 'URL',
        ['frame'] = 'Frame'
    },

    -- Loading related timeouts, default values should work in most servers.
    ['timeouts'] = {
        ['scaleformRequestMs'] = 30000,
        ['assetLoadMs'] = 30000,
        ['syncAssetLoadMs'] = 3000
    },

    -- Visit our Discord over at https://criticalscripts.shop/discord to get more entries and share yours too!

    ['entries'] = {
        -- Vanilla Unicorn
        -- If you are using the default Vanilla Unicorn or a similar variant of it, keep it enabled below.

        -- This entry does not require an extra map.

        ['fivedevs_vanilla_unicorn'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://cdn.discordapp.com/attachments/1080187767511847045/1135839700729475082/Untitled_design.gif',
            ['maxVolumePercent'] = 100,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },

            ['area'] = {
                ['range'] = 128.0,
                ['center'] = vector3(103.64, -1292.14, 29.2),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 27.0,
                                ['max'] = 32.0
                            },
        
                            ['points'] = {
                                vector2(139.37, -1286.14),
                                vector2(136.05, -1279.98),
                                vector2(133.24, -1275.47),
                                vector2(128.67, -1276.76),
                                vector2(121.51, -1278.23),
                                vector2(114.19, -1278.97),
                                vector2(110.07, -1280.59),
                                vector2(100.52, -1282.48),
                                vector2(101.44, -1285.23),
                                vector2(104.67, -1290.09),
                                vector2(114.25, -1305.41),
                                vector2(126.52, -1298.37),
                                vector2(124.38, -1295.31),
                                vector2(129.06, -1292.22)
                            }
                        }
                    }
                }
            },

            ['disableEmitters'] = {
                'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
                'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
                'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM'
            },

            ['scaleform'] = nil,

            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
            },

            ['monitors'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_screen_02',
                    ['position'] = vector3(109.34, -1296.68, 31.22),
                    ['rotation'] = nil,
                    ['heading'] = 120.39,
                    ['lodDistance'] = nil
                }
            },

            ['screens'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(119.56, -1298.4, 32.53),
                    ['rotation'] = nil,
                    ['heading'] = 206.84,
                    ['lodDistance'] = nil,

                    ['advance'] = {
                        ['durationMs'] = 15000,
                        ['position'] = vector3(119.56, -1298.4, 33.53)
                    },
                },

                {
                    ['hash'] = 'prop_strip_pole_01',
                    ['position'] = vector3(103.27879333496, -1292.5457763672, 33.45863571167),
                    ['rotation'] = nil,
                    ['heading'] = 120.0,
                    ['lodDistance'] = nil,

                    ['advance'] = {
                        ['durationMs'] = 15000,
                        ['position'] = vector3(103.27879333496, -1292.5457763672, 31.61610946655)
                    }
                }
            },

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(119.69, -1282.76, 32.90),
                    ['rotation'] = nil,
                    ['heading'] = 357.17,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(108.9, -1288.73, 32.90),
                    ['rotation'] = nil,
                    ['heading'] = 60.91,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(116.74, -1300.65, 32.90),
                    ['rotation'] = nil,
                    ['heading'] = 236.77,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(122.73, -1297.07, 32.90),
                    ['rotation'] = nil,
                    ['heading'] = 177.46,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(123.6, -1288.43, 32.10),
                    ['rotation'] = nil,
                    ['heading'] = 300.00,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(110.45, -1298.54, 28.42),
                    ['rotation'] = nil,
                    ['heading'] = 283.82,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 0, 255}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(108.2, -1295.15, 28.42),
                    ['rotation'] = nil,
                    ['heading'] = 293.63,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 0, 255}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(118.94, -1290.43, 28.43),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(119.59, -1291.61, 28.43),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(113.61, -1293.45, 28.43),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(114.38, -1294.62, 28.43),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                }
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(124.15, -1295.75, 28.52),
                    ['rotation'] = nil,
                    ['heading'] = 207.95,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 52.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(116.43, -1300.22, 28.52),
                    ['rotation'] = nil,
                    ['heading'] = 215.77,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                }
            }
        },


    ['parking_cinema_large'] = {
    ['enabled'] = true,
    ['autoAdjustTime'] = false,
    ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
    ['maxVolumePercent'] = 200,
    ['smokeFxMultiplier'] = 3,
    ['smokeTimeoutMs'] = 5000,
    ['sparklerFxMultiplier'] = 1,
    ['sparklerTimeoutMs'] = 1500,
    ['delayBetweenSmokeChainMs'] = 1500,
    ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
    ['featureDelayWithControllerInterfaceClosedMs'] = 500,

    ['bass'] = nil,

    ['area'] = {
        ['range'] = 128.0,
        ['center'] = vector3(-1708.77, -905.75, 14.07),
        ['height'] = nil,
        ['polygons'] = nil
    },

    ['disableEmitters'] = nil,

    ['scaleform'] = {
        ['solid'] = true,
        ['flag'] = false,
        ['position'] = vector3(-1700.55, -911.95, 18.35),
        ['rotation'] = vector3(0.0, 0.0, -140.35),
        ['scale'] = vector3(0.845, 0.455, 0.0)
    },

    ['replacers'] = nil,

    ['monitors'] = {
        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1708.0703, -906.0299, 10.112692),
            ['rotation'] = nil,
            ['heading'] = -39.74569,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1708.0703, -906.0239, 16.045633),
            ['rotation'] = nil,
            ['heading'] = -39.74569,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1713.1582, -901.8113, 10.112692),
            ['rotation'] = nil,
            ['heading'] = -39.74569,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1703.5819, -909.75867, 10.112692),
            ['rotation'] = nil,
            ['heading'] = -39.74569,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1713.1582, -901.8113, 16.045633),
            ['rotation'] = nil,
            ['heading'] = -39.74569,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1703.5796, -909.75867, 16.045633),
            ['rotation'] = nil,
            ['heading'] = -39.74569,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1708.4623, -905.87384, 15.529058),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1708.4103, -905.9194, 10.596061),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1713.2186, -901.93274, 15.529058),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1713.2185, -901.93225, 10.599154),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1704.3209, -909.3089, 15.529058),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1704.3209, -909.3089, 10.591772),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_billb_frame01a',
            ['position'] = vector3(-1702.4642, -912.5856, 6.7018266),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_billb_frame01a',
            ['position'] = vector3(-1716.6082, -900.8562, 6.7031603),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_billb_frame01a',
            ['position'] = vector3(-1709.3938, -906.8314, 6.6993837),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        }        
    },

    ['screens'] = nil,

    ['spotlights'] = {
        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1700.0432, -912.8055, 16.997484),
            ['rotation'] = vector3(79.81944, 39.95835, -168.51068),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 255, 0}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1699.9872, -912.75525, 18.572235),
            ['rotation'] = vector3(-89.1767, 15.263356, 62.73788),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {15, 3, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1717.0707, -898.5253, 16.99997),
            ['rotation'] = vector3(79.8196, 39.95832, 4.3027616),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {3, 83, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1717.0271, -898.52234, 18.567598),
            ['rotation'] = vector3(-89.17813, 15.263419, -116.71412),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 5, 190}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1708.5563, -905.6041, 19.142105),
            ['rotation'] = vector3(0.6012019, -179.44646, 145.56659),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 1, 1}
        }
    },

    ['smokers'] = nil,
    ['sparklers'] = nil,

    ['speakers'] = {
        {
            ['hash'] = 'xs_propintarena_speakers_01a',
            ['visible'] = false,
            ['position'] = vector3(-1708.5303, -905.79474, 16.172209),
            ['rotation'] = vector3(-0.39775264,86.46773, 48.647858),
            ['heading'] = nil,
            ['lodDistance'] = nil,
            ['soundOffset'] = nil,
            ['distanceOffset'] = vector3(0.75, -0.66, 0),
            ['maxDistance'] = 32.0,
            ['refDistance'] = 16.0,
            ['rolloffFactor'] = 1.25,
            ['coneInnerAngle'] = 90,
            ['coneOuterAngle'] = 180,
            ['coneOuterGain'] = 0.5,
            ['fadeDurationMs'] = 250,
            ['volumeMultiplier'] = 1.0,
            ['lowPassGainReductionPercent'] = 15
        }
    }
},
        
        ['vanilla_unicorn'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },

            ['area'] = {
                ['range'] = 128.0,
                ['center'] = vector3(103.64, -1292.14, 29.2),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 27.0,
                                ['max'] = 32.0
                            },
        
                            ['points'] = {
                                vector2(119.42, -1299.34),
                                vector2(116.07, -1294.06),
                                vector2(114.62, -1292.96),
                                vector2(104.46, -1299.08),
                                vector2(97.68, -1287.27),
                                vector2(107.61, -1281.02),
                                vector2(119.01, -1279.61),
                                vector2(125.75, -1277.27),
                                vector2(128.81, -1276.93),
                                vector2(134.08, -1287.12),
                                vector2(130.99, -1289.47),
                                vector2(132.76, -1292.06),
                                vector2(134.37, -1294.44),
                                vector2(128.49, -1298.07),
                                vector2(124.62, -1300.01),
                                vector2(122.72, -1297.48)
                            }
                        }
                    }
                }
            },

            ['disableEmitters'] = {
                'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
                'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
                'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM'
            },

            ['scaleform'] = nil,

            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
            },

            ['monitors'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_screen_02',
                    ['position'] = vector3(122.83245849609, -1282.1744384766, 30.500564575195),
                    ['rotation'] = nil,
                    ['heading'] = 209.32180786133,
                    ['lodDistance'] = nil
                }
            },

            ['screens'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(103.27879333496, -1292.5457763672, 33.85863571167),
                    ['rotation'] = nil,
                    ['heading'] = 120.0,
                    ['lodDistance'] = nil,

                    ['advance'] = {
                        ['durationMs'] = 15000,
                        ['position'] = vector3(103.27879333496, -1292.5457763672, 31.71610946655)
                    }
                }
            },

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(104.79130554199, -1291.6781005859, 32.583999633789),
                    ['rotation'] = nil,
                    ['heading'] = 120.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(108.38147735596, -1296.1878662109, 32.080726623535),
                    ['rotation'] = nil,
                    ['heading'] = 210.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(110.11848449707, -1295.0183105469, 32.080333709717),
                    ['rotation'] = nil,
                    ['heading'] = 210.0,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(102.0936050415, -1285.4376220703, 32.090923309326),
                    ['rotation'] = nil,
                    ['heading'] = 30.0,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(104.02025604248, -1284.3253173828, 32.090923309326),
                    ['rotation'] = nil,
                    ['heading'] = 30.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(98.421371459961, -1287.4619140625, 27.24342918396),
                    ['rotation'] = nil,
                    ['heading'] = 76.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(104.74859619141, -1298.3879394531, 27.24342918396),
                    ['rotation'] = nil,
                    ['heading'] = 165.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(105.01, -1289.6500244141, 28.270687103271),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(106.60453033447, -1292.4583740234, 28.270687103271),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                }
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(103.99552154541, -1296.3807373047, 28.256807327271),
                    ['rotation'] = nil,
                    ['heading'] = 130.0,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(100.32069396973, -1289.9753417969, 28.256807327271),
                    ['rotation'] = nil,
                    ['heading'] = 115.0,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                }
            }
        },

        --BahamasFiv3Devs
 
        ['bahamas'] = {
            ['enabled'] = true,
 
            ['idleWallpaperUrl'] = 'https://files.criticalscripts.shop/cs-hall-dui/wallpaper.png',
 
            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },
 
                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },
 
            ['monitors'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_screen_02',
                    ['position'] = vector3(-1389.61, -608.01, 33.35),
                    ['heading'] = 130.15
                }
            },
 
            ['area'] = {
                ['range'] = 98,
                ['center'] = vector3(-1389.96, -608.3, 33.3),
 
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
 
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 10.0,
                                ['max'] = 95.0
                            },
 
                            ['points'] = {
                                vector2(-1390.62, -625.92),
                                vector2(-1400.90, -625.93),
                                vector2(-1408.39, -618.41),
                                vector2(-1407.66, -612.85),
                                vector2(-1410.20, -611.30),
                                vector2(-1414.874, -605.04),
                                vector2(-1385.51, -585.58),
                                vector2(-1382.25, -585.88),
                                vector2(-1381.33, -589.43),
                                vector2(-1384.67, -597.15),
                                vector2(-1381.975, -596.0469),
                                vector2(-1375.698, -597.2661),
                                vector2(-1370.95, -605.67),
                                vector2(-1371.55, -609.83),
                                vector2(-1374.091, -613.4977),
                                vector2(-1374.451, -622.2185),
                                vector2(-1375.85, -626.24),
                                vector2(-1374.40,-629.07),
                                vector2(-1380.51,-633.21),
                                vector2(-1387.91, -628.9114)
                            }
                        }
                    }
                }
            },
 
            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['ba_prop_battle_club_projector'] = 'script_rt_club_projector'
            },
 
            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1379.76, -602.28, 37.62),
                    ['heading'] = 291.03,
                    ['color'] = {255, 5, 190}
                },
 
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1385.82, -614.77, 40.03),
                    ['heading'] = 174.81,
                    ['color'] = {255, 255, 0}
                },
 
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1392.31, -617.31, 40.45),
                    ['heading'] = 127.57,
                    ['color'] = {3, 83, 255}
                },
 
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1398.66, -599.48, 40.07),
                    ['heading'] = 83,
                    ['color'] = {15, 3, 255}
                },
 
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1392.28, -591.87, 39.64),
                    ['heading'] = 5.12,
                    ['color'] = {255, 1, 1}
                },
 
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1373.31, -608.23, 37.51),
                    ['heading'] = 254.73,
                    ['color'] = {255, 5, 190}
                },
 
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1380.38, -598.45, 37.2),
                    ['heading'] = 277.49,
                    ['color'] = {255, 1, 44}
                }
 
            },
 
            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,
 
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },
 
                    ['position'] = vector3(-1385.77, -609.7, 30.15),
                    ['heading'] = 104.2,
                    ['color'] = {255, 215, 83}
                },
 
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,
 
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },
 
                    ['position'] = vector3(-1391.5, -604.2, 30.04),
                    ['heading'] = 185.11,
                    ['color'] = {255, 215, 83}
                },
 
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,
 
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },
 
                    ['position'] = vector3(-1391.17, -607.68, 37.7),
                    ['heading'] = 356.85,
                    ['color'] = {255, 215, 83}
                },
 
 
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,
 
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },
 
                    ['position'] = vector3(-1375.0, -604.84, 33.65),
                    ['heading'] = 279.25,
                    ['color'] = {255, 215, 83}
                },
 
 
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,
 
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },
 
                    ['position'] = vector3(-1399.64, -596.2, 33.3),
                    ['heading'] = 83.42,
                    ['color'] = {255, 215, 83}
                }
 
            },
 
            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
 
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },
 
                    ['position'] = vector3(-1392.22, -604.32, 32.39),
                    ['heading'] = 0.0,
                    ['color'] = {255, 215, 0}
                },
 
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
 
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },
 
                    ['position'] = vector3(-1387.39, -605.8, 32.36),
                    ['heading'] = 0.0,
                    ['color'] = {255, 215, 0}
                }
            },
 
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-1399.78, -625.57, 34.76),
                    ['heading'] = 155.71,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 30.0,
                    ['lowPassGainReductionPercent'] = 0
                },
 
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-1390.97, -590.46, 29.8),
                    ['heading'] = 348.7,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                }
            }
        },

        ------------ G A L A X Y C L U B ------------ https://fiv3devs.tebex.io/package/4997166
 
 
			['galaxy'] = {
                ['enabled'] = true,
                ['autoAdjustTime'] = false,
                ['idleWallpaperUrl'] = 'https://i.ibb.co/bHh0NvK/logoooooo.png',
                ['maxVolumePercent'] = 200,
                ['smokeFxMultiplier'] = 3,
                ['smokeTimeoutMs'] = 10000,
                ['sparklerFxMultiplier'] = 1,
                ['sparklerTimeoutMs'] = 1500,
                ['delayBetweenSmokeChainMs'] = 1500,
                ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
                ['featureDelayWithControllerInterfaceClosedMs'] = 500,
     
                ['bass'] = {
                    ['smoke'] = {
                        ['cooldownMs'] = 30000,
                        ['colorWithDynamicSpotlights'] = true
                    },
     
                    ['sparklers'] = {
                        ['cooldownMs'] = 17000,
                        ['colorWithDynamicSpotlights'] = true
                    }
                },
     
                ['area'] = {
                    ['range'] = 64.0,
                    ['center'] = vector3(375.32, 275.86, 92.4),
                    ['height'] = nil,
     
                    ['polygons'] = {
                        ['applyLowPassFilterOutside'] = true,
                        ['invertLowPassApplication'] = false,
                        ['hideReplacersOutside'] = true,
     
                        ['entries'] = {
                            {  
                                ['height'] = {
                                    ['min'] = 80.0,
                                    ['max'] = 102.0
                                },
     
                                ['points'] = {
                                vector2(356.76,299.92),
                                vector2(345.4,303.36),
                                vector2(335.61,274.47),
                                vector2(348.92,271.9),
                                vector2(361.6,265.11),
                                vector2(370.87,262.42),
                                vector2(376.94,266.18),
                                vector2(380.91,281.56),
                                vector2(356.61,288.53),
     
                                }
                            }
                        }
                    }
                },
     
     
                ['scaleform'] = nil,
     
                ['replacers'] = {
                    ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                    ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
                },
     
                ['monitors'] = {
                    {
                        ['hash'] = 'ba_prop_battle_club_screen_02',
                        ['position'] = vector3(374.3116, 276.3695, 94.4475),
                        ['rotation'] = nil,
                        ['heading'] = 255.0,
                        ['lodDistance'] = nil
                    }
                },
     
                ['screens'] = nil,
     
                ['spotlights'] = {
                    {
                        ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                        ['hash'] = 'cs_prop_hall_spotlight',
                        ['position'] = vector3(374.44, 279.52, 93.69),
                        ['rotation'] = nil,
                        ['heading'] = 255.0,
                        ['lodDistance'] = nil,
                        ['color'] = {255, 1, 1}
                    },
     
                    {
                        ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                        ['hash'] = 'cs_prop_hall_spotlight',
                        ['position'] = vector3(372.44, 273.52, 93.69),
                        ['rotation'] = nil,
                        ['heading'] = 255.0,
                        ['lodDistance'] = nil,
                        ['color'] = {255, 255, 0}
                    },
     
                    {
                        ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                        ['hash'] = 'cs_prop_hall_spotlight',
                        ['position'] = vector3(367.78, 284.14, 95.13),
                        ['rotation'] = nil,
                        ['heading'] = 35.0,
                        ['lodDistance'] = nil,
                        ['color'] = {3, 83, 255}
                    },
     
                    {
                        ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                        ['hash'] = 'cs_prop_hall_spotlight',
                        ['position'] = vector3(364.7643, 274.7, 95.13),
                        ['rotation'] = nil,
                        ['heading'] = 103.16,
                        ['lodDistance'] = nil,
                        ['color'] = {15, 3, 255}
                    },
     
                    {
                        ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                        ['hash'] = 'cs_prop_hall_spotlight',
                        ['position'] = vector3(374.13, 275.10, 93.9),
                        ['rotation'] = nil,
                        ['heading'] = 245.0,
                        ['lodDistance'] = nil,
                        ['color'] = {255, 5, 190}
                    },
                    {
                        ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                        ['hash'] = 'cs_prop_hall_spotlight',
                        ['position'] = vector3(374.77, 277.55, 93.88),
                        ['rotation'] = nil,
                        ['heading'] = 270.0,
                        ['lodDistance'] = nil,
                        ['color'] = {255, 5, 190}
                    }
                },
     
                ['smokers'] = {
                    {
                        ['hash'] = 'ba_prop_club_smoke_machine',
                        ['visible'] = false,
     
                        ['fx'] = {
                            ['library'] = 'scr_ba_club',
                            ['effect'] = 'scr_ba_club_smoke_machine',
                        },
     
                        ['position'] = vector3(358.94, 277.02, 91.19),
                        ['rotation'] = nil,
                        ['heading'] = 82.0,
                        ['lodDistance'] = nil,
                        ['color'] = {0, 102, 255}
                    },
     
                    {
                        ['hash'] = 'ba_prop_club_smoke_machine',
                        ['visible'] = false,
     
                        ['fx'] = {
                            ['library'] = 'scr_ba_club',
                            ['effect'] = 'scr_ba_club_smoke_machine',
                        },
     
                        ['position'] = vector3(359.39, 281.28, 91.19),
                        ['rotation'] = nil,
                        ['heading'] = 76.0,
                        ['lodDistance'] = nil,
                        ['color'] = {0, 102, 255}
                    }
     
                },
     
                ['sparklers'] = {
                    {
                        ['hash'] = 'prop_cs_pour_tube',
                        ['visible'] = true,
     
                        ['fx'] = {
                            ['library'] = 'scr_ih_club',
                            ['effect'] = 'scr_ih_club_sparkler',
                        },
     
                        ['position'] = vector3(374.5949, 276.8717, 92.4),
                        ['rotation'] = nil,
                        ['heading'] = 0.0,
                        ['lodDistancen'] = nil,
                        ['color'] = {175, 0, 175}
                    },
     
                    {
                        ['hash'] = 'prop_cs_pour_tube',
                        ['visible'] = true,
     
                        ['fx'] = {
                            ['library'] = 'scr_ih_club',
                            ['effect'] = 'scr_ih_club_sparkler',
                        },
     
                        ['position'] = vector3(374.1909, 275.5703, 92.4),
                        ['rotation'] = nil,
                        ['heading'] = 0.0,
                        ['lodDistancen'] = nil,
                        ['color'] = {175, 0, 175}
                    }
                },
     
                ['speakers'] = {
                    {
                        ['hash'] = 'ba_prop_battle_club_speaker_large',
                        ['visible'] = false,
                        ['position'] = vector3(373.5800, 274.8942, 93.2994),
                        ['rotation'] = nil,
                        ['heading'] = 60.0,
                        ['lodDistance'] = nil,
                        ['soundOffset'] = vector3(0, 0, 1.4),
                        ['distanceOffset'] = nil,
                        ['maxDistance'] = 60.0,
                        ['refDistance'] = 16.0,
                        ['rolloffFactor'] = 1.25,
                        ['coneInnerAngle'] = 90,
                        ['coneOuterAngle'] = 180,
                        ['coneOuterGain'] = 0.5,
                        ['fadeDurationMs'] = 250,
                        ['volumeMultiplier'] = 1.0,
                        ['lowPassGainReductionPercent'] = 15
                    },
     
                    {
                        ['hash'] = 'ba_prop_battle_club_speaker_large',
                        ['visible'] = false,
                        ['position'] = vector3(374.3358, 277.8356, 93.2933),
                        ['rotation'] = nil,
                        ['heading'] = 60.0,
                        ['lodDistance'] = nil,
                        ['soundOffset'] = vector3(0, 0, 1.4),
                        ['distanceOffset'] = nil,
                        ['maxDistance'] = 32.0,
                        ['refDistance'] = 16.0,
                        ['rolloffFactor'] = 1.25,
                        ['coneInnerAngle'] = 90,
                        ['coneOuterAngle'] = 180,
                        ['coneOuterGain'] = 0.5,
                        ['fadeDurationMs'] = 250,
                        ['volumeMultiplier'] = 1.0,
                        ['lowPassGainReductionPercent'] = 15
                    }
                }
            },
    ------------ G A L A X Y C L U B ------------ 

        -- Beach Bar
        -- If you have the Cayo Perico island in your server and you want the beach bar setup, enable it below.

        ['beach_bar'] = {
            ['enabled'] = false,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = false
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = false
                }
            },

            ['area'] = {
                ['range'] = 128.0,
                ['center'] = vector3(4893.82, -4907.77, 3.3),
                ['height'] = nil,
                ['polygons'] = nil
            },

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,

            ['replacers'] = {
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
            },

            ['monitors'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(4893.3828125, -4906.6821289062, 8.1490092254639),
                    ['rotation'] = nil,
                    ['heading'] = 355.92108154297,
                    ['lodDistance'] = nil
                }
            },

            ['screens'] = nil,

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(4885.8608398438, -4918.0571289062, 6.9639296531677),
                    ['rotation'] = nil,
                    ['heading'] = 36.255199432373,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(4892.9873046875, -4933.119140625, 7.9055228233337),
                    ['rotation'] = nil,
                    ['heading'] = 199.39436340332,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(4898.630859375, -4928.7680664062, 7.9144740104675),
                    ['rotation'] = nil,
                    ['heading'] = 240.46636962891,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(4890.9223632812, -4933.2202148438, 7.3254413604736),
                    ['rotation'] = nil,
                    ['heading'] = 202.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(4899.2270507812, -4926.7075195312, 7.2875466346741),
                    ['rotation'] = nil,
                    ['heading'] = 232.05226135254,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(4891.4643554688, -4905.8627929688, 2.46),
                    ['rotation'] = nil,
                    ['heading'] = 348.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(4895.4653320312, -4905.94921875, 2.46),
                    ['rotation'] = nil,
                    ['heading'] = 6.36,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(4890.49, -4907.72, 2.355297088623),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(4896.49, -4908.14, 2.355297088623),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                }
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(4890.46, -4906.92, 2.33),
                    ['rotation'] = nil,
                    ['heading'] = 2.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(4896.46, -4907.49, 2.33),
                    ['rotation'] = nil,
                    ['heading'] = 2.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                }
            }
        },

        -- Gabz's Vanilla Unicorn (https://www.youtube.com/watch?v=o9UV9tdLU30)
        -- If you have this interior enable it below, and disable the default "vanilla" entry.

        ['gabz_vanilla_unicorn'] = {
            ['enabled'] = false,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },

            ['area'] = {
                ['range'] = 128.0,
                ['center'] = vector3(103.64, -1292.14, 29.2),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 27.0,
                                ['max'] = 32.0
                            },
        
                            ['points'] = {
                                vector2(119.42, -1299.34),
                                vector2(116.07, -1294.06),
                                vector2(114.62, -1292.96),
                                vector2(104.46, -1299.08),
                                vector2(97.68, -1287.27),
                                vector2(107.61, -1281.02),
                                vector2(119.01, -1279.61),
                                vector2(125.75, -1277.27),
                                vector2(128.81, -1276.93),
                                vector2(134.08, -1287.12),
                                vector2(130.99, -1289.47),
                                vector2(132.76, -1292.06),
                                vector2(134.37, -1294.44),
                                vector2(128.49, -1298.07),
                                vector2(124.62, -1300.01),
                                vector2(122.72, -1297.48)
                            }
                        }
                    }
                }
            },

            ['disableEmitters'] = {
                'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
                'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
                'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM'
            },

            ['scaleform'] = nil,

            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
            },

            ['monitors'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_screen_02',
                    ['position'] = vector3(122.83245849609, -1282.1744384766, 30.500564575195),
                    ['rotation'] = nil,
                    ['heading'] = 209.32180786133,
                    ['lodDistance'] = nil
                }
            },

            ['screens'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(103.27879333496, -1292.5457763672, 33.85863571167),
                    ['rotation'] = nil,
                    ['heading'] = 120.0,
                    ['lodDistance'] = nil,

                    ['advance'] = {
                        ['durationMs'] = 15000,
                        ['position'] = vector3(103.27879333496, -1292.5457763672, 32.01610946655)
                    },
                },

                {
                    ['hash'] = 'prop_strip_pole_01',
                    ['position'] = vector3(103.27879333496, -1292.5457763672, 33.45863571167),
                    ['rotation'] = nil,
                    ['heading'] = 120.0,
                    ['lodDistance'] = nil,

                    ['advance'] = {
                        ['durationMs'] = 15000,
                        ['position'] = vector3(103.27879333496, -1292.5457763672, 31.61610946655)
                    }
                }
            },

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(104.79130554199, -1291.6781005859, 32.583999633789),
                    ['rotation'] = nil,
                    ['heading'] = 120.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(108.38147735596, -1296.1878662109, 32.080726623535),
                    ['rotation'] = nil,
                    ['heading'] = 210.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(110.11848449707, -1295.0183105469, 32.080333709717),
                    ['rotation'] = nil,
                    ['heading'] = 210.0,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(102.0936050415, -1285.4376220703, 32.090923309326),
                    ['rotation'] = nil,
                    ['heading'] = 30.0,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(104.02025604248, -1284.3253173828, 32.090923309326),
                    ['rotation'] = nil,
                    ['heading'] = 30.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(103.99552154541, -1296.3807373047, 28.256807327271),
                    ['rotation'] = nil,
                    ['heading'] = 141.53,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 0, 255}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(100.32069396973, -1289.9753417969, 28.256807327271),
                    ['rotation'] = nil,
                    ['heading'] = 97.29,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 0, 255}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(105.01, -1289.6500244141, 28.270687103271),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(106.60453033447, -1292.4583740234, 28.270687103271),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                }
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(98.9, -1287.81, 27.24342918396),
                    ['rotation'] = nil,
                    ['heading'] = 98.22,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(104.78, -1297.79, 27.24342918396),
                    ['rotation'] = nil,
                    ['heading'] = 129.74,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                }
            }
        },

        -- Breze's Medusa Nightclub (https://www.youtube.com/watch?v=WkSDHNS9UDY)
        -- If you have this interior enable it below.

        ['breze_medusa_nightclub'] = {
            ['enabled'] = false,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = false
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = false
                }
            },

            ['area'] = {
                ['range'] = 128.0,
                ['center'] = vector3(745.37, -554.77, 28.65),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 26.0,
                                ['max'] = 32.0
                            },
        
                            ['points'] = {
                                vector2(757.49, -535.57),
                                vector2(749.46, -535.36),
                                vector2(746.87, -536.82),
                                vector2(729.46, -572.98),
                                vector2(758.1, -586.28),
                                vector2(757.7, -545.72)
                            }
                        },
                        
                        {
                            ['height'] = {
                                ['min'] = 32.0,
                                ['max'] = 36.0
                            },
        
                            ['points'] = {
                                vector2(754.14, -569.86),
                                vector2(754.17, -574.41),
                                vector2(751.19, -577.98),
                                vector2(746.51, -578.33),
                                vector2(742.82, -575.05),
                                vector2(743.16, -570.34),
                                vector2(746.01, -567.21),
                                vector2(750.68, -567.06)
                            }
                        }
                    }
                }
            },

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,

            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv'
            },

            ['monitors'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_screen_02',
                    ['position'] = vector3(738.32971191406, -554.88000488281, 30.901714324951),
                    ['rotation'] = nil,
                    ['heading'] = 64.16,
                    ['lodDistance'] = nil
                }
            },

            ['screens'] = nil,

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(738.67272949219, -555.03344726562, 32.444766998291),
                    ['rotation'] = nil,
                    ['heading'] = 71.46,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(756.40258789062, -548.21002197266, 32.436893463135),
                    ['rotation'] = nil,
                    ['heading'] = 271.3,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(756.66101074219, -561.20684814453, 32.434928894043),
                    ['rotation'] = nil,
                    ['heading'] = 271.3,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(747.39, -561.07, 32.44),
                    ['rotation'] = nil,
                    ['heading'] = 96.2,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(747.38, -548.41, 32.44),
                    ['rotation'] = nil,
                    ['heading'] = 85.57,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(754.189453125, -558.76391601562, 27.639999389648),
                    ['rotation'] = nil,
                    ['heading'] = 299.15716552734,
                    ['lodDistance'] = nil,
                    ['color'] = {0, 255, 0}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(754.10021972656, -550.59643554688, 27.639999389648),
                    ['rotation'] = nil,
                    ['heading'] = 238.93334960938,
                    ['lodDistance'] = nil,
                    ['color'] = {0, 255, 0}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(753.32, -551.51, 27.647521972656),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {0, 255, 0}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(753.32, -557.85, 27.647521972656),
                    ['rotation'] = nil,
                    ['heading'] = 238.93334960938,
                    ['lodDistance'] = nil,
                    ['color'] = {0, 255, 0}
                }
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(754.42, -557.88, 27.6),
                    ['rotation'] = nil,
                    ['heading'] = 274.2,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.7),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(754.26, -551.53, 27.6),
                    ['rotation'] = nil,
                    ['heading'] = 272.5,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.7),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                }
            }
        },

        -- UncleJust's Vinewood Nightclub (https://www.youtube.com/watch?v=bwcH_KODvPI)
        -- If you have this interior enable it below.

        ['unclejust_vinewood_nightclub'] = {
            ['enabled'] = false,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },

            ['area'] = {
                ['range'] = 36.0,
                ['center'] = vector3(372.44, 276.53, 91.19),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 90.0,
                                ['max'] = 93.0
                            },

                            ['points'] = {
                                vector2(346.24, 276.08),
                                vector2(349.61, 289.9),
                                vector2(381.23, 281.63),
                                vector2(377.56, 267.11),
                                vector2(350.76, 270.37),
                                vector2(350.36, 274.86)
                            }
                        },

                        {
                            ['height'] = {
                                ['min'] = 93.0,
                                ['max'] = 96.0
                            },

                            ['points'] = {
                                vector2(353.52, 272.84),
                                vector2(355.83, 278.45),
                                vector2(354.04, 279.21),
                                vector2(357.58, 288.01),
                                vector2(381.36, 281.72),
                                vector2(377.67, 267.05),
                                vector2(372.51, 268.12),
                                vector2(371.01, 262.22),
                                vector2(361.28, 264.88),
                                vector2(362.92, 270.56)
                            }
                        }
                    }
                }
            },

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,

            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['ba_prop_battle_club_projector'] = 'script_rt_club_projector'
            },

            ['monitors'] = nil,
            ['screens'] = nil,

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(363.42559814453, 276.72326660156, 92.779304504395),
                    ['rotation'] = nil,
                    ['heading'] = 76.13468170166,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(364.55303955078, 280.58059692383, 92.794158935547),
                    ['rotation'] = nil,
                    ['heading'] = 75.477386474609,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(365.38845825195, 273.95819091797, 92.779861450195),
                    ['rotation'] = nil,
                    ['heading'] = 158.18849182129,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(369.53955078125, 272.80334472656, 92.794219970703),
                    ['rotation'] = nil,
                    ['heading'] = 148.77075195312,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(373.92681884766, 276.08227539062, 93.283363342285),
                    ['rotation'] = nil,
                    ['heading'] = 250.84906005859,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(361.63854980469, 275.40472412109, 90.170631408691),
                    ['rotation'] = nil,
                    ['heading'] = 88.489730834961,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 215, 0}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(367.10723876953, 282.82067871094, 90.174537658691),
                    ['rotation'] = nil,
                    ['heading'] = 2.2324018478394,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 215, 0}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(373.81, 279.13, 90.178985595703),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 215, 0}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(372.41, 274.05, 90.178985595703),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 215, 0}
                }
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(374.18133544922, 279.08819580078, 90.181503295898),
                    ['rotation'] = nil,
                    ['heading'] = 263.55068969727,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 28.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(372.68405151367, 273.84048461914, 90.180465698242),
                    ['rotation'] = nil,
                    ['heading'] = 257.89999389648,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 28.0,
                    ['refDistance'] = 24.0,
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

        -- UncleJust's Vinewood Cinema (https://www.youtube.com/watch?v=ozpJeC7wv7k)
        -- If you have this interior enable it below.

        ['unclejust_vinewood_cinema'] = {
            ['enabled'] = false,
            ['autoAdjustTime'] = true,
            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = nil,

            ['area'] = {
                ['range'] = 36.0,
                ['center'] = vector3(339.75, 193.22, 103.01),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 98.0,
                                ['max'] = 118.0
                            },
        
                            ['points'] = {
                                vector2(326.45, 195.36),
                                vector2(338.11, 230.24),
                                vector2(362.55, 220.3),
                                vector2(350.45, 187.15),
                            }
                        }
                    }
                }
            },

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,

            ['replacers'] = {
                ['v_ilev_cin_screen'] = 'script_rt_cinscreen'
            },

            ['monitors'] = nil,
            ['screens'] = nil,
            ['spotlights'] = nil,
            ['smokers'] = nil,
            ['sparklers'] = nil,

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(331.96, 195.93, 102.0),
                    ['rotation'] = nil,
                    ['heading'] = 154.93,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 28.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.5,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 1.0,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 90
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(346.34, 190.79, 102.0),
                    ['rotation'] = nil,
                    ['heading'] = 177.34,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 28.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.5,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 1.0,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 90
                }
            }
        },

        ['cat_cafe'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 150,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,
        
            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },
        
                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },
        
            ['area'] = {
                ['range'] = 36.0,
                ['center'] = vector3(-579.89, -1059.46, 22.34),
                ['height'] = nil,
        
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,
        
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 20.0,
                                ['max'] = 30.0
                            },
        
                            ['points'] = {
                                vector2(-600.42224121094, -1068.9382324219),
                                vector2(-586.19537353516, -1069.6312255859),
                                vector2(-584.69494628906, -1069.8532714844),
                                vector2(-581.70947265625, -1069.5817871094),
                                vector2(-573.11157226562, -1069.7077636719),
                                vector2(-566.71313476562, -1069.8015136719),
                                vector2(-565.81335449219, -1069.8146972656),
                                vector2(-566.07019042969, -1059.8282470703),
                                vector2(-566.07379150391, -1053.9296875),
                                vector2(-566.07720947266, -1048.3310546875),
                                vector2(-570.96856689453, -1048.53515625),
                                vector2(-576.47497558594, -1048.5041503906),
                                vector2(-581.20184326172, -1048.0346679688),
                                vector2(-582.56433105469, -1047.9940185547),
                                vector2(-582.78930664062, -1040.4072265625),
                                vector2(-590.39715576172, -1040.7967529297),
                                vector2(-599.89123535156, -1040.8895263672),
                                vector2(-601.18933105469, -1040.9605712891)
                            }
                        }
                    }
                }
            },
        
            ['disableEmitters'] = nil,
            ['scaleform'] = nil,
        
            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['ba_prop_battle_club_projector'] = 'script_rt_club_projector'
            },
        
            ['monitors'] = nil,
            ['screens'] = nil,
        
            ['spotlights'] = nil,
        
            ['smokers'] = nil,
        
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-586.93, -1068.81, 25.24),
                    ['rotation'] = nil,
                    ['heading'] = 312.55068969727,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 50.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-575.11, -1057.98, 25.27), --- vector3(-591.2, -1064.29, 24.84)
                    ['rotation'] = nil,
                    ['heading'] = 134.89999389648,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 50.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-591.2, -1064.29, 24.84), --- vector3(-591.2, -1064.29, 24.84)
                    ['rotation'] = nil,
                    ['heading'] = 328.89999389648,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 50.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },
            }
        },
        ['rex_diner'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 150,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,
        
            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },
        
                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },
        
            ['area'] = {
                ['range'] = 36.0,
                ['center'] = vector3(2539.48, 2586.87, 38.5),
                ['height'] = nil,
        
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,
        
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 37.0,
                                ['max'] = 40.0
                            },
        
                            ['points'] = {
                                vector2(2542.4377441406, 2591.4853515625),
                                vector2(2537.7019042968, 2591.77734375),
                                vector2(2537.0190429688, 2591.6193847656),
                                vector2(2535.0336914062, 2593.8122558594),
                                vector2(2526.2763671875, 2593.6472167968),
                                vector2(2523.0170898438, 2590.962890625),
                                vector2(2522.8256835938, 2578.5910644532),
                                vector2(2550.6552734375, 2578.2839355468),
                                vector2(2550.3063964844, 2591.587890625)
                            }
                        }
                    }
                }
            },
        
            ['disableEmitters'] = nil,
            ['scaleform'] = nil,
        
            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['ba_prop_battle_club_projector'] = 'script_rt_club_projector'
            },
        
            ['monitors'] = nil,
            ['screens'] = nil,
        
            ['spotlights'] = nil,
        
            ['smokers'] = nil,
        
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(2523.61, 2590.96, 40.08),
                    ['rotation'] = nil,
                    ['heading'] = 258.54,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 50.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(2523.26, 2584.41, 40.34), --- vector3(-591.2, -1064.29, 24.84)
                    ['rotation'] = nil,
                    ['heading'] = 301.92,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 50.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(2550.28, 2584.86, 40.37), --- vector3(-591.2, -1064.29, 24.84)
                    ['rotation'] = nil,
                    ['heading'] = 66.65,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 50.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },
            }
        },
        ['blueline'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 150,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,
        
            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },
        
                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },
        
            ['area'] = {
                ['range'] = 36.0,
                ['center'] = vector3(-333.93, -134.34, 39.34),
                ['height'] = nil,
        
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = false,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,
        
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 37.0,
                                ['max'] = 40.0
                            },
        
                            ['points'] = {
                                vector2(-356.728, -138.26),
                                vector2(-350.052, -150.356),
                                vector2(-334.912, -168.418),
                                vector2(-316.943, -162.325),
                                vector2(-308.323, -123.81),
                                vector2(-316.692, -107.156),
                                vector2(-313.119, -95.559),
                                vector2(-351.486, -81.595),
                                vector2(-354.932, -133.447)
                            }
                        }
                    }
                }
            },
        
            ['disableEmitters'] = nil,
            ['scaleform'] = nil,
        
            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['ba_prop_battle_club_projector'] = 'script_rt_club_projector'
            },
        
            ['monitors'] = nil,
            ['screens'] = nil,
             
            ['spotlights'] = nil,
        
            ['smokers'] = nil,
        
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-320.44, -164.27, 40.99),
                    ['rotation'] = nil,
                    ['heading'] = 200.19,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 50.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-307.73, -131.3, 40.99), --- vector3(-591.2, -1064.29, 24.84)
                    ['rotation'] = nil,
                    ['heading'] = 16.66,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 50.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-322.63, -118.58, 39.01), --- vector3(-591.2, -1064.29, 24.84)
                    ['rotation'] = nil,
                    ['heading'] = 151.7,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 50.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-353.55, -144.35, 39.01), --- vector3(-591.2, -1064.29, 24.84)
                    ['rotation'] = nil,
                    ['heading'] = 296.62,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 50.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },
            }
        },
        ['tuners'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 150,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,
        
            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },
        
                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },
        
            ['area'] = {
                ['range'] = 36.0,
                ['center'] = vector3(139.88, -3030.99, 7.04),
                ['height'] = nil,
        
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,
        
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 5.0,
                                ['max'] = 11.50
                            },
        
                            ['points'] = {
                                vector2(120.37281799316, -3006.8708496094),
                                vector2(154.74528503418, -3006.7563476562),
                                vector2(154.77279663086, -3051.9362792968),
                                vector2(120.37212371826, -3051.9047851562)
                            }
                        }
                    }
                }
            },
        
            ['disableEmitters'] = nil,
            ['scaleform'] = nil,
        
            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['ba_prop_battle_club_projector'] = 'script_rt_club_projector'
            },
        
            ['monitors'] = nil,
            ['screens'] = nil,
        
            ['spotlights'] = nil,
        
            ['smokers'] = nil,
        
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(123.72, -3015.67, 9.96),
                    ['rotation'] = nil,
                    ['heading'] = 210.55068969727,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 50.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(129.88, -3015.67, 9.99), --- vector3(-591.2, -1064.29, 24.84)
                    ['rotation'] = nil,
                    ['heading'] = 210.89999389648,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 50.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(151.58, -3015.7, 10.0), --- vector3(-591.2, -1064.29, 24.84)
                    ['rotation'] = nil,
                    ['heading'] = 154.89999389648,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 50.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },
            }
        },
        -- This entry does not require an extra map.

['parking_cinema_large'] = {
    ['enabled'] = true,
    ['autoAdjustTime'] = false,
    ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
    ['maxVolumePercent'] = 200,
    ['smokeFxMultiplier'] = 3,
    ['smokeTimeoutMs'] = 5000,
    ['sparklerFxMultiplier'] = 1,
    ['sparklerTimeoutMs'] = 1500,
    ['delayBetweenSmokeChainMs'] = 1500,
    ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
    ['featureDelayWithControllerInterfaceClosedMs'] = 500,

    ['bass'] = nil,

    ['area'] = {
        ['range'] = 128.0,
        ['center'] = vector3(-1708.77, -905.75, 14.07),
        ['height'] = nil,
        ['polygons'] = nil
    },

    ['disableEmitters'] = nil,

    ['scaleform'] = {
        ['solid'] = true,
        ['flag'] = false,
        ['position'] = vector3(-1700.55, -911.95, 18.35),
        ['rotation'] = vector3(0.0, 0.0, -140.35),
        ['scale'] = vector3(0.845, 0.455, 0.0)
    },

    ['replacers'] = nil,

    ['monitors'] = {
        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1708.0703, -906.0299, 10.112692),
            ['rotation'] = nil,
            ['heading'] = -39.74569,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1708.0703, -906.0239, 16.045633),
            ['rotation'] = nil,
            ['heading'] = -39.74569,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1713.1582, -901.8113, 10.112692),
            ['rotation'] = nil,
            ['heading'] = -39.74569,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1703.5819, -909.75867, 10.112692),
            ['rotation'] = nil,
            ['heading'] = -39.74569,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1713.1582, -901.8113, 16.045633),
            ['rotation'] = nil,
            ['heading'] = -39.74569,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1703.5796, -909.75867, 16.045633),
            ['rotation'] = nil,
            ['heading'] = -39.74569,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1708.4623, -905.87384, 15.529058),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1708.4103, -905.9194, 10.596061),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1713.2186, -901.93274, 15.529058),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1713.2185, -901.93225, 10.599154),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1704.3209, -909.3089, 15.529058),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_huge_display_02',
            ['position'] = vector3(-1704.3209, -909.3089, 10.591772),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_billb_frame01a',
            ['position'] = vector3(-1702.4642, -912.5856, 6.7018266),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_billb_frame01a',
            ['position'] = vector3(-1716.6082, -900.8562, 6.7031603),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        },

        {
            ['hash'] = 'prop_billb_frame01a',
            ['position'] = vector3(-1709.3938, -906.8314, 6.6993837),
            ['rotation'] = nil,
            ['heading'] = 140.35075,
            ['lodDistance'] = 128
        }        
    },

    ['screens'] = nil,

    ['spotlights'] = {
        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1700.0432, -912.8055, 16.997484),
            ['rotation'] = vector3(79.81944, 39.95835, -168.51068),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 255, 0}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1699.9872, -912.75525, 18.572235),
            ['rotation'] = vector3(-89.1767, 15.263356, 62.73788),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {15, 3, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1717.0707, -898.5253, 16.99997),
            ['rotation'] = vector3(79.8196, 39.95832, 4.3027616),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {3, 83, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1717.0271, -898.52234, 18.567598),
            ['rotation'] = vector3(-89.17813, 15.263419, -116.71412),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 5, 190}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1708.5563, -905.6041, 19.142105),
            ['rotation'] = vector3(0.6012019, -179.44646, 145.56659),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 1, 1}
        }
    },

    ['smokers'] = nil,
    ['sparklers'] = nil,

    ['speakers'] = {
        {
            ['hash'] = 'xs_propintarena_speakers_01a',
            ['visible'] = false,
            ['position'] = vector3(-1708.5303, -905.79474, 16.172209),
            ['rotation'] = vector3(-0.39775264,86.46773, 48.647858),
            ['heading'] = nil,
            ['lodDistance'] = nil,
            ['soundOffset'] = nil,
            ['distanceOffset'] = vector3(0.75, -0.66, 0),
            ['maxDistance'] = 32.0,
            ['refDistance'] = 16.0,
            ['rolloffFactor'] = 1.25,
            ['coneInnerAngle'] = 90,
            ['coneOuterAngle'] = 180,
            ['coneOuterGain'] = 0.5,
            ['fadeDurationMs'] = 250,
            ['volumeMultiplier'] = 1.0,
            ['lowPassGainReductionPercent'] = 15
        }
    }
},
        ['bighouse'] = {
                ['enabled'] = true,
                ['autoAdjustTime'] = false,
                ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
                ['maxVolumePercent'] = 150,
                ['smokeFxMultiplier'] = 3,
                ['smokeTimeoutMs'] = 5000,
                ['sparklerFxMultiplier'] = 1,
                ['sparklerTimeoutMs'] = 1500,
                ['delayBetweenSmokeChainMs'] = 1500,
                ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
                ['featureDelayWithControllerInterfaceClosedMs'] = 500,
        
                ['bass'] = {
                    ['smoke'] = {
                        ['cooldownMs'] = 30000,
                        ['colorWithDynamicSpotlights'] = true
                    },
        
                    ['sparklers'] = {
                        ['cooldownMs'] = 30000,
                        ['colorWithDynamicSpotlights'] = true
                    }
                },
        
                ['area'] = {
                    ['range'] = 36.0,
                    ['center'] = vector3(493.51, -1534.46, 29.27),
                    ['height'] = nil,
        
                    ['polygons'] = {
                        ['applyLowPassFilterOutside'] = true,
                        ['invertLowPassApplication'] = false,
                        ['hideReplacersOutside'] = true,
        
                        ['entries'] = {
                            {
                                ['height'] = {
                                    ['min'] = 20.0,
                                    ['max'] = 35.0
                                },
            
                                ['points'] = {
                                    vector2(503.14544677734, -1530.5162353516),
                                    vector2(492.53186035156, -1543.5721435547),
                                    vector2(481.91708374023, -1534.9523925781),
                                    vector2(492.12023925781, -1522.9079589844)
                                    }
                                }
                            }
                        }
                    }
                },
        
                ['disableEmitters'] = nil,
                ['scaleform'] = nil,
        
                ['replacers'] = {
                    ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                    ['ba_prop_battle_club_projector'] = 'script_rt_club_projector'
                },
        
                ['monitors'] = nil,
                ['screens'] = nil,
        
                ['spotlights'] = nil,
        
                ['smokers'] = nil,
        
                ['speakers'] = {
                    {
                        ['hash'] = 'ba_prop_battle_club_speaker_large',
                        ['visible'] = false,
                        ['position'] = vector3(490.91, -1541.69, 30.81),
                        ['rotation'] = nil,
                        ['heading'] = 339.19,
                        ['lodDistance'] = nil,
                        ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                        ['directionOffset'] = nil,
                        ['maxDistance'] = 50.0,
                        ['refDistance'] = 24.0,
                        ['rolloffFactor'] = 1.25,
                        ['coneInnerAngle'] = 90,
                        ['coneOuterAngle'] = 180,
                        ['coneOuterGain'] = 0.5,
                        ['fadeDurationMs'] = 250,
                        ['volumeMultiplier'] = 1.0,
                        ['lowPassGainReductionPercent'] = 0
                    },
        
                    {
                        ['hash'] = 'ba_prop_battle_club_speaker_large',
                        ['visible'] = false,
                        ['position'] = vector3(485.61, -1537.21, 30.44), --- vector3(-591.2, -1064.29, 24.84)
                        ['rotation'] = nil,
                        ['heading'] = 273.31,
                        ['lodDistance'] = nil,
                        ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                        ['directionOffset'] = nil,
                        ['maxDistance'] = 50.0,
                        ['refDistance'] = 24.0,
                        ['rolloffFactor'] = 1.25,
                        ['coneInnerAngle'] = 90,
                        ['coneOuterAngle'] = 180,
                        ['coneOuterGain'] = 0.5,
                        ['fadeDurationMs'] = 250,
                        ['volumeMultiplier'] = 1.0,
                        ['lowPassGainReductionPercent'] = 0
                    },
        
                    {
                        ['hash'] = 'ba_prop_battle_club_speaker_large',
                        ['visible'] = false,
                        ['position'] = vector3(495.14, -1525.73, 31.29), --- vector3(-591.2, -1064.29, 24.84)
                        ['rotation'] = nil,
                        ['heading'] = 163.55,
                        ['lodDistance'] = nil,
                        ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                        ['directionOffset'] = nil,
                        ['maxDistance'] = 50.0,
                        ['refDistance'] = 24.0,
                        ['rolloffFactor'] = 1.25,
                        ['coneInnerAngle'] = 90,
                        ['coneOuterAngle'] = 180,
                        ['coneOuterGain'] = 0.5,
                        ['fadeDurationMs'] = 250,
                        ['volumeMultiplier'] = 1.0,
                        ['lowPassGainReductionPercent'] = 0
                    },
                }
            },

        --BahamasFiv3Devs
 
    ['bahamas'] = {
        ['enabled'] = false,

        ['idleWallpaperUrl'] = 'https://files.criticalscripts.shop/cs-hall-dui/wallpaper.png',

        ['bass'] = {
            ['smoke'] = {
                ['cooldownMs'] = 30000,
                ['colorWithDynamicSpotlights'] = true
            },

            ['sparklers'] = {
                ['cooldownMs'] = 30000,
                ['colorWithDynamicSpotlights'] = true
            }
        },

        ['monitors'] = {
            {
                ['hash'] = 'ba_prop_battle_club_screen_02',
                ['position'] = vector3(-1389.61, -608.01, 33.35),
                ['heading'] = 130.15
            }
        },

        ['area'] = {
            ['range'] = 98,
            ['center'] = vector3(-1389.96, -608.3, 33.3),

            ['polygons'] = {
                ['applyLowPassFilterOutside'] = true,

                ['entries'] = {
                    {
                        ['height'] = {
                            ['min'] = 10.0,
                            ['max'] = 95.0
                        },

                        ['points'] = {
                            vector2(-1390.62, -625.92),
                            vector2(-1400.90, -625.93),
                            vector2(-1408.39, -618.41),
                            vector2(-1407.66, -612.85),
                            vector2(-1410.20, -611.30),
                            vector2(-1414.874, -605.04),
                            vector2(-1385.51, -585.58),
                            vector2(-1382.25, -585.88),
                            vector2(-1381.33, -589.43),
                            vector2(-1384.67, -597.15),
                            vector2(-1381.975, -596.0469),
                            vector2(-1375.698, -597.2661),
                            vector2(-1370.95, -605.67),
                            vector2(-1371.55, -609.83),
                            vector2(-1374.091, -613.4977),
                            vector2(-1374.451, -622.2185),
                            vector2(-1375.85, -626.24),
                            vector2(-1374.40,-629.07),
                            vector2(-1380.51,-633.21),
                            vector2(-1387.91, -628.9114)
                        }
                    }
                }
            }
        },

        ['replacers'] = {
            ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
            ['ba_prop_battle_club_projector'] = 'script_rt_club_projector'
        },

        ['spotlights'] = {
            {
                ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                ['hash'] = 'cs_prop_hall_spotlight',
                ['position'] = vector3(-1379.76, -602.28, 37.62),
                ['heading'] = 291.03,
                ['color'] = {255, 5, 190}
            },

            {
                ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                ['hash'] = 'cs_prop_hall_spotlight',
                ['position'] = vector3(-1385.82, -614.77, 40.03),
                ['heading'] = 174.81,
                ['color'] = {255, 255, 0}
            },

            {
                ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                ['hash'] = 'cs_prop_hall_spotlight',
                ['position'] = vector3(-1392.31, -617.31, 40.45),
                ['heading'] = 127.57,
                ['color'] = {3, 83, 255}
            },

            {
                ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                ['hash'] = 'cs_prop_hall_spotlight',
                ['position'] = vector3(-1398.66, -599.48, 40.07),
                ['heading'] = 83,
                ['color'] = {15, 3, 255}
            },

            {
                ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                ['hash'] = 'cs_prop_hall_spotlight',
                ['position'] = vector3(-1392.28, -591.87, 39.64),
                ['heading'] = 5.12,
                ['color'] = {255, 1, 1}
            },

            {
                ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                ['hash'] = 'cs_prop_hall_spotlight',
                ['position'] = vector3(-1373.31, -608.23, 37.51),
                ['heading'] = 254.73,
                ['color'] = {255, 5, 190}
            },

            {
                ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                ['hash'] = 'cs_prop_hall_spotlight',
                ['position'] = vector3(-1380.38, -598.45, 37.2),
                ['heading'] = 277.49,
                ['color'] = {255, 1, 44}
            }

        },

        ['smokers'] = {
            {
                ['hash'] = 'ba_prop_club_smoke_machine',
                ['visible'] = true,

                ['fx'] = {
                    ['library'] = 'scr_ba_club',
                    ['effect'] = 'scr_ba_club_smoke_machine',
                },

                ['position'] = vector3(-1385.77, -609.7, 30.15),
                ['heading'] = 104.2,
                ['color'] = {255, 215, 83}
            },

            {
                ['hash'] = 'ba_prop_club_smoke_machine',
                ['visible'] = true,

                ['fx'] = {
                    ['library'] = 'scr_ba_club',
                    ['effect'] = 'scr_ba_club_smoke_machine',
                },

                ['position'] = vector3(-1391.5, -604.2, 30.04),
                ['heading'] = 185.11,
                ['color'] = {255, 215, 83}
            },

            {
                ['hash'] = 'ba_prop_club_smoke_machine',
                ['visible'] = true,

                ['fx'] = {
                    ['library'] = 'scr_ba_club',
                    ['effect'] = 'scr_ba_club_smoke_machine',
                },

                ['position'] = vector3(-1391.17, -607.68, 37.7),
                ['heading'] = 356.85,
                ['color'] = {255, 215, 83}
            },


            {
                ['hash'] = 'ba_prop_club_smoke_machine',
                ['visible'] = false,

                ['fx'] = {
                    ['library'] = 'scr_ba_club',
                    ['effect'] = 'scr_ba_club_smoke_machine',
                },

                ['position'] = vector3(-1375.0, -604.84, 33.65),
                ['heading'] = 279.25,
                ['color'] = {255, 215, 83}
            },


            {
                ['hash'] = 'ba_prop_club_smoke_machine',
                ['visible'] = false,

                ['fx'] = {
                    ['library'] = 'scr_ba_club',
                    ['effect'] = 'scr_ba_club_smoke_machine',
                },

                ['position'] = vector3(-1399.64, -596.2, 33.3),
                ['heading'] = 83.42,
                ['color'] = {255, 215, 83}
            }

        },

        ['sparklers'] = {
            {
                ['hash'] = 'prop_cs_pour_tube',
                ['visible'] = true,

                ['fx'] = {
                    ['library'] = 'scr_ih_club',
                    ['effect'] = 'scr_ih_club_sparkler',
                },

                ['position'] = vector3(-1392.22, -604.32, 32.39),
                ['heading'] = 0.0,
                ['color'] = {255, 215, 0}
            },

            {
                ['hash'] = 'prop_cs_pour_tube',
                ['visible'] = true,

                ['fx'] = {
                    ['library'] = 'scr_ih_club',
                    ['effect'] = 'scr_ih_club_sparkler',
                },

                ['position'] = vector3(-1387.39, -605.8, 32.36),
                ['heading'] = 0.0,
                ['color'] = {255, 215, 0}
            }
        },

        ['speakers'] = {
            {
                ['hash'] = 'ba_prop_battle_club_speaker_small',
                ['visible'] = false,
                ['position'] = vector3(-1399.78, -625.57, 34.76),
                ['heading'] = 155.71,
                ['soundOffset'] = vector3(0, 0, 1.0),
                ['refDistance'] = 30.0,
                ['lowPassGainReductionPercent'] = 0
            },

            {
                ['hash'] = 'ba_prop_battle_club_speaker_small',
                ['visible'] = false,
                ['position'] = vector3(-1390.97, -590.46, 29.8),
                ['heading'] = 348.7,
                ['soundOffset'] = vector3(0, 0, 1.0),
                ['refDistance'] = 20.0,
                ['lowPassGainReductionPercent'] = 0
            }
        }
    },

        -- Below you can find a full config entry reference.

        -- ['key'] = {
        --     ['enabled'] = boolean,
        --     ['autoAdjustTime'] = boolean,
        --     ['idleWallpaperUrl'] = string,
        --     ['maxVolumePercent'] = number,
        --     ['smokeFxMultiplier'] = number,
        --     ['smokeTimeoutMs'] = number,
        --     ['sparklerFxMultiplier'] = number,
        --     ['sparklerTimeoutMs'] = number,
        --     ['delayBetweenSmokeChainMs'] = number,
        --     ['delayToTriggerBassEffectsAfterPlayingMs'] = number,
        --     ['featureDelayWithControllerInterfaceClosedMs'] = number,

        --     ['bass'] = {
        --         ['smoke'] = {
        --             ['cooldownMs'] = number,
        --             ['colorWithDynamicSpotlights'] = boolean
        --         },

        --         ['sparklers'] = {
        --             ['cooldownMs'] = number,
        --             ['colorWithDynamicSpotlights'] = boolean
        --         }
        --     },

        --     ['area'] = {
        --         ['range'] = number,
        --         ['center'] = vector3(number, number, number),

        --         ['height'] = {
        --             ['min'] = number,
        --             ['max'] = number
        --         },

        --         ['polygons'] = {
        --             ['applyLowPassFilterOutside'] = boolean,
        --             ['invertLowPassApplication'] = boolean,
        --             ['hideReplacersOutside'] = boolean,

        --             ['entries'] = {
        --                 {
        --                     ['height'] = {
        --                         ['min'] = number,
        --                         ['max'] = number
        --                     },
        
        --                     ['points'] = {
        --                         vector2(number, number),
        --                         ...
        --                     ]
        --                 }
        --             ]
        --         }
        --     },

        --     ['disableEmitters'] = {string, ...},

        --     ['scaleform'] = {
        --         ['solid'] = boolean,
        --         ['flag'] = boolean,
        --         ['position'] = vector3(number, number, number),
        --         ['rotation'] = vector3(number, number, number),
        --         ['scale'] = vector3(number, number, number)
        --     },

        --     ['replacers'] = {
        --         ['key'] = value,
        --         ...
        --     },

        --     ['monitors'] = {
        --         {
        --             ['hash'] = string,
        --             ['position'] = vector3(number, number, number),
        --             ['rotation'] = vector3(number, number, number),
        --             ['heading'] = number,
        --             ['lodDistance'] = number
        --         },
        --         ...
        --     },

        --     ['screens'] = {
        --         {
        --             ['hash'] = string,
        --             ['position'] = vector3(number, number, number),
        --             ['rotation'] = vector3(number, number, number),
        --             ['heading'] = number,
        --             ['lodDistance'] = number,

        --             ['advance'] = {
        --                 ['durationMs'] = number,
        --                 ['position'] = vector3(number, number, numbe)]
        --             }
        --         },
        --         ...
        --     },

        --     ['spotlights'] = {
        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE,
        --             ['hash'] = string,
        --             ['position'] = vector3(number, number, number),
        --             ['rotation'] = vector3(number, number, number),
        --             ['heading'] = number,
        --             ['lodDistance'] = number,
        --             ['color'] = {number, number, number}
        --         },
        --         ...
        --     },

        --     ['smokers'] = {
        --         {
        --             ['hash'] = string,
        --             ['visible'] = boolean,
    
        --             ['fx'] = {
        --                 ['library'] = string,
        --                 ['effect'] = string,
        --             },

        --             ['position'] = vector3(number, number, number),
        --             ['rotation'] = vector3(number, number, number),
        --             ['heading'] = number,
        --             ['lodDistance'] = number,
        --             ['color'] = {number, number, number}
        --         },
        --         ...
        --     },

        --     ['sparklers'] = {
        --         {
        --             ['hash'] = string,
        --             ['visible'] = boolean,
    
        --             ['fx'] = {
        --                 ['library'] = string,
        --                 ['effect'] = string,
        --             },

        --             ['position'] = vector3(number, number, number),
        --             ['rotation'] = vector3(number, number, number),
        --             ['heading'] = number,
        --             ['lodDistance'] = number,
        --             ['color'] = {number, number, number}
        --         },
        --         ...
        --     },

        --     ['speakers'] = {
        --         {
        --             ['hash'] = string,
        --             ['visible'] = boolean,
        --             ['position'] = vector3(number, number, number),
        --             ['rotation'] = vector3(number, number, number),
        --             ['heading'] = number,
        --             ['lodDistance'] = number,
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
        --     ]
        -- }
    }