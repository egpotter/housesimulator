// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap

//= require best_in_place.purr
//= require best_in_place
//= require jquery_nested_form
//= require_tree .


jQuery(document).on('ajax:error', function(event, request, error) {
// Display all error messages from server side validation
	jQuery.each(jQuery.parseJSON(request.responseText), function(index, value) {
	if( typeof(value) == "object") {value = index + " " + value.toString(); }
	var container = jQuery("<span class='flash-error'></span>").html(value);
		container.purr({ fadeInSpeed: 300,fadeOutSpeed: 300,removeTimer: 1000 });
	});
}); 

	
function poll(){
$.ajax({ url: "/reload", 
	complete: function(){
		setTimeout(poll, 5000);
	}, 
	timeout: 4000 });
};

function weaken(id){
	setTimeout(function(){
 		$("div[data-device-room-id='"+id+"']").removeClass('changed');
 	}, 30000);
}


function changeDevice(id, html){
	$("div[data-device-room-id='"+id+"']").replaceWith(html);
	$("div[data-device-room-id='"+id+"']").addClass('changed');
	// console.log(id)
	// console.log(html)
	weaken(id)
}
jQuery(document).ready(function($){
	$('.navigation_forms a').on('click', function(e){
		$(this).tab('show');
	})
})