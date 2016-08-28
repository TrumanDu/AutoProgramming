$.validator.setDefaults({
	errorElement: 'span',
    errorClass: 'help-block',
    focusInvalid: false,
    invalidHandler: function(event, validator) { 
    	//$('.alert-success', $('#loginForm')).hide();
    	//$('.alert-danger', $('#loginForm')).show();
    },

    errorPlacement: function(error, element) {
    	//error.insertAfter(element.closest('.input-icon'));
      
    	var icon = $(element).parent('.input-icon').children('i');
    	icon.removeClass('fa-check').addClass("fa-warning");  
    	icon.attr("data-original-title", error.text()).tooltip({'container': 'body'});
    },
    
    highlight: function(element) {
    	$(element).closest('.form-group').addClass('has-error');
    },
    
    unhighlight: function (element) { 
    	$(element).closest('.form-group').removeClass('has-error');
    },

    success: function(label,element) {
    	//label.closest('.form-group').removeClass('has-error');
      
    	var icon = $(element).parent('.input-icon').children('i');
    	$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
    	icon.removeClass("fa-warning").addClass("fa-check");
    },

    submitHandler: function() {
      //alert("提交事件!");
    }
});