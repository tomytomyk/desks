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
	$('.no-login-select').on('click',function(){
		$('.no-login-box').css({'z-index': '5'});
		$('.login-box').css({'z-index': '2'});
		$('.signup-box').css({'z-index': '1'});
	});
    $('.login-select').on('click',function(){
		$('.no-login-box').css({'z-index': '2'});
		$('.login-box').css({'z-index': '5'});
		$('.signup-box').css({'z-index': '1'});
	});
	$('.signup-select').on('click',function(){
		$('.no-login-box').css({'z-index': '2'});
		$('.login-box').css({'z-index': '1'});
		$('.signup-box').css({'z-index': '5'});
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
	$('.user-edit-button').on('click',function(){
		$(this).blur();
		if($("#modal-overlay")[0]) return false ;
		$('body').append('<div class="modal-overlay"></div>');
		$('.modal-overlay').fadeIn("slow");
		$('.user-edit').fadeIn("slow");
	});
	$('.modal-overlay,.close-button').unbind().on('click',function(){
		$('.modal-overlay,.user-edit').fadeOut("slow");
		$('.modal-overlay').remove("");
	});
});