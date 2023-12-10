
AddTextEntry('CHRISTMAS_RADIO', 'Jingle Pops')
ForceRadioTrackListPosition('CHRISTMAS_RADIO', 'christmas_radiotrack', GetNetworkTimeAccurate())

for k, v in pairs(SongInfo) do
    AddTextEntry(string.format('%s%s', k, 'S'), v[1])
    AddTextEntry(string.format('%s%s', k, 'A'), v[2])
end
