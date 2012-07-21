jQuery.fn.textCheck = function(options){
	var defaults = {
			text: this.val()
		}, 	opts = $.extend(defaults, options);	
		
		//this.val(opts['text']);
		
		this.focus(function() {
			if($(this).val() == opts['text']) $(this).val('');
		});
		
		this.blur(function() {
			if($(this).val() == '') {
				$(this).val(opts['text']);
			}
		});
};