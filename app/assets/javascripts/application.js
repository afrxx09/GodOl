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

var App = {
	
	Init : function(){
		console.log('asd');
		this.Toggle.init();
		this.Flash.init();
	},
	
	Toggle : {
		
		init : function(){
			$('.toggle-button').on('click', function(e){
				e.preventDefault();
				var toggle_container = $(this).data('toggle-container');
				$(toggle_container).toggle();
			});
		}
	},

	Flash : {
		init : function(){
			$('.alert .btn-close').on('click', function(e){
				e.preventDefault();
				var flash_container = $(this).closest('.alert');
				flash_container.fadeOut(250);
			});
		}
	}
};

$(document).ready(function(){App.Init();});
$(document).on('page:load', function(){App.Init();});