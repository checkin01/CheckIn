	$(function() {
		//datetimepicker
		$('input[name="checkinout"]').daterangepicker(
				{
					opens : 'left'
				},
				function(start, end, label) {
					console.log("A new date selection was made: "
							+ start.format('YYYY-MM-DD') + ' to '
							+ end.format('YYYY-MM-DD'));
				});

	});
	//<!-- 클릭시 이미지 fa fa-caret-up 이걸로 바뀜 -->
	function whenClickReview() {
		var upScroll = "<strong><i class='fa fa-caret-down' style='font-size:20px'></i> 리뷰</strong>";
		var downScroll = "<strong><i class='fa fa-caret-up' style='font-size:20px'></i> 리뷰</strong>";

		if ($("#reviewStatus").val() == 'up') {
			$("#showReview").html(downScroll);
			$("#reviewStatus").val('down');
			$("#review").css("display", "block");

		} else if ($("#reviewStatus").val() == "down") {
			$("#showReview").html(upScroll);
			$("#reviewStatus").val("up");
			$("#review").css("display", "none");

		}
	}
	