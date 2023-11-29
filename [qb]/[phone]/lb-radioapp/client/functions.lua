local lib = exports.loaf_lib:GetLib()
local pma = exports["pma-voice"]
local salty = exports.saltychat

function JoinRadio(frequency)
    if Config.VoiceScript == "pma-voice" then
        pma:setVoiceProperty("radioEnabled", true)
        pma:setRadioChannel(frequency)
    elseif Config.VoiceScript == "saltychat" then
        salty:SetRadioChannel(frequency, true)
    end
end

function LeaveRadio()
    if Config.VoiceScript == "pma-voice" then
        pma:removePlayerFromRadio()
        pma:setVoiceProperty("radioEnabled", false)
    elseif Config.VoiceScript == "saltychat" then
        salty:SetRadioChannel("", true)
    end
end

function IsConnected()
    if Config.VoiceScript == "pma-voice" then
        return LocalPlayer.state.radioChannel ~= 0
    elseif Config.VoiceScript == "saltychat" then
        local channel = salty:GetRadioChannel(true)
        return channel ~= nil and channel ~= ""
    end
end

-- volume: 0-100
function SetVolume(volume)
    if Config.VoiceScript == "pma-voice" then
        pma:setRadioVolume(volume)
    elseif Config.VoiceScript == "saltychat" then
        local newVolume = volume / 100 * 1.6
        salty:SetRadioVolume(newVolume)
    end
end

function GetMembers(frequency)
    if Config.VoiceScript == "pma-voice" then
        return lib.TriggerCallbackSync("lb-radioapp:getMembers", frequency)
    elseif Config.VoiceScript == "saltychat" then
        return 0 -- how do you get members on saltychat?
    end
end

function GetLocale(text)
    local locales = Locales[Config.Locale]
    if locales and locales[text] then
        return locales[text]
    end
    return text
end
