function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
    AddTextEntry("tr_pdbike_storage", "[TR] Storage")
    AddTextEntry("tr_pdbike_livery1", "[TR] LSPD Livery")
    AddTextEntry("tr_pdbike_livery2", "[TR] Sheriff Livery")
    AddTextEntry("tr_pdbike_livery3", "[TR] Ranger Livery")
    AddTextEntry("tr_pdbike_livery4", "[TR] Trooper Livery")
end)
