// 联系电话(手机/电话皆可)验证
jQuery.validator.addMethod("phone", function(value,element) {
	
	var length = value.length;
	var mobile = /^1[3|4|5|7|8]\d{9}$/;
	var tel = /^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/;
	
	return this.optional(element) || (tel.test(value) || mobile.test(value));
}, "请填写正确的联系电话");