#plt_farmer
Discord: poLat#3212
Discord: https://discord.gg/3h8tebmBeD


### Update
- Works with Extended and QB-Core.With a few simple steps you can make it work on other frameworks.Here i will explain how to make it work on other frameworks if you can't make it work just contact me and i will help you out.
- As an option you can use the MenuV instead of standart menu system if you want. If you are using "Extended framework" you can also use the esx menu system as well.
- There will be an option when the player brings back the tractor loaded with pile of crops to the farmer job center. If they want they can leave the job there and take only half of the money. If they want to finish the job properly they will receive the full money but they have to make the delivery with they truck as well.
- If you bought the script before the update, just contact me via discord and give me the mail address you used to buy it for the link of the new updated version. 
- Update includes: MenuV can be used as an alternative. Players can leave working at the middle of the job and receive half of the money.

### How to integrate

- If you don't want to use the MenuV, just set the '@menuv/menuv.lua' as a comment line in the "fxmanifest.lua".
- If you are using ESX just change the PLT.UseEsxFramework set true in config.lua.
- If you are using QB-Core just change the PLT.UseEsxFramework set false in config.lua.
- If you are not using any of those, just search for the "shouldbeintegrated" word in all the files so you can find the codes you need to change.
- If you are not using QB-Core or ESX here are the pictures of the places you need to change:


### How to do the farmer job?
- Go to the the marked area on the map and change your outfit with workwear (optional) and choose a non occupied field to start the job.
- Attach the tractor to the baletrailer and start driving to the marked field.
- When your arrive to the field, the crops and harvester will be there. Park the tractor and get into the harvester.
- Harvest all marked crops with harvester. Move the pile of crops on to the baletrailer and then drive the tractor to starting point which will be marked as well.
- Park the tractor and baletrailer behind the trucks trailer. Load the pile of crops from baletrailer to the trailer.
- When finished get in to the truck, combine it with trailer and drive it to the marked warehouse.
- Pick up the pie of crops and deliver them to the warehouse.
- Bring the truck back.

### What you can edit in the config file
Most of parts in config file is editable and explained detailed. Following the screenshot of the config file will give you some ideas.


### Things you should know
- We have been using this script for a month on the server i developed. No problems sofar is detected.
- if PLT.jobRequired "true" then you need to import it into your farmer.sql database if you using esx_joblisting or compatible with it farmer job automatically will be listed on your business center. If you are using a different business center script, you should integrate it .if PLT.jobRequired false then you don't need to do anything and everyone will be able to start the job.
- Script creates bales, crops, harvester, tractor, bale trailer, truck and truck trailer at certain stages of the job. if you move 400 distance away from these objects. The information of these entities is deleted on the player side and kept on the server side. When you approach, it is transferred to the player side with new information. Because the information has changed, the script cannot process those objects. Therefore, when the player is 350 distance away from the objects, it starts giving an error message to the player. If it exceeds 375, it deletes all entities and cancels the profession.
- When player crashed or get out of the game somehow, spawned objects stays on the server. This is how i solved this situation: those who do work are saved on the server side. If she/he leaves the server without finishing her job, using fivem natives deletes all the objects that player created with this script. As a result if the player on job and disconnected, automatically all objects are deleted and the worked field becomes reusable.
- There are 7 fields in total and 7 players can work at the same time. When you arrive the truck delivery step, this field will be reusable by other players. This way there won't be any queue or if there is any queue the waiting time will be shortened.
- The harvester is and old shared work on the web and its replaced with "tractor3" also the original "baletrailer" is replaced after i deleted the bales on it.

### Requirements
- extended framework
- mythic_notify