$(document).on('submit', '#replyModalForm', function(e) {
	e.preventDefault();

	//converting the form data to key-value pairs
	var data = $('#replyModalForm').serializeArray().reduce(function(obj, item) {
    obj[item.name] = item.value;
    return obj;
	}, {});

	$.ajax({
		url: '/comments/reply',
		method: 'POST',
		data: { data }
	}).done(function(data) {
		if(data.errors) {
			$('.reply-modal-errors').html(`
			<div class="alert alert-danger">The form contains following errors:</div>
			<ul class="text-danger">
				${data.errors.map((item) => (`<li>${item}</li>`))}
			</ul>
		`)

		$('#replyModalSubmitBtn').removeAttr('disabled')
		}
	}).fail(function(e) {
		console.log("error")
	})
})
