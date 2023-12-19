var currentPage = 1;
var myCoin = 0;
var selectedCategory = null;
var categories = [];
var items = [];
var coinList = [];
var topPlayers = [];
var translate = [];
var firstOpen = true;
var profilePhoto = null;

function setCoinBuyItems() {
    $(".coinListArea").empty();
    coinList.forEach((element) => {
        $(".coinListArea").append(`
            <div class="coinItem">
                <div class="coinNameArea">
                    <div class="coinBuyCoinCount">${element.coinCount}</div>
                    <div class="coinBuyCoinText">${translate.coin}</div>
                </div>
                <div class="coinBuyImageArea">
                    <img src=${element.image} alt="" />
                </div>
                <div class="coinBottomSection">
                    <div class="coinRealPrice">${translate.realCurrency}${element.realPrice}</div>
                    <div class="coinBuyButton" data-coinBuy='${JSON.stringify(element)}'>${translate.buy}</div>
                </div>
            </div>
        `);
    });
}

$(document).on("click", ".coinBuyButton", function () {
    var selectedDiv = this;
    var selectedStringify = $(this).attr("data-coinBuy");
    var itemParse = JSON.parse(selectedStringify);
    window.invokeNative("openUrl", itemParse.link);
});

function setCategories(xxx) {
    $(".categorySection").empty();
    xxx.forEach((element) => {
        $(".categorySection").append(`
            <div class="categoryItem" id="${element.category}">
            <i id="categoryIcon" class="${element.icon}"></i>
            </div>
        `);
    });
}

function setItemsIntoCategory(cate, items) {
    cate.forEach((cateElements) => {
        items.forEach((itemElements) => {
            if (cateElements.category == itemElements.category) {
                cateElements.items.push(itemElements);
            }
        });
    });
}

$(document).on("click", ".categoryItem", function () {
    var currentDiv = this;
    var current = document.getElementsByClassName("categoryItem active");
    if (current.length > 0) {
        current[0].className = current[0].className.replace("categoryItem active", "categoryItem");
    }
    this.className += " active";
    var categoryId = currentDiv.id;
    selectedCategory = null;
    categories.forEach((element) => {
        if (element.category == categoryId) {
            selectedCategory = element.items;
        }
    });
    if (selectedCategory) {
        currentPage = 1;
        $(".totalPage").attr("data-totalPage", currentPage);
        $(".currentPage").html(currentPage);
        setTimeout(() => {
            setItem();
        }, 50);
    }
});

function setItem() {
    if (selectedCategory) {
        var totalCategory = Math.ceil(selectedCategory.length / 12);
        $(".totalPage").html("/ " + totalCategory);
        $(".totalPage").attr("data-totalPage", totalCategory);
        $(".rightItemList").empty();
        var forPage = (currentPage - 1) * 12;
        var inCount = 0;
        for (let index = 0; index < selectedCategory.length; index++) {
            if (index >= forPage) {
                inCount += 1;
                if (inCount > 12) break;
                const element = selectedCategory[index];
                $(".rightItemList").append(`
                    <div class="rightItem">
                        <div class="itemTopSection">
                            <div class="rightItemName">${element.label}</div>
                            <div class="rightItemCount">${element.count}X</div>
                        </div>
                        <div class="itemImageArea">
                            <img src=${element.image} alt="" />
                        </div>
                        <div class="itemBottomArea">
                            <div class="itemCoinArea">
                                <div class="coinImageArea">
                                    <img src="./images/coin.png" alt="" />
                                </div>
                                <div class="itemCoinAmount">${element.price}</div>
                                <div class="itemCoinText">${translate.coin}</div>
                            </div>
                            <div class="buyButton" data-itemData='${JSON.stringify(element)}'>${translate.buy}</div>
                        </div>
                    </div>
                `);
            }
        }
    }
}

