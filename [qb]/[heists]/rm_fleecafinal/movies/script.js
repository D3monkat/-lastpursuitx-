$('document').ready(function(){
$gif = $('img').first();
});

window.addEventListener("message", (event) => {
if (event.data.type === "intro") {
    intro();
} else if (event.data.type === "success") {
    success();
} else if (event.data.type == "fail") {
    fail();
}
});

function intro() {
$gif.attr("src", "retro_intro.gif");
setTimeout(function() {
    $gif.attr('src', "blank.png");
}, 3500)
};

function success() {
$gif.attr("src", "retro_success.gif");
setTimeout(function() {
    $gif.attr('src', "blank.png");
}, 3000)
};

function fail() {
$gif.attr("src", "retro_fail.gif");
setTimeout(function() {
    $gif.attr('src', "blank.png");
}, 3000)
};