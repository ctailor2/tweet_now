$(document).ready(function(event) {

	$("#loading").hide();

	$("#username").submit(function(event){
		var form = this;
		event.preventDefault();
		var username = $(this).find("input").val();
		$.get("/" + username, function(response){
			$(".tweets").remove();
			$(form).append(response);
		});
	});

	$(document).ajaxStart(function () {
	    $("#loading").show();
	}).ajaxStop(function () {
	    $("#loading").hide();
	});
});
