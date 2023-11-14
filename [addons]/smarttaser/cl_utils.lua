function alert(msg) 
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end

function safetyToggled(newStatus)
    
end