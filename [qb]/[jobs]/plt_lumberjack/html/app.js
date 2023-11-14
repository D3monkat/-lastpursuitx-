var notifs = {}
var jobOutfitWorn = false
var onWorking = false
var cutting = false
var stacking = false
var delivery = false   
var __ = false
$(document).ready(function() {
    var audioPlayer = null;
    window.addEventListener('message', function (event) {
        if (__ == false) {
            $.post(
                "https://plt_lumberjack/GetLocale",
                JSON.stringify({}),
                function(data) {
                    __ = data
                    $("#topTitle").html(__["uiTitle"]);
                    $("#cutttingTopText").html(__["uiCuttingTitle"]);
                    $("#cutttingComment").html(__["uiCuttingComment"]);
                    $("#cutttingMoneyText").html(__["uiCuttingMoneyText"]);
                    $("#cutttingMoney").html(__["uiCuttingMoney"]);
                    $("#stackingTopText").html(__["uiStackingTitle"]);
                    $("#stackingComment").html(__["uiStackingComment"]);
                    $("#stackingMoney1Text").html(__["uiStacking1MoneyText"]);
                    $("#stackingMoney1").html(__["uiStacking1Money"]);
                    $("#stackingMoney2Text").html(__["uiStacking2MoneyText"]);
                    $("#stackingMoney2").html(__["uiStacking2Money"]);
                    $("#deliveryTopText").html(__["uiDeliveryTitle"]);
                    $("#deliveryComment").html(__["uiDeliveryComment"]);
                    $("#deliveryMoney1Text").html(__["uiDelivery1MoneyText"]);
                    $("#deliveryMoney1").html(__["uiDelivery1Money"]);
                    $("#deliveryMoney2Text").html(__["uiDelivery2MoneyText"]);
                    $("#deliveryMoney2").html(__["uiDelivery2Money"]);
                    $("#jobOutfitTopText").html(__["uiJobOutfitTitle"]);
                    $("#joboutfitComment").html(__["uiJobOutfitComment"]);
                    $("#dailyOutfitTopText").html(__["uiDailyOutfitTitle"]);
                    $("#dailyoutfitComment").html(__["uiDailyOutfitComment"]);
                    $("#button-cancel-job").html(__["uiCancelJobTitle"]);
                    $("#canceljobComment").html(__["uiCancelJobComment"]);
                }
            );
        }
        if (event.data.statu == "single") {
            ShowNotif(event.data);
        } else if (event.data.statu == "persist") {
            if (event.data.text == "close") {
                HidePersist()
            } else{
                ShowPersist(event.data.text)
            }
        }else if (event.data.statu == "openUi") {
            jobOutfitWorn =  event.data.jobOutfitWorn
            onWorking = event.data.onWorking
            cutting = event.data.cutting
            stacking = event.data.stacking
            delivery = event.data.delivery
            var btnCuttting = document.getElementById("button-cuttting");
            var btnStacking = document.getElementById("button-stacking");
            var btnDelivery = document.getElementById("button-delivery");
            var btnCancelJob = document.getElementById("button-cancel-job");             
            if (onWorking == true){
                 btnCuttting.classList.remove("selectable");
                btnDelivery.classList.remove("selectable");
                btnCancelJob.classList.remove("unselectableCancel");
                btnStacking.classList.remove("selectable"); 
                btnStacking.classList.add("unselectable");
                btnDelivery.classList.add("unselectable");
                btnCancelJob.classList.add("selectableCancel");
                btnCuttting.classList.add("unselectable");

            }else{
                 btnCancelJob.classList.remove("selectableCancel"); 
                btnCancelJob.classList.add("unselectableCancel");
                if (cutting == true){
                     btnCuttting.classList.remove("unselectable"); 
                    btnCuttting.classList.add("selectable");
                }else{
                     btnCuttting.classList.remove("selectable"); 
                    btnCuttting.classList.add("unselectable");
                }
                if (stacking == true){
                    btnStacking.classList.remove("unselectable"); 
                    btnStacking.classList.add("selectable");
                }else{
                     btnStacking.classList.remove("selectable"); 
                    btnStacking.classList.add("unselectable");
                }
                if (delivery == true){
                     btnDelivery.classList.remove("unselectable"); 
                    btnDelivery.classList.add("selectable");
                }else{
                     btnDelivery.classList.remove("selectable"); 
                    btnDelivery.classList.add("unselectable");
                }
            }
            var btnJobOutfit = document.getElementById("button-job-outfit");
            var btnDailyOutfit = document.getElementById("button-daily-outfit");
            if (jobOutfitWorn == true){
                 btnDailyOutfit.classList.remove("unselectable");
                btnJobOutfit.classList.remove("selectable"); 
                btnDailyOutfit.classList.add("selectable");
                btnJobOutfit.classList.add("unselectable");
            }else{
                btnDailyOutfit.classList.remove("selectable");
                btnJobOutfit.classList.remove("unselectable"); 
                btnDailyOutfit.classList.add("unselectable");
                btnJobOutfit.classList.add("selectable");
            }
            ShowUi()
        }else if (event.data.statu == "closeUi") {
            HideUi()
        }else if (event.data.statu == "sound") {
            if (audioPlayer != null) {audioPlayer.pause(); }
            if (event.data.action == "start") {
                if (event.data.type == "wood") {
                    audioPlayer = new Howl({src: ["./sounds/wood.mp3"]});
                }  else if (event.data.type == "leaves") {
                    audioPlayer = new Howl({src: ["./sounds/leaves.mp3"]});
                } else if (event.data.type == "felling") {
                    audioPlayer = new Howl({src: ["./sounds/felling.mp3"]});
                } 
                audioPlayer.volume(event.data.volume/100);
                audioPlayer.play();
            }            
        }
        else if (event.data.statu == "copy"){copyToClipboard(event.data.text);}
    });
    $("#button-cuttting").click(function(){
        if (onWorking == true){$.post('https://plt_lumberjack/notify', JSON.stringify({   event : "uiAlreadyWorking"}));}
        else    {
            if (cutting == true){$.post('https://plt_lumberjack/action', JSON.stringify({     event : "cuttting"}));} 
            else{$.post('https://plt_lumberjack/notify', JSON.stringify({   event : "uiCantThisJob"}));} 
        }
    });
    $("#button-stacking").click(function(){
        if (onWorking == true){
            $.post('https://plt_lumberjack/notify', JSON.stringify({   event : "uiAlreadyWorking"}));
        }else{
            if (stacking == true){$.post('https://plt_lumberjack/action', JSON.stringify({     event : "stacking"}));} 
            else{$.post('https://plt_lumberjack/notify', JSON.stringify({   event : "uiCantThisJob"}));} 
        }
       
    });
    $("#button-delivery").click(function(){
        if (onWorking == true){
            $.post('https://plt_lumberjack/notify', JSON.stringify({   event : "uiAlreadyWorking"}));
        }else{
            if (delivery == true){$.post('https://plt_lumberjack/action', JSON.stringify({     event : "delivery"}));} 
            else{$.post('https://plt_lumberjack/notify', JSON.stringify({   event : "uiCantThisJob"}));} 
        }
    });
    $("#button-job-outfit").click(function(){
        if (jobOutfitWorn == false){$.post('https://plt_lumberjack/action', JSON.stringify({   event : "job-outfit"}));} 
        else{$.post('https://plt_lumberjack/notify', JSON.stringify({event : "uiAlreadyWearJob"}));} 
    });
    $("#button-daily-outfit").click(function(){
        if (jobOutfitWorn == true){$.post('https://plt_lumberjack/action', JSON.stringify({ event : "daily-outfit"}));} 
        else{$.post('https://plt_lumberjack/notify', JSON.stringify({event : "uiAlreadyWearDaily"}));} 
    }); 

    $("#button-cancel-job").click(function(){
        $.post('https://plt_lumberjack/action', JSON.stringify({event : "cancel-job"}));
        if (onWorking == true){}
        else{$.post('https://plt_lumberjack/notify', JSON.stringify({event : "uiAlreadyNotWorking"}));}
    });
    $("#close-button").click(function(){HideUi();$.post('https://plt_lumberjack/action', JSON.stringify({event : "close-ui"}));});
    $(document).on('keydown', function() {
        switch(event.keyCode) {
            case 8: $.post('https://plt_lumberjack/action', JSON.stringify({ event : "close-ui"})); break;
            case 27: $.post('https://plt_lumberjack/action', JSON.stringify({ event : "close-ui"})); break;
        }
    });
 /*    TestForChoreme()    */
})