$(document).on("click", ".nextButton", function () {
    var totalPage = $(".totalPage").attr("data-totalPage");
    currentPage += 1;
    if (totalPage >= currentPage) {
        $(".totalPage").attr("data-totalPage", currentPage);
        $(".currentPage").html(currentPage);
        setTimeout(() => {
            setItem();
        }, 50);
    } else {
        currentPage -= 1;
    }
});

$(document).on("click", ".previousButton", function () {
    var totalPage = $(".totalPage").attr("data-totalPage");
    currentPage -= 1;
    if (totalPage >= currentPage && currentPage > 0) {
        $(".totalPage").attr("data-totalPage", currentPage);
        $(".currentPage").html(currentPage);
        setTimeout(() => {
            setItem();
        }, 50);
    } else {
        currentPage += 1;
    }
});

$(document).on("click", ".addCreditButton", function () {
    $(".coinBuyArea").fadeIn(400);
});

$(document).on("click", ".buyButton", function () {
    var selectedDiv = this;
    var itemData = $(selectedDiv).attr("data-itemData");
    var jsonData = JSON.parse(itemData);
    $(".wantCoin").html(jsonData.price + " " + translate.coin);
    $(".wantItemName").html(jsonData.label);
    $(".wantItemCount").html(jsonData.count + "X");
    $("#wantBuyButton").attr("data-buyButtonItem", itemData);
    $(".youWantBuySection").fadeIn(400);
});

$(document).on("click", "#wantCancelButton", function () {
    $(".youWantBuySection").fadeOut(400);
});

$(document).on("click", "#wantBuyButton", function () {
    var selectedDiv = this;
    var itemData = $(selectedDiv).attr("data-buyButtonItem");
    var jsonData = JSON.parse(itemData);
    $(".succesItemLabel").html(jsonData.label);
    $("#succesImg").attr("src", jsonData.image);
    if (myCoin >= jsonData.price) {
        $.post(
            "https://ak4y-playTimeShop/buyItem",
            JSON.stringify({
                itemInfo: jsonData,
            }),
            function (data) {
                if (data === true) {
                    myCoin -= jsonData.price;
                    $(".creditCount").html(myCoin);
                    $(".youWantBuySection").fadeOut(400);
                    $(".succesfullyPurchArea").fadeIn(400);
                    setTimeout(() => {
                        $(".succesfullyPurchArea").fadeOut(400);
                    }, 1500);
                } else {
                    $(".notifyArea").html(translate.youDntHvEngMoney);
                    $(".notifySectionXX").fadeIn(200);
                    setTimeout(() => {
                        $(".notifySectionXX").fadeOut(200);
                    }, 3000);
                }
            }
        );
    } else {
        $(".notifyArea").html(translate.youDntHvEngMoney);
        $(".notifySectionXX").fadeIn(200);
        setTimeout(() => {
            $(".notifySectionXX").fadeOut(200);
        }, 3000);
    }
});

$(document).on("click", "#exitIcon", function () {
    $.post("https://ak4y-playTimeShop/closeMenu", JSON.stringify());
    $(".generalSection").hide();
    $(".coinBuyArea").hide();
    $(".youWantBuySection").hide();
    $(".succesfullyPurchArea").hide();
});

$(document).on("click", "#exitBttn", function () {
    $(".coinBuyArea").fadeOut(400);
});

$(document).on("click", ".redeemOkButton", function () {
    var codeInputValue = $("#redeemCodeInput").val();
    if (codeInputValue != "REDEEM CODE..." && codeInputValue.length > 0) {
        $.post(
            "https://ak4y-playTimeShop/sendInput",
            JSON.stringify({
                input: codeInputValue,
            }),
            function (data) {
                if (data) {
                    $(".succesfullyArea").fadeIn(200);
                    setTimeout(() => {
                        $(".succesfullyArea").fadeOut(200);
                    }, 3000);
                    myCoin += parseInt(data);
                    $(".creditCount").html(myCoin);
                } else {
                    $(".notifyArea").html(translate.invalidCode);
                    $(".notifySectionXX").fadeIn(200);
                    setTimeout(() => {
                        $(".notifySectionXX").fadeOut(200);
                    }, 3000);
                }
            }
        );
    }
});

