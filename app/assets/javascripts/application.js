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
	$(document).on('click','body',function(){
		$('.top-text').fadeIn(5);
		$('.top-text').animate({'width':'750px'},1000);
	});
	$(document).on('keydown',window,function(e){
		if(e.keyCode === 37){
		$('.edit-cursor').animate({'left':'-=3px'},1);{
			    $('.a').val($('.edit-cursor').position().left);
		    }
	    }
		if(e.keyCode === 38){
		$('.edit-cursor').animate({'top':'-=3px'},1);{
			    $('.b').val($('.edit-cursor').position().top);
		    }
        }
		if(e.keyCode === 39){
		$('.edit-cursor').animate({'left':'+=3px'},1);{
			    $('.a').val($('.edit-cursor').position().left);
		    }
        }
		if(e.keyCode === 40){
		$('.edit-cursor').animate({'top':'+=3px'},1);{
			    $('.b').val($('.edit-cursor').position().top);
		    }
	    }
		if(e.keyCode === 188){
		$('.edit-cursor').animate({'height':'200px'},{queue: false}).animate({'width':'200px'},{queue: false});{
			    $('.c').val($('.edit-cursor').width());
			    $('.a').val($('.edit-cursor').position().left);
			    $('.b').val($('.edit-cursor').position().top);
		    }
		}
		if(e.keyCode === 190){
		$('.edit-cursor').animate({'height':'0%'},{queue: false}).animate({'width':'0%'},{queue: false});{
			    $('.c').val($('.edit-cursor').width());
			    $('.a').val($('.edit-cursor').position().left);
			    $('.b').val($('.edit-cursor').position().top);
		    }
        }
	});
	$(document).on('keyup',window,function(e){
		if(e.keyCode === 37){
		$('.edit-cursor').stop();}
		if(e.keyCode === 38){
		$('.edit-cursor').stop();}
		if(e.keyCode === 39){
		$('.edit-cursor').stop();}
		if(e.keyCode === 40){
		$('.edit-cursor').stop();}
		if(e.keyCode === 188){
		$('.edit-cursor').stop();}
		if(e.keyCode === 190){
		$('.edit-cursor').stop();}
	});

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
	$(document).on('mouseover','.nav-list',function(){
		$(this).css({'background-color': 'yellow'});
	});
	$(document).on('mouseout','.nav-list',function(){
		$(this).css({'background-color': ''});
	});
	$(document).on('mouseover','.nav-list',function(){
		if($(this).hasClass('language')){
			$('.language-list').css('display', 'block');
		} else if($(this).hasClass('occupation')){
			$('.occupation-list').css('display', 'block');
		}
		$('.list').hover(function(){
			if($(this).hasClass('language-list')){
				$('.language-list').css('display', 'block');
				$('.occupation-list').css('display', 'none');
			} else if($(this).hasClass('occupation-list')){
				$('.occupation-list').css('display', 'block');
				$('.language-list').css('display', 'none');
			}
		});
	});
	$(document).on('mouseout','.nav-list',function(){
	    $('.list').hover(function(){
		}, function(){
		    $('.list').css('display', 'none');
		})
	    $('.list').css('display', 'none');
	});
    $(document).on('click', '.modal-overlay,.close-sub-report-button',function(){
		$('.modal-overlay,.sub-report-form,.session-follow-info,.user-edit,.session-follower-info,.value-show,.user-follow-index,.user-follower-index,.view-history-info,.image-render').fadeOut("slow");
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
	    	} else if($(this).hasClass('user-follow')){
	    		$('.user-follow-index').fadeIn("slow");
	    	} else if($(this).hasClass('user-follower')){
	    		$('.user-follower-index').fadeIn("slow");
	    	} else if($(this).hasClass('view-history')){
	    		$('.view-history-info').fadeIn("slow");
	    	} else if($(this).hasClass('image-edit')){
	    		$('.image-render').fadeIn("slow");
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