function ShowUi() {
    var id = null;
    var now = -55;
    var goal = 28.0;
    $('#button-container').css("margin-left", ((now))+"vw"); 
    document.getElementById("button-container").style.display = "block";
    clearInterval(id);
    id = setInterval(frame, 1);
    function frame() {
        if (now < goal) {
            now= now + 1.0; 
            $('#button-container').css("margin-left", ((now))+"vw"); 
        } else {
            clearInterval(id);
            $('#button-container').css("margin-left", "auto");   
            document.getElementById("button-container").style.display = "block";
        }
    } 
}
function HideUi() {
    document.getElementById("button-container").style.display = "block";
    var id = null;
    var now = 22;
    var goal = -55;
    clearInterval(id);
    id = setInterval(frame, 1);
    function frame() {
        if (now > goal) {
            now= now - 2.0; 
            $('#button-container').css("margin-left", ((now))+"vw"); 
        } else {
            clearInterval(id);
            document.getElementById("button-container").style.display = "none";
        }
    } 
}
function ShowPersist(data) {
    HidePersist()
    var id = null;
    var now = 0;
    var goal = 2;
    $('#persist-container').css("bottom", (now)+"vw"); 
    document.getElementById("persist-text").innerHTML = data; 
    document.getElementById("persist-container").style.display = "flex"
    clearInterval(id);
    id = setInterval(frame, 1);
    function frame() {
        if (now < goal) {
            now= now + 0.1; 
            $('#persist-container').css("bottom", (now)+"vw"); 
        } 
        else {clearInterval(id);}
    } 
}
function HidePersist() {
    document.getElementById("persist-container").style.display = "none";
}
function ShowNotif(data) {
    let $NotifyCont = $(document.createElement('div'));
    $('.notify-container').append($NotifyCont);
    $NotifyCont.addClass('notification').addClass(data.type);
    $NotifyCont.html("<img class='notifyIcon "+data.type+"Icon'src='img/"+data.type+".svg'><div class='notifyText'>"+data.text+"</div>");
    var id = null;
    var now = -22.5;
    var gol = -0.5;
    $NotifyCont.css("margin-right", (now)+"vw");
    $NotifyCont.fadeIn();
    setTimeout(function() {
        clearInterval(id);
        id = setInterval(frame, 2);
        function frame() {
            if (now < gol) {
                now= now + 0.2; 
                $NotifyCont.css("margin-right", (now)+"vw");
            } else {
                clearInterval(id);
            }
        }
    }, 100);

    setTimeout(function() {
        id = null;
        now = 0.2;
        gol = -23;
        clearInterval(id);
        id = setInterval(frame, 2);
        function frame() {
            if (now > gol) {
                now= now - 0.5; 
                $NotifyCont.css("margin-right", (now)+"vw");
            } else {
                clearInterval(id);
                $.when($NotifyCont.fadeOut()).done(function() {
                    $NotifyCont.remove()
                }); 
            }

        }
    }, data.duration != null ? data.duration : 5000);
}


