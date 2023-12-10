
-- If you know how to edit the files yourself, edit the config below accordingly :)

-- Leave the left side as is. It's just so you can see which name and playlist gets linked with which radio.
-- First entry is the radio name, second is the playlist's name (which comes from the dat151 file, leave as is you don't understand).
StationInfo = {
    ['RADIO_38_CUSTOM'] = { 'Hard Bass Radio', 'customsongs_radiotrack01' },
    ['RADIO_39_CUSTOM'] = { 'Remixer Station', 'customsongs_radiotrack02' },
    ['RADIO_40_CUSTOM'] = { 'Music Drifter', 'customsongs_radiotrack03' },
    ['RADIO_41_CUSTOM'] = { 'Back to Basics', 'customsongs_radiotrack04' }
}

-- Left side is the trackid. You can see this inside of the AWCs if you export it to XML using CodeWalker.
-- Each trackid corresponds with a song's and author's name. Please edit accordingly if you are going to make your own songs
SongInfo = {
    ['5000'] = { 'CHASE THE SUN', 'Turbo Kevin' },
    ['5001'] = { 'Get Shaky', 'Turbo Kevin' },
    ['5002'] = { 'Heroine - Pat B Remix', 'Pat B' },
    ['5003'] = { 'Lalalalala', 'High Level' },
    ['5004'] = { 'Last Minute', 'Scooter' },
    ['5005'] = { 'Like A Baka', 'Natte Visstick' },
    ['5006'] = { 'Move Your Body To The Beat', 'Reinier Zonneveld' },
    ['5007'] = { 'Muzika - Sefa Remix', 'Dr. Peacock' },
    ['5008'] = { 'Push Up', 'Creeds' },
    ['5009'] = { 'S&M - Hardstyle', 'Poseidon' },
    ['5011'] = { 'Theo mach mir ein Tekk Bananenbrot', 'NoooN' },
    ['5012'] = { 'We Are The People', 'Empire of the Sun' },
    ['5013'] = { 'Barbie Girl - Tiësto Remix', 'Aqus - Tiësto' },
    ['5014'] = { 'Not Fair', 'Niklas Dee - Old Jim - Enny-Mae' },
    ['5015'] = { 'World Hold On - FISHER Rework', 'Bob Sinclar - FISHER' },
    ['5016'] = { 'California Dreamin', 'Rumix' },
    ['5017'] = { 'SexyBack', 'Lucky Luke - Fella' },
    ['5018'] = { 'Lay All Your Love On Me', 'MELON - Dance Fruits Music' },
    ['5019'] = { 'Cold As Ice', 'LUNAX, KYANU' },
    ['5021'] = { "Baby Don't Hurt Me", 'David Guetta - Anne-Marie' },
    ['5022'] = { 'Swalla', 'MITCH DB - Navagio' },
    ['5023'] = { "Gangsta's Paradise", 'MELON, Dance Fruits Music' },
    ['5024'] = { 'Be My Lover - 2023 Mix', 'Hypaton - David Guetta - La Bouche' },
    ['5025'] = { '99 Luftballons', 'Harris & Ford' },
    ['5026'] = { 'Born For This', 'Muzz' },
    ['5027'] = { 'Deeper Love', 'Botnek' },
    ['5028'] = { 'Feeling Stronger Remix', 'Muzz' },
    ['5029'] = { 'Incomplete Remix', 'Aero Chord' },
    ['5031'] = { 'I Remember U', 'Cartoon' },
    ['5032'] = { 'Lost Forever', 'Muzz' },
    ['5033'] = { 'One Shot', 'Midnight CVLT' },
    ['5034'] = { 'Pure Action', 'Kumarion' },
    ['5035'] = { 'Stay Maduk Remix', 'Delta Heavy' },
    ['5036'] = { 'The Light', 'PROFF' },
    ['5037'] = { 'Time Travel', 'Midnight CVLT' },
    ['5038'] = { 'Worlds Collide Remix', 'Koven' },
    ['5039'] = { '99 Luftballons', 'Nena' },
    ['5041'] = { 'Beat It', 'Michael Jackson' },
    ['5042'] = { 'Funky Town', 'Lipps Inc.' },
    ['5043'] = { 'Holiday', 'Madonna' },
    ['5044'] = { 'Lay All Your Love On Me', 'ABBA' },
    ['5045'] = { 'Never Gonna Give You Up', 'Rick Astley' },
    ['5046'] = { 'Pump Up The Jam', 'Technotronic' },
    ['5047'] = { 'Everybody Wants To Rule The World', 'Tears For Fears' },
    ['5048'] = { 'Smooth Criminal', 'Michael Jackson' },
    ['5049'] = { "I'm Still Standing", 'Elton John' },
    ['5051'] = { 'Sweet Dreams', 'Eurythmics' },
    ['5052'] = { 'You Spin Me Round', 'Dead Or Alive' },
}

-- Globally disable any radio station you want. These won't display in the radio wheel. Simply insert a string of the station's name
-- https://github.com/DurtyFree/gta-v-data-dumps/blob/master/radioStations.json
-- You can also use something like https://forum.cfx.re/t/free-xnradio-gta-online-like-radio-favourites-build-2372-mptuner-dlc/4103031
DisableRadio = {
    -- 'RADIO_01_CLASS_ROCK',
    -- 'RADIO_02_POP',
    -- 'RADIO_03_HIPHOP_NEW',
    -- 'RADIO_04_PUNK',
    -- 'RADIO_05_TALK_01',
    -- 'RADIO_06_COUNTRY',
    -- 'RADIO_07_DANCE_01',
    -- 'RADIO_08_MEXICAN',
    -- 'RADIO_09_HIPHOP_OLD',
    -- 'RADIO_11_TALK_02',
    -- 'RADIO_12_REGGAE',
    -- 'RADIO_13_JAZZ',
    -- 'RADIO_14_DANCE_02',
    -- 'RADIO_15_MOTOWN',
    -- 'RADIO_16_SILVERLAKE',
    -- 'RADIO_17_FUNK',
    -- 'RADIO_18_90s_ROCK',
    -- 'RADIO_19_USER',
    -- 'RADIO_20_THELAB',
    -- 'RADIO_21_DLC_XM17',
    -- 'RADIO_22_DLC_BATTLE_MIX1_RADIO',
    -- 'RADIO_23_DLC_XM19_RADIO',
    -- 'RADIO_27_DLC_PRHEI4',
    -- 'RADIO_34_DLC_HEI4_KULT',
    -- 'RADIO_35_DLC_HEI4_MLR',
    -- 'RADIO_36_AUDIOPLAYER',
    -- 'RADIO_37_MOTOMAMI',
}

-- This will allow you to hear the radio better outside of vehicles (engine still needs to be running)
MakeVehicleRadioLouder = true

-- In case you don't have a "keep engine running after getting out" code snippet. This will simply keep the engine running when the player gets out.
KeepEngineRunning = true

-- This is for people on 2944. 2944 fucks with how the stations gets synced to other clients. This means that if a client sets the radio to RADIO_38_CUSTOM
-- other clients think it got turned off. This "tries" to fix that bevaviour. But I wouldn't recommened running 2944
Experimental = false
