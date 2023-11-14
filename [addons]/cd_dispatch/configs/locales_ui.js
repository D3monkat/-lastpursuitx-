const locale = {
  cd_dispatch_small_title: "No dispatch calls",
  cd_dispatch_small_previous: "Previous",
  cd_dispatch_small_next: "Next",
  cd_dispatch_small_respond: "Respond",
  cd_dispatch_small_mode: "Press right click to exit move mode.",

  cd_dispatch_main_show_refresh_bar: "Show",
  cd_dispatch_main_hide_refresh_bar: "Hide",
  cd_dispatch_main_refresh: "Refresh blips",
  cd_dispatch_main_close_refresh_bar: "Close",
  cd_dispatch_main_refresh_last: "Last refreshed",

  cd_dispatch_main_units_responding: "unit(s) responding",

  cd_dispatch_unit_list: "Unit list",

  cd_dispatch_main_dropdown_respond: "Respond to notification",
  cd_dispatch_main_dropdown_remove_response: "Remove notification response",
  cd_dispatch_main_dropdown_remove_notification: "Remove this notification",
  cd_dispatch_main_dropdown_remove_all: "Remove all notifications",
  cd_dispatch_main_dropdown_assign_all: "Assign every unit to call",

  cd_dispatch_main_modal_title: "Dispatch Settings",
  cd_dispatch_main_modal_autodel: "Auto delete after",
  cd_dispatch_main_modal_autodel_desc:"The amount of time needed to auto delete the notification. (In minutes, 1-60)",
  cd_dispatch_main_modal_set_callsign:"Update callsign",
  cd_dispatch_main_modal_set_callsign_help:"This callsign will be visible to all of the dispatch users",
  cd_dispatch_main_modal_assigned_vehicle:"Assigned vehicle",
  cd_dispatch_main_modal_close: "Close",
  cd_dispatch_main_modal_save: "Save changes",
  cd_dispatch_main_modal_vehicle_foot:" Foot",
  cd_dispatch_main_modal_vehicle_car:" Car",
  cd_dispatch_main_modal_vehicle_motorcycle:" Motorcycle",
  cd_dispatch_main_modal_vehicle_helicopter:" Helicopter",
  cd_dispatch_main_modal_vehicle_boat: " Boat",
  cd_dispatch_main_modal_sound_control: "Sound control",
  cd_dispatch_main_modal_mute_sounds: " Mute sounds",
  cd_dispatch_main_modal_mute_sounds_description: "This option will mute panic and notification sounds",
  cd_dispatch_main_modal_enable_dispatcher: "Enable dispatcher mode?",
  cd_dispatch_main_modal_toggle_button:"Toggle dispatcher mode",
  cd_dispatch_main_modal_dispatcher_status: "Dispatcher mode is currently",
  cd_dispatch_main_modal_dispatcher_status_enabled: "enabled.",
  cd_dispatch_main_modal_dispatcher_status_disabled: "disabled.",

  cd_dispatch_unit_dropdown_gps: "Set GPS location",
  cd_dispatch_unit_join_radio:"Join Radio Channel",
  cd_dispatch_unit_leave_radio:"Leave Radio Channel",

  cd_dispatch_toggle_voice_on: "Toggle Voice ON",
  cd_dispatch_toggle_voice_off: "Toggle Voice OFF",
  cd_dispatch_revert_map: "Revert",

  cd_dispatch_notification_panel: "Notification Panel",

  cd_dispatch_settings_status: "Status",
  cd_dispatch_settings_status_help: "Select your current status.",

  cd_dispatch_units_notification: "No units responding",

  cd_dispatch_tamper_message: "Have you tampered with the values?",
  cd_dispatch_callsign_message: "The callsign needs to be less than 16 characters.",

};

let statusMessages = [
  {name:"Available", color:"#539D1B"}, // The status will default to the first one in the list
  {name:"Unavailable", color:"#F05B56"},
  {name:"Processing", color:"#E46211"},
  {name:"Training", color:"#009DE0"},
  {name:"Undercover", color:"#2E570F"},
]

moment.locale("en"); // The locale of the time on top of the small UI

// Possible locales v
// en,af,ar-dz,ar-kw,ar-ly,ar-ma,ar-sa,ar-tn,ar,az,be,bg,bm,bn-bd,bn,bo,br,bs,ca,cs,cv,cy,da,de-at,de-ch,de,dv,el,en-au,en-ca,en-gb,en-ie,en-il,en-in,en-nz,en-sg,eo,es-do,es-mx,es-us,es,et,eu,fa,fi,fil,fo,fr-ca,fr-ch,fr,fy,ga,gd,gl,gom-deva,gom-latn,gu,he,hi,hr,hu,hy-am,id,is,it-ch,it,ja,jv,ka,kk,km,kn,ko,ku,ky,lb,lo,lt,lv,me,mi,mk,ml,mn,mr,ms-my,ms,mt,my,nb,ne,nl-be,nl,nn,oc-lnc,pa-in,pl,pt-br,pt,ro,ru,sd,se,si,sk,sl,sq,sr-cyrl,sr,ss,sv,sw,ta,te,tet,tg,th,tk,tl-ph,tlh,tr,tzl,tzm-latn,tzm,ug-cn,uk,ur,uz-latn,uz,vi,x-pseudo,yo,zh-cn,zh-hk,zh-mo,zh-tw
