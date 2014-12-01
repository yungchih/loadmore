// when the page is ready for manipulation
$(function(){
	    // when the load more event link is clicked
    $('a.load-more-events').click(function(e){
        // prevent the default click action
        e.preventDefault();

        // hide load more event link
        $('.load-more-events').hide();

        // show loading gif
        $('.loading-gif').show();

        // alert($(this).attr('href'));

        // get the last id and save it in a variable 'last-id'
        var last_id = $('.record').last().attr('data-id');

        // alert(last_id);
        $.ajax({
        	// make a get request to the server
        	type: "GET",
        	// get the url from the href attribute of our link
        	url: "/events/cached_events",
        	// send the last id to our rails app
        	data: {id: last_id},
        	// the response will be a script
        	// dataType: "script",

        	// upon success
        	success: function(data){

        		$('.container').append(data);
        		// hide the loading gif
        		$('.loading-gif').hide();
        		// show our load more link
        		$('.load-more-events').show();
        	}
        });

    });
});