$(document).on("keydown", function () {
    switch (event.keyCode) {
        case 27: // ESC
            $.post("https://ak4y-playTimeShop/closeMenu", JSON.stringify());
            $(".generalSection").hide();
            $(".coinBuyArea").hide();
            $(".youWantBuySection").hide();
            $(".succesfullyPurchArea").hide();
            break;
    }
});

function setTopPlayers(topPly) {
    $(".rankAreaRankList").empty();
    for (let i = 0; i < topPly.length; i++) {
        var classText = "";
        if (i == 0) classText = " first";
        if (i == 1) classText = " second";
        if (i == 2) classText = " third";

        const element = topPly[i];
        $(".rankAreaRankList").append(`
            <div class="rankItem${classText}">
                <div class="rankItemLeftArea">
                    <div class="rankCount${classText}">#${i + 1}</div>
                    <div class="weeklyFirstName${classText}">${element.firstName}</div>
                    <div class="weeklyLastName${classText}">${element.lastName}</div>
                </div>
                <div class="rankItemRightArea">
                    <div class="rankItemCoinImgArea">
                        <img src="./images/coin.png" alt="" />
                    </div>
                    <div class="rankItemCoin${classText}">${element.coin}</div>
                    <div class="rankItemCoinText${classText}">${translate.coin}</div>
                </div>
            </div>
        `);
    }
}

window.addEventListener("message", (event) => {
    if (event.data.type === "openui") {
        if (firstOpen) {
            firstOpen = false;
            var xhr = new XMLHttpRequest();
            xhr.responseType = "text";
            xhr.open("GET", event.data.steamid, true);
            xhr.send();
            xhr.onreadystatechange = processRequest;
            function processRequest(e) {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var string = xhr.responseText.toString();
                    var array = string.split("avatarfull");
                    var array2 = array[1].toString().split('"');
                    profilePhoto = array2[2].toString();
                    $("#profilePhotoX").attr("src", profilePhoto);
                }
            }
        } else {
            $("#profilePhotoX").attr("src", profilePhoto);
        }
        $(".nextCoinTime").html(event.data.remaining);
        categories = event.data.categories;
        items = event.data.items;
        coinList = event.data.coinList;
        topPlayers = event.data.topPlayers;
        setTopPlayers(topPlayers);
        myCoin = event.data.coin;
        $(".rewardText6").html(`${event.data.coinReward} ${translate.coin}`);
        $(".creditCount").html(myCoin);
        $(".firstName").html(event.data.firstname);
        $(".lastName").html(event.data.lastname);
        $(".generalSection").show();
        setCoinBuyItems();
        setCategories(categories);
        setItemsIntoCategory(categories, items);
        setTimeout(() => {
            $(".categoryItem:first-child").click();
        }, 10);
    } else if (event.data.type === "translate") {
        translate = event.data.translate;
        $(".title1").html(translate.title1);
        $(".title2").html(translate.title2);

        $(".creditText").html(translate.coin);
        $(".rewardText1").html(translate.nextReward);
        $(".rewardText5").html(translate.reward);

        $(".exitText").html(translate.exit);
        $(".weeklyText").html(translate.title3);
        $(".rankingText").html(translate.title4);

        $(".playTmText").html(translate.title5);
        $(".shpText").html(translate.title6);
        $(".previousText").html(translate.previousPage);
        $(".nextText").html(translate.nextPage);

        $(".succesNotify").html(translate.thxForPurch);
        $(".topText").html(translate.top);
        $(".text6").html(translate.text6);
        $("#exitText").html(translate.exit);
    }
});
