// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery_ujs
$(function() {
	$(document).on("ajax:success", ".new_item", function(e) {
		var a = "idは" + e.detail +"です"
		$('.add-item').html(a);
	})

	$(document).on('click','.no-login-select',function(){
		$('.no-login-box').css({'display': 'block'});
		$('.login-box').css({'display': 'none'});
		$('.signup-box').css({'display': 'none'});
	});
    $(document).on('click','.login-select',function(){
		$('.no-login-box').css({'display': 'none'});
		$('.login-box').css({'display': 'block'});
		$('.signup-box').css({'display': 'none'});
	});
	$(document).on('click','.signup-select',function(){
		$('.no-login-box').css({'display': 'none'});
		$('.login-box').css({'display': 'none'});
		$('.signup-box').css({'display': 'block'});
	});
	$('header').animate({'width': '15%'}, 2000);
	$('.nav-list').mouseover(function(){
		$(this).css({'background-color': '#e9bc00'});
		$(this).animate({'width': '150%'}, 80);
	});
	$('.nav-list').mouseout(function(){
		$(this).css({'background-color': ''});
		$(this).animate({'width': '100%'}, 80);
	});
    $(document).on('click', '.modal-overlay,.close-sub-report-button',function(){
		$('.modal-overlay,.sub-report-form,.session-follow-info,.user-edit,.session-follower-info,.value-show').fadeOut("slow");
		$('.modal-overlay').remove("");
	});
	$(document).on('click', '.button',function(){
	    $(this).blur();
		if($("#modal-overlay")[0]) return false ;
		$('body').append('<div class="modal-overlay"></div>');
		$('.modal-overlay').fadeIn("slow");
	    	if($(this).hasClass('session-follow')){
	    		$('.session-follow-info').fadeIn("slow");
	    	} else if($(this).hasClass('sub-report-button')){
	    	    $('.sub-report-form').fadeIn("slow");
	    	} else if($(this).hasClass('user-edit-button')){
	    		$('.user-edit').fadeIn("slow");
	    	} else if($(this).hasClass('session-follower')){
	    		$('.session-follower-info').fadeIn("slow");
	    	}
	});
	$(document).on('mouseover','.session-follow',function(){
		$(this).css({'background-color': 'red','cursor': 'pointer'});
	});
    $(document).on('mouseout','.session-follow',function(){
		$(this).css({'background-color': ''});
	});
	$(document).on('mouseover','.session-follower',function(){
		$(this).css({'background-color': 'red','cursor': 'pointer'});
	});
    $(document).on('mouseout','.session-follower',function(){
		$(this).css({'background-color': ''});
	});
});