(function( $ ){
    let menu = {
        header:"",
        body:[{}],
        footer:""
    }

    function draw(main){
        main.html("");
        let data = ""
        if(menu.header){
            data = `
                <div class='json-menu-header'>
                    ${menu.header}
                </div>`;
        }
        data += "<ul class='list-group json-menu-list'>";
        // Header is set, we can proceed adding other data.
        for(let i = 0; i < menu.body.length; i++){
            // Skip null values.
            // Null values are possible in order to maintain the structure when searching
            if(menu.body[i] == null) continue;
            data += `
                <li class='json-list-item-${i} list-group-item json-item-header' data-toggle='${(menu.body[i].collapse)?"collapse":""}' href='#jsonItem${i}' role='button'>
                    ${menu.body[i].header}
                <div id='jsonItem${i}' class="json-item-body collapse ${(menu.body[i].collapse)?'':'show'}">
                    ${menu.body[i].body}
            `;
            if(menu.body[i].footer){
                data+= `
                <div class='json-item-footer'>
                    ${menu.body[i].footer}
                </div>`;
            }
            data += `</div></li>`;
        }
        data += `</ul>`;
            if(menu.footer){
                data += `
                    <div class='json-menu-footer'>
                        ${menu.footer}
                    </div>
                `;
            }
            main.html(data);
    }
    function show(main, speed){
        main.show(speed || 500);
    }
    function hide(main, speed){
        main.hide(speed || 200);
    }
    function expand(item){

    }
    function collapse(item){

    }
    function has(item){
        if(Number.isInteger(item)){
            if(menu.body.length >= item)
                return item;
            else return -1;
        }
        
        for(let i = 0; i < menu.body.length; i++){
            if(item.header && menu.body[i].header && item.header == menu.body[i].header){
                if(item.body && menu.body[i].body && item.body == menu.body[i].body){
                    return i;
                }
            }
        }

        return -1;
    }
    function remove(item){
        if(has(item) != -1){
            menu.body.splice(i, 1);
            draw();
        }
    }
    function alert(item, options){
        let i = has(item);
        if(i != -1){
            item = $(".json-list-item-"+i);
            item.addClass("json-item-flash");
            let previous = $(options.messageElement).html();
            $(options.messageElement).html(options.message).addClass("json-text-alert");
            setTimeout(() => {
                item.removeClass("json-item-flash");
                $(options.messageElement).html(previous).removeClass("json-text-alert");
            }, options.timeout);
        } else console.error("Alert unsuccessfull, cannot find item: ", item);
    }
    $.fn.jsonMenu = function(action, items, options){
        $(this).addClass("json-menu");
        if(!action) console.error("You need to provide an action in order to interact with the menu.");
        if(action == "add"){
            if(!items.header)
                console.error("This item hasn't got a header, collapsing will not work. "+items);
            if(!items.body)
                console.error("This item doesn't have a body, collapsing will not work. "+items);
            menu.body.push(items);
            draw($(this));
        } else if(action == "set"){
                menu = items;
                draw($(this));
        } else if(action == "remove"){
            remove(items);
        } else if(action == "clear"){
            menu = null;
            draw();
        } else if(action == "show"){
            show($(this), (items && items.speed)?items.speed:300);
        } else if(action == "hide"){
            hide($(this), (items && items.speed)?items.speed:300);
        } else if(action == "alert"){
            if(items == null){
                console.error("You need to send the alert item!");
            } else{
                if(!options){
                    console.error("You need to send alert message options first!");
                } else {
                    alert(items, options);
                }
            }

        }
        return this;
    }
 })( jQuery );