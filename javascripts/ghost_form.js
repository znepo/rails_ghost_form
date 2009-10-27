// Require jQuery - 1.3.2

$(document).ready(function() {
  $("form.ghosted_form").each(function(){
    $(this).submit(function(){
      $(".ghost").attr("value", "")
    });
    $(this).find(".ghost").each(function(){
      $(this).ghostForm();
    })
  });
});

$.fn.ghostForm = function(){
  var formElement = $(this);
  var ghost       = formElement.attr("value");
  
  formElement.focus(function(){
    var currentElement = $(this);
    var container = $(currentElement).parent();
    
    if (currentElement.attr("value") == ghost){
      currentElement.attr("value", "");
      currentElement.removeClass("ghost")
      
    }
    if (currentElement.hasClass("ghosted_password"))
    {
      $(currentElement).before("<input type=\"password\" name=\"" + currentElement.attr("name") + "\" class=\"" + currentElement.attr("class") + "\" + id=\"" + currentElement.attr("id") + "\" />");
      currentElement.remove();
      var newElement = $("#" + currentElement.attr("id"))
          newElement.removeClass("ghost")
          newElement.focus();
          
          newElement.blur(function(){
            var currentElement = $(this);
            var container = $(currentElement).parent();

            if ($.trim(currentElement.attr("value")) == ""){
              $(currentElement).before("<input type=\"text\" name=\"" + currentElement.attr("name") + "\" class=\"" + currentElement.attr("class") + "\" + id=\"" + currentElement.attr("id") + "\" />");
              currentElement.remove();
              
              newElement = $("#" + currentElement.attr("id"));
              newElement.attr("value", ghost);
              newElement.ghostForm();
            }
          });
    } 
    else 
    {
      formElement.blur(function(){
        var currentElement = $(this);
        if ($.trim(currentElement.attr("value")) == ""){
          currentElement.attr("value", ghost);
          currentElement.addClass("ghost");
        }
      })
    }
  });
}