-- Place any of your custom animations in here and keep a backup of this file for future updates.
return {
    Walks = {},
    Scenarios = {},
    Expressions = {},
    Emotes = {
        {
            Label = 'Radio 2',
            Command = 'radio2',
            Animation = 'radio_chatter',
            Dictionary = 'random@arrests',
            Options = {
                Flags = {
                    Loop = true,
                    Move = true,
                },
            },
        },
        {
            Label = 'Radio Chest',
            Command = 'radiochest',
            Animation = 'chest_mic',
            Dictionary = 'anim@cop_mic_pose_002',
            Options = {
                Flags = {
                    Loop = true,
                    Move = true,
                },
            },
        },
        {
            Label = 'Earpiece',
            Command = 'earpiece',
            Animation = 'cellphone_call_listen_base',
            Dictionary = 'cellphone@',
            Options = {
                Flags = {
                    Loop = true,
                    Move = true,
                },
            },
        },


    },
    PropEmotes = {},
    ConsumableEmotes = {},
    DanceEmotes = {},
    SynchronizedEmotes = {},
    AnimalEmotes = {}
}