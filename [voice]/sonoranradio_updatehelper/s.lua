
CreateThread(function()
    file = io.open(GetResourcePath(GetCurrentResourceName()).."/run.lock", "a+")
    io.input(file)
    line = io.read()
    file:close()
    if line == "radio" then
        ExecuteCommand("refresh")
        Wait(1000)
        if line == "radio" then
			ExecuteCommand("restart sonoranradio")
			Wait(1000)
        end
    else
        os.remove(GetResourcePath(GetCurrentResourceName()).."/run.lock")
        print("sonoranradio_updatehelper is for internal use and should not be started as a resource.")
    end
    os.remove(GetResourcePath(GetCurrentResourceName()).."/run.lock")
end)