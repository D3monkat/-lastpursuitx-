<!-- Hi welcome to this readme | If you want a better viewing experience, please open this file in VSCode and use CTRL + Shift + V -->

# Getting the songs
To download the corresponding playlists you should go to [this google drive link](https://drive.google.com/file/d/1wrKVea0bptpsV27isFQNMrEV7Y_1SdJF)
and put all of the `AWC` files inside of the songdirectory folder.

I can't include this in the package because of copyright reasons of course, enjoy :)!

# Making your own songs
I would highly suggest you first try and learn about native audio. This is by no means **NOT EASY** at all. There is [this tutorial](https://forum.cfx.re/t/how-to-make-a-simplesound-using-native-audio/5156001) on it that I made on the forums. If you are confident enough you can follow the rest.

1. Export one of my `AWC` files to XML with CW so you can use it as a template file.

2. Replace all the important entries in the `.awc.xml` file such as the file name, samples, etc. You can keep the same trackid or make an entirely new one. Do note that you need to update the config with the proper trackid if you want the song's and author's names to be displayed in the radio wheel.

3. Now export the `dlccustomsongs_sound.dat54.rel` file to XML. Now replace the song you replaced or add completely new entries. The only important step here is that you add the EXACT duration to the streaming sound. You can also use Audacity to see the duration just like you can see the samples. Simply select `seconds + milliseconds`.

4. Now do the same for the `dat151` file. Simply replace or add a new entry to one of the playlist. Now you should succesfully have replaced a song.

# Editing hud icons

Unless you already have another resource which is streaming a `hud.ytd` file, you can just keep using this one. Open it up and you will notice the following textures have been added.

- GTA_Radio_Stations_Custom_Texture01
- GTA_Radio_Stations_Custom_Texture02
- GTA_Radio_Stations_Custom_Texture03
- GTA_Radio_Stations_Custom_Texture04

These are the new radio stations. I would suggest using someting like [this](https://www.gta5-mods.com/misc/new-colorful-hud-weapons-radio-map-blips) to flair up your hud a bit. This also includes the weapon icons and map icons!

> ## IMPORTANT  
> If you are using another `hud.ytd` file. Please add the custom radio texture using the EXACT names from above!