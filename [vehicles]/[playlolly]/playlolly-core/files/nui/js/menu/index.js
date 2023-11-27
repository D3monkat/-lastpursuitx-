let buttonParams=[];const openMenu=(data=null)=>{let html="";data.forEach((item,index)=>{let header=item.header;let message=item.text;let isMenuHeader=item.isMenuHeader;let isDisabled=item.disabled;let icon=item.icon;let input=item.input;let submitHeader=item.submitHeader;let submitIcon=item.submitIcon;html+=getButtonRender(header,message,index,isMenuHeader,isDisabled,icon,input,submitHeader,submitIcon);if(item.params)buttonParams[index]=item.params});$("#menu-buttons").html(html);$(".menu-button").click(function(){const target=$(this);const inputElement=document.getElementById("menu-input");let inputValue="";if(inputElement){inputValue=inputElement.value}if(!target.hasClass("menu-title")&&!target.hasClass("menu-disabled")){postData(target.attr("id"),inputValue)}})};const getButtonRender=(header,message,id,isMenuHeader,isDisabled,icon,input,submitHeader,submitIcon)=>{const menuIsDisabled=isDisabled?"menu-disabled":"";let buttonHtml="";let inputHtml="";let submitHtml="";if(input){const inputPlaceholder=input.placeholder?input.placeholder:"";inputHtml=`<input type="${input.type}" required name="${input.name}" class="menu-row menu-input" id="menu-input" placeholder="${inputPlaceholder}">`;if(input.type==="number"){if(input.min){inputHtml=inputHtml.replace(">",` min=${input.min}>`)}if(input.max){inputHtml=inputHtml.replace(">",` max=${input.max}>`)}}else if(input.type==="text"){if(input.minlength){inputHtml=inputHtml.replace(">",` minlength=${input.minlength}>`)}if(input.maxlength){inputHtml=inputHtml.replace(">",` maxlength=${input.maxlength}>`)}}submitHtml=`
      <div class="menu-row menu-button menu-input-button" id="${id}">
          <div class="menu-icon"> <i class="${submitIcon}" onerror="this.onerror=null; this.remove();"></i> </div>
          <div class="menu-column">
            <div class="menu-header">${submitHeader}</div>
          </div>
      </div>
    `}else{buttonHtml=`
      <div class="menu-row ${isMenuHeader?"menu-title":"menu-button"} ${menuIsDisabled}" id="${id}">
          <div class="${!isMenuHeader&&"menu-icon"}"> <i class="${icon}" onerror="this.onerror=null; this.remove();"></i> </div>
          <div class="menu-column">
          <div class="menu-header">${header}</div>
          ${message?`<div class="menu-text">${message}</div>`:""}
          </div>
      </div>`}return`
        ${buttonHtml}
        ${inputHtml} 
        ${submitHtml}
    `};const closeMenu=()=>{$("#menu-buttons").html(" ");buttonParams=[]};const postData=(id,value)=>{$.post(`https://${GetParentResourceName()}/clickedButton`,JSON.stringify({buttonId:parseInt(id)+1,inputValue:value}));return closeMenu()};const cancelMenu=()=>{$.post(`https://${GetParentResourceName()}/closeMenu`);return closeMenu()};window.addEventListener("message",event=>{const data=event.data;const buttons=data.data;const action=data.action;switch(action){case"OPEN_MENU":return openMenu(buttons);case"CLOSE_MENU":return closeMenu();default:return}});document.onkeyup=function(event){const charCode=event.key;if(charCode=="Escape"){cancelMenu()}};