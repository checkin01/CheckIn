/**
 * 
 */
// modal 창 띄우기
	$(function() {
		$(".showreviewModal").click(function() {
			$('#reviewModal').modal('show');
		});
		
		$(".showreviewModal_edit").click(function() {
			$('#reviewModal_edit').modal('show');
		});
	});