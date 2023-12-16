var cacheid = 0;
var timeout = null;
var configg = null;
var cacheData = null;

var hudAlwaysOpen = false;

$(window).ready(function() {
    window.addEventListener('message', (event) => {
        let data = event.data;
		switch(data.action) {
           case "hudAlways":
                hudAlwaysOpen = !hudAlwaysOpen;
                $(".hud").show("fade");
                if(hudAlwaysOpen == false) { 
                    $(".hud").hide("fade");
                }
           break;
           case "hudSize":
                console.log(data.size)
                $(".hud").css("zoom", data.size+"%");

          break;
           case "update":   
            configg = data.config;
            cacheid = data.data.pid;
            cacheData = data;
          
            $.each(data.bones, function (i, v) { 
                // if(v.bone == 1 || v.bone == 98 || v.bone == 70 || v.bone == 41 || v.bone == 15 || v.bone == 3) {
                  
                    w = configg.BoneLabelText[v.bone].unity;
                    health = 100;
                    console.log(data.data.injures);
                    if (data.data.injures[v.bone] >= 1) {
                        if (health < -1) {
                            health = 0;
                        } else {
                            health = health - (data.data.injures[v.bone] * 10);
                        }
                        if (health < 0) {
                            health = 0;
                        }

                        if(w == "Chest" || w == "Pelvis") {
                            w = "body";
                        }

                        if(w == "RKnee") {
                            w = "rleg"
                        }

                        if(w == "LKnee") {
                            w = "lleg"
                        }

                        if(w == "RShoulder") {
                            w = "rarm"
                        }

                        if(w == "LShoulder") {
                            w = "larm"
                        }
 
                        $("." + w.toLowerCase() + "-perc").html(health + "%");
                        $("." + w.toLowerCase() + "-status").css("width" , health+ "%");
                    }
                   
            }); 

            $(".ic-liste").html("");
            $.post("https://s4-realisticdisease/checkItems", {},  function (data) {

                    $.each(data, function (i, v) { 
                        $(".ic-liste").append(`
                        <div class="ic-item"  data-name="${v.name}">
                            <div class="ic-img" data-name="${v.name}"><div class="asl-img" style="background:url(items/${v.name}.png); background-size:cover;"></div></div>
                            <div class="ic-ic">
                                <div class="ic-name">${v.label}</div>
                                <div class="ic-desc">Heals Wounds and bla bla</div>
                                <div class="ic-count">${v.count}</div>
                            </div>
                        </div>
                    `);  

                    handle();
                });
            });

          

           break;
           case "open":
          
            // $(".treatment-ui").css("right", "0%");
            $(".bone-list").show("fade");
            $(".treatment-ui").show();
            $(".treatment-ui").animate({
                right: "0%"
            }, 1000); 
            // Adjust the duration (1000ms) as needed
            // $(".menu").show("fade");
            // $(".menu header").html("Patient: " + data.data.name);
        
            configg = data.config;
            cacheid = data.data.pid;
            cacheData = data;
            $(".bone-list").html("");
            $.each(data.bones, function (i, v) { 
                // if(v.bone == 1 || v.bone == 98 || v.bone == 70 || v.bone == 41 || v.bone == 15 || v.bone == 3) {
                    coordX = v.screenX;
                    coordY = v.screenY;
                    w = configg.BoneLabelText[v.bone].unity;
                    health = 100;
                    if (data.data.injures[v.bone] >= 1) {
                        if (health < -1) {
                            health = 0;
                        } else {
                            health = health - (data.data.injures[v.bone] * 10);
                        }
                        if (health < 0) {
                            health = 0;
                        }

                        if(w == "Chest" || w == "Pelvis") {
                            w = "body";
                        }

                        if(w == "RKnee") {
                            w = "rleg"
                        }

                        if(w == "LKnee") {
                            w = "lleg"
                        }

                        if(w == "RShoulder") {
                            w = "rarm"
                        }

                        if(w == "LShoulder") {
                            w = "larm"
                        }
 
                        $("." + w.toLowerCase() + "-perc").html(health + "%");
                        $("." + w.toLowerCase() + "-status").css("width" , health+ "%");
                    }
                    if(v.bone == 1 || v.bone == 98 || v.bone == 70 || v.bone == 41 || v.bone == 15 || v.bone == 3) {

                        $(".bone-list").append(`
                            <div class="bone-item" style="
                            position: absolute;
                            width: 4vw;
                            height: 4.5vh;
                            background: url(items/antep.png) 0% 0% / cover;
                            z-index: 1000;
                            inset: ${coordY*90+"%"} ${(100 - coordX*100)+"%"} ${(100 - coordY*100)+"%"} ${coordX*100+"%"};
                            " data-bone="${v.bone}" data-w="${w}"> 
                                <div class="bone-item-label">${v.label}</div>
                                <div class="bone-item-per">${health}% Health</div>
                                <div class="bone-item-heal" data-bone="${v.bone}"><i class="fa-regular fa-chevron-right"></i></div>
                            </div>
                        `);

                }
            }); 

            $(".ic-liste").html("");
            $.post("https://s4-realisticdisease/checkItems", {},  function (data) {

                    $.each(data, function (i, v) { 
                        $(".ic-liste").append(`
                        <div class="ic-item"  data-name="${v.name}">
                            <div class="ic-img" data-name="${v.name}"><div class="asl-img" style="background:url(items/${v.name}.png); background-size:cover;"></div></div>
                            <div class="ic-ic">
                                <div class="ic-name">${v.label}</div>
                                <div class="ic-desc">Heals Wounds and bla bla</div>
                                <div class="ic-count">${v.count}</div>
                            </div>
                        </div>
                    `);  

                    handle();
                });
            });

          
           break;
           case "damageTaken":
            var CurrentInjure = data.CurrentInjure;
            var config = data.config;

            if(hudAlwaysOpen == false) {
               $(".hud").show("fade");
            }
           

            if(timeout != null) {
                clearTimeout(timeout);
                timeout = null;
            }

            $(".human *").hide();

            $.each(CurrentInjure, function (i, v) { 
                 $("." + config[v].unity).show("pulsate");
            });
             
            if(hudAlwaysOpen == false) {
                timeout = setTimeout(() => {
                    $(".hud").hide("fade");
                }, 2500);
            }
          
 
           break;
           case "checked":
                var CurrentInjure = data.data.injures;
                var CurrentInjureOld = data.injuresOld;
                var config = data.config;
                $(".human_doc *").hide();
                $(".list").html("");
                $.each(CurrentInjure, function (i, v) { 
                    var v = v;
                    clvl = "Minor";
                    lvl = CurrentInjureOld[v];
                    // console.log(lvl, CurrentInjureOld[v] )
                    if (lvl > 1 && lvl < 2) {
                        clvl = "Minor";
                    } else if (lvl >= 3 && lvl < 8) {
                        clvl =  "Medium";
                    } else if (lvl >= 9) {
                        clvl =  "Critical";
                    }
                    $(".list").append(`
                         <div class="item" data-clvl="${clvl}" data-v="${v}" data-type="${config[v].name}">${config[v].Label} <span>Difficulty in treatment: ${clvl} </span></div>
                    `);
                    $("." + config[v].unity + "_doc").show("fade");
                });
                $(".injure-list").show("fade");
           break;
           case "config":
        
           break;
		 
		}
    });
  
});

