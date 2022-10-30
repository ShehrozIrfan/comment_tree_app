$(document).on('turbolinks:load', function() {
	//Adding the bootstrap classes on pagination buttons.
  $('.pagination li').addClass('page-item')
  $('.pagination span').addClass('page-link')
  $('.pagination a').addClass('page-link')
	//Adding classes to active
	$('.pagination em').addClass('page-link bg-primary text-white')
})
