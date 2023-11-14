//Text-field writing limitation script

//The plugin accepts an ID of a feedback element, the limit of characters, and any textual addon you wish to append to the counter;
//This plugin is also chainable, so you can use it with any other.

(function ( $ ) {
 
    $.fn.writeLimit = function(feedback, limit, addon) {
        if(feedback instanceof jQuery){
            console.log("Please deliver a feedback field with a jQuery object type.");
            return this;
        } else if(limit === undefined){
            console.log("Please deliver a limit of characters.");
            return this;
        } else if(addon === undefined){
            var addon = "";
        }

        //We are clear, so let's proceed

        //Checking for changes in case someone copy/pastes and does not write.
        $(this).change(function(){
            var value = $(this).val();
            var length = value.length;



            if(length > limit){
                //Delete the excess characters and change the value

                $(this).val(value.substr(0, limit));
                $(feedback).html(length+"/"+limit+" "+addon);

            } else {
                //Check the length and edit the input field

                $(feedback).html(length+"/"+limit+" "+addon);
            }
        });

        //We also want it to be active, so we will check everytime someone writes
        $(this).keyup(function(){
            var value = $(this).val();
            var length = value.length;



            if(length > limit){
                //Delete the excess characters and change the value

                $(this).val(value.substr(0, limit));
                $(feedback).text(length+"/"+limit+" "+addon);

            } else {
                //Check the length and edit the input field

                $(feedback).text(length+"/"+limit+" "+addon);
            }
        });

        return this;
    };
 
}( jQuery ));