$(document).ready(function(event) {

	$("#tweet").submit(function(event){
		event.preventDefault();
		var form = this;
		$.post("/tweet", $(form).serialize(), function(response){

		});
	});

	$(document).ajaxStart(function () {
	    $("#tweet").children().attr("disabled", true);
	    $("#tweet").append("<p><img src=\"ajax-loader.gif\"/>Processing Tweet</p>");
	}).ajaxStop(function () {
	    $("#tweet p").replaceWith("<p style=\"color:green\">All Good!</p>");
	    $("#tweet").children().attr("disabled", false);
	    $("#tweet textarea").val("");
	    $("#tweet p").fadeOut(1500);
	});

});
