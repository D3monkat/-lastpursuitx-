function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	AddTextEntry('0xE36810D4', 'H24')
	AddTextEntry('0xB6BEB37F', 'ORAZR')
end)