const copyToClipboard = str => {
    const el = document.createElement('textarea');
    el.value = str;
    document.body.appendChild(el);
    el.select();
    document.execCommand('copy');
    document.body.removeChild(el);
}; 


function TestForChoreme() {
    $('body').css("background-image", "url('img/back.png')");  
    setTimeout(function() {
        ShowNotif({type : "success", text : "İşaretli olan kereste paletini al işaretlenmiş bir tırın dorsesine yerleştir veya varsa forklifti işaretli bir tırın dorsesine yerleştir. İşaretli olan kereste paletini al işaretlenmiş bir tırın dorsesine yerleştir veya varsa forklifti işaretli bir tırın dorsesine yerleştir.", duration : 1000000}); 
    }, 0);
    setTimeout(function() {
        ShowNotif({type : "inform", text : "açı eklendi.", duration : 400000}); 
    }, 1000);
    setTimeout(function() {
        ShowNotif({type : "warning", text : " lütfen 0.0 ile 100 arasında bir sayı giriniz. örnek:'/%s 15.2'lütfen 0.0 ile 100 arasında bir sayı giriniz. örnek:'/%s 15.2'", duration : 1000000}); 
    }, 2000);
    setTimeout(function() {
        ShowNotif({type : "error", text : "Tüm tırlar zaten dolu.", duration : 3000}); 
    }, 3000); 

    ShowPersist("Eğer keresteleri bu inşaata teslim etmek istiyorsanız; Tırı müsait bir yere parkedin. Keresteleri kolayca alabilmek için; düz bir zemine ve tır ile dorse paralel olacak şekilde park edin. bu inşaata teslimatınız için: '%s' teslimat ücreti, '%s' extra giderler için ödenecek.");  
    ShowUi() 

}

