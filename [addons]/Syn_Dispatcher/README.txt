
░██████╗██╗░░░██╗███╗░░██╗░██████╗░█████╗░██████╗░██╗██████╗░████████╗░██████╗
██╔════╝╚██╗░██╔╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
╚█████╗░░╚████╔╝░██╔██╗██║╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░╚█████╗░
░╚═══██╗░░╚██╔╝░░██║╚████║░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░░╚═══██╗
██████╔╝░░░██║░░░██║░╚███║██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░██████╔╝
╚═════╝░░░░╚═╝░░░╚═╝░░╚══╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░

https://discord.gg/ZbmaduFFqv






███████╗██╗░░██╗░█████╗░███╗░░░███╗██████╗░██╗░░░░░███████╗░██████╗
██╔════╝╚██╗██╔╝██╔══██╗████╗░████║██╔══██╗██║░░░░░██╔════╝██╔════╝
█████╗░░░╚███╔╝░███████║██╔████╔██║██████╔╝██║░░░░░█████╗░░╚█████╗░
██╔══╝░░░██╔██╗░██╔══██║██║╚██╔╝██║██╔═══╝░██║░░░░░██╔══╝░░░╚═══██╗
███████╗██╔╝╚██╗██║░░██║██║░╚═╝░██║██║░░░░░███████╗███████╗██████╔╝
╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░░░░░╚══════╝╚══════╝╚═════╝░

alertmsg = " Seen Robbing A Car " -- can be false remember to add spaces before and after text -- these can usually be auto generated if you include the CORRECT call code
alertTitle = "Shots Fired" -- can be false https://web.stanford.edu/~reneeb/bill/n.radio.code.html -- these can usually be auto generated if you include the CORRECT call code
alertCallCode = "10-71" --https://web.stanford.edu/~reneeb/bill/n.radio.code.html -- MUST BE CORRECT USED FOR AUDIO CREATION
DispatchedJob = "police" or {"police","firedept","ambulance"} or {Config.PoliceJob,Config.FireDeptJob,Config.AmbulanceJob} -- what job(s) recieves the call?
includeSuspect = true 
YourData = {duration = 4000, icon = "fa-ruler", color = 11} -- this is data you can pass through when you trigger the event. recommended to use tables here EX: {duration = 4000, icon = "fa-ruler", color = 11, } -- Implementation of this variable is up to the developer

    **PLEASENOTE**
If you want a specific location and no suspect then you need to pass coords in YourData and set the includeSuspect var to false 

        alertmsg = false
        alertTitle = false 
        alertCallCode = "10-71" 
        DispatchedJob = "police" 
        includeSuspect = false 
        YourData = {coords = vector3(0,0,0)} 
        
        TriggerEvent("Syn_Dispatcher:client:ReportCriminalActivity",alertmsg,alertTitle,alertCallCode,DispatchedJob, includeSuspect,YourData)
            


░█████╗░██╗░░░░░██╗███████╗███╗░░██╗████████╗
██╔══██╗██║░░░░░██║██╔════╝████╗░██║╚══██╔══╝
██║░░╚═╝██║░░░░░██║█████╗░░██╔██╗██║░░░██║░░░
██║░░██╗██║░░░░░██║██╔══╝░░██║╚████║░░░██║░░░
╚█████╔╝███████╗██║███████╗██║░╚███║░░░██║░░░
░╚════╝░╚══════╝╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░

TriggerEvent("Syn_Dispatcher:client:ReportCriminalActivity",alertmsg,alertTitle,alertCallCode,DispatchedJob, includeSuspect,YourData)
               
TriggerEvent("Syn_Dispatcher:client:ReportCriminalActivity",false,false,alertCallCode,jobreported,false,false)

░██████╗███████╗██████╗░██╗░░░██╗███████╗██████╗░
██╔════╝██╔════╝██╔══██╗██║░░░██║██╔════╝██╔══██╗
╚█████╗░█████╗░░██████╔╝╚██╗░██╔╝█████╗░░██████╔╝
░╚═══██╗██╔══╝░░██╔══██╗░╚████╔╝░██╔══╝░░██╔══██╗
██████╔╝███████╗██║░░██║░░╚██╔╝░░███████╗██║░░██║
╚═════╝░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝             
You need to trigger it on a client usually this is the suspect's client
--OffendingClient needs to be an ID 
TriggerClientEvent("Syn_Dispatcher:client:ReportCriminalActivity",OffendingClient, alertmsg,alertTitle,alertCallCode,DispatchedJob, includeSuspect,YourData)
               
TriggerClientEvent("Syn_Dispatcher:client:ReportCriminalActivity",OffendingClient, false,false,alertCallCode,jobreported,false,false)