var cachedTreat = {
    clvl: null,
    v: null,
    type: null,
    pid: null
}


$(document).on("click", ".bone-item-heal" , function() {
    const bone = $(this).data("bone");
    var bones = cacheData.bones;
    var info = cacheData.data.info;
    var injures = cacheData.data.injures;
 
    $(".com-ic-list").html("");
    try {
        for (let i = 0; i < bones.length; i++) {
            if(bone == bones[i].bone) {
             
                if(info.length != 0 ) {
                    $(".com-ic-list").append(`
                        <div class="com-list-item">
                            <div class="com-list-item-img"><div class="inj"></div></div>
                            <div class="com-list-item-ic">
                                <div class="com-list-item-name">${info[bone][0].label} Bullets</div>
                                <div class="com-list-item-count">${injures[bone]}</div>
                            </div>
                        </div>
                    `);
                }
                break;
            }  
        }
    }catch(e) {
        // console.log(e);
    }

});


function handle() {
    $(".ic-img").draggable({
        helper: "clone",
        appendTo: "body",
        scroll: true,
        revertDuration: 0,
        revert: "invalid",
        cursorAt: { top: Math.floor($(".ic-item").outerHeight() / 12), left: Math.floor($(".ic-item").outerWidth() / 8) },
        start: function (event, ui) {
            $(ui.helper).css({
                width: $(this).width() + 20,
                height: $(this).height() + 25
            });
        },
        stop: function () {
             
        },
    });

    $(".bone-item").droppable({
        accept: ".ic-img",
        drop: function(event, ui) {
            var bone = $(this).data("bone");
            var w = $(this).data("w");
            var item = ui.draggable.data("name");
            if(w == "Chest" || w == "Pelvis") {
                w = "body";
            }

            if(w == "RKnee") {
                w = "rleg"
            }

            if(w == "LKnee") {
                w = "lleg"
            }

            if(w == "RShoulder") {
                w = "rarm"
            }

            if(w == "LShoulder") {
                w = "larm"
            }
            w = w.toLowerCase();
            
            $.post("https://s4-realisticdisease/checkTreatment", JSON.stringify({ bone: bone, area: w, item: item, cacheid: cacheid }),  function (data) {
                    


          

            });

            $(".treatment-supplies").hide("fade");
            $(".injure-list").hide("fade");
            $(".menu").hide("fade");
            $(".treatment-ui").animate({
                right: "-40%"
            }, 1000); 
            $(".bone-list").hide("fade");
       
            setTimeout(() => {
                $(".treatment-ui").hide("fade");
            }, 1000);
            $.post("https://s4-realisticdisease/close");

            // console.log("zozi " + w.toLowerCase())
        }
    });
}






 
$(document).on("click", ".item" , function() {
    $(".treatment-supplies").show("fade");
    $(".supplies").html("");
    cachedTreat.clvl  = $(this).data("clvl");
    cachedTreat.v  = $(this).data("v");
    cachedTreat.type  = $(this).data("type");
    cachedTreat.pid = cacheid;

    // if($("treatment-supplies").css("top") != "50%") {
         $(".treatment-supplies").removeClass("active");
 
        $(".treatment-supplies a").css("display", "none");
    // }
 
    $.post("https://s4-realisticdisease/checkItems", {},  function (data) {
        var i = 0;
        $.each(configg.Treatment[cachedTreat.clvl], function (x, v) { 
            var have = ""
            if(data[v]) {
                 
                    i = i + 1;
               
                have = `<i class="fa-duotone fa-circle-check"></i>`;
            }
            $(".supplies").append(`
                <div class="sup" style=" background: url(items/${v}.png); background-size: cover;">${have}</div>
            `);
           
            if(i == configg.Treatment[cachedTreat.clvl].length) {
                // setTimeout(() => {
                    $(".treatment-supplies").addClass("active");
                    // $(".treatment-supplies").css({ "top": "52.5%", "height": "38vh" });
                    $(".treatment-supplies a").css("display", "block");
                // }, 1000);
            }
           
        });
    });
});

$(document).on("click", ".treatment-supplies a" , function() {
    $(".treatment-supplies").hide("fade");
    $(".injure-list").hide("fade");
    $(".menu").hide("fade");
    $.post("https://s4-realisticdisease/close");
    $.post("https://s4-realisticdisease/startTreat", JSON.stringify(cachedTreat));
});

$(document).on("click", ".menu-item" , function() {
    $(".menu").hide("fade");
    $.post('https://s4-realisticdisease/action', JSON.stringify({ type: $(this).data("type"), pid: cacheid }));
});

 


$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: 
            $(".treatment-supplies").hide("fade");
            $(".injure-list").hide("fade");
            $(".menu").hide("fade");
            $(".treatment-ui").animate({
                right: "-40%"
            }, 1000); 
            $(".bone-list").hide("fade");
       
            setTimeout(() => {
                $(".treatment-ui").hide("fade");
            }, 1000);
            $.post("https://s4-realisticdisease/close");
        break;
    }
  });