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
//= require turbolinks
//= require_tree .

$(document).ready(function(){
		// $('.load-more').click();
		// setTimeout(function() {
  //       trigger_load_more();
  //   },10);
		// setTimeout(function() {
  //       trigger_load_more();
  //   },100);
  //   setTimeout(function() {
  //       trigger_load_more();
  //   },200);
  //   setTimeout(function() {
  //       trigger_load_more();
  //   },300);
  //   setTimeout(function() {
  //       trigger_load_more();
  //   },500);
    
	if($.cookie("cookieValue") == null){
	    $.cookie("cookieValue", "0");  
	}
	var cookieValue = parseInt($.cookie("cookieValue"));
	$("#counter").text(cookieValue);

	$(".load-more").click(function(){
	    cookieValue++;
	    $.cookie("cookieValue", cookieValue, { path: '/' });
	    $("#counter").text(cookieValue);
	});

	if ($.cookie("cookieValue") && $.cookie("cookieValue") > 0){
		// alert($.cookie("cookieValue"));
		for (i = 0; i < cookieValue; i++) { 
				// alert(i);
				// $('.load-more').trigger('click');
				// $(".load-more").click();  					
				// setTimeout($('.load-more').click(), 3000);
				setTimeout(function() { trigger_load_more();},i*100);
		}
	}

	$("#reset").click(function(){
		if ($.cookie("cookieValue")){
			cookieValue = 0;
			$.cookie("cookieValue", cookieValue);
			$("#counter").text(cookieValue);
		} 
	});
    
	if(window.history && window.history.pushState) {
    // window.history.pushState('forward', null, './#forward');
    $(window).on('popstate', function() {
      // alert('Back button was pressed.');
    });

  }


function trigger_load_more(){
	if (cookieValue > 0) cookieValue--;
	$('.load-more').click();
}

});

