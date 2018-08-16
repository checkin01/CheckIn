$(function() {
	$(".droptype-item").click(function() {
		var Atype = $("#Atype").html();
		$("#Atype").html($(this).html());
		$("#Bottom-type").html($(this).html());
	});
});

