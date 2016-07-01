/*
 * 使用方法很简单：
 * 比如某个输入域必须经过邮箱验证，那么它的class带上email即可，比如
 * <input type="text" name="userEmail" id="userEmail" class="userEmail email" />
 */
var FieldValidation = {
	rules : { // 验证规则class名称
		required : /./, // 必填
		requiredNotWhiteSpace : /\S/, // 单个非空白字符
		positiveInteger : /^\d*[1-9]\d*$/, // 正整数
		positiveOrZeroInteger : /^\d+$/, // 正整数或0
		integer : /^-?\d+$/, // 整数
		decimal : /^-?\d+(.\d+)?$/, // 整数和小数
		email : /^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]+$/,//邮箱
		tel:/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/,//电话号码
		code:/^[1-9]\d{5}$/,//邮政编码
		idCard:/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/,
		pwd:/^[a-zA-Z0-9_-]{6,16}$/,
		title:/^[\u4e00-\u9fa5\w]{1,20}$/
	},
	errors : { // 验证失败时的错误提示信息
		required : "不能为空",
		requiredNotWhiteSpace : "不能为空白",
		positiveInteger : "必须为正整数",
		positiveOrZeroInteger : "必须为非负整数",
		integer : "必须为整数",
		decimal : "必须为数字",
		email : "邮箱格式不正确",
		tel:"手机号格式不正确",
		code:"邮编格式不正确",
		idCard:"身份证格式不正确",
		pwd:"密码格式不正确",
		title:"长度超过20个字符"
	},
	validate : function(form) {
		var result = true;
		$(form).find('input').each(
				function() {
					field = $(this);
					var elementId = $(field).prev().html();
					var classRegExp = /(^|\b)(\S+)(\b|$)/g; // 匹配类
					var className = $(field).attr("class");
					var classResult;
					while (classResult = classRegExp.exec(className)) {
						var ruleClass = classResult[2]; // 这里之所以取[2]，是因为[0]是完整匹配userEmail
						var rule = FieldValidation.rules[ruleClass];
						if (typeof rule != "undefined") { // 命中验证规则class
							if (!rule.test($(field).val())) {
								field.focus();
								asyncbox.error(elementId
										+ FieldValidation.errors[ruleClass],
										'提示');
								result = false;
								break;
							}
						}
					}
					return result;
				});
		return result;
	},
	validate2 : function(form) {
		var result = true;
		$(form).find('input').each(
				function() {
					field = $(this);
					var elementId = $(field).parents('td').prev('td').html();
					var classRegExp = /(^|\b)(\S+)(\b|$)/g; // 匹配类
					var className = $(field).attr("class");
					var classResult;
					while (classResult = classRegExp.exec(className)) {
						var ruleClass = classResult[2]; // 这里之所以取[2]，是因为[0]是完整匹配userEmail
						var rule = FieldValidation.rules[ruleClass];
						if (typeof rule != "undefined") { // 命中验证规则class
							if (!rule.test($(field).val())) {
								field.focus();
								asyncbox.error(elementId
										+ FieldValidation.errors[ruleClass],
										'提示');
								result = false;
								break;
							}
						}
					}
					return result;
				});
		return result;
	},
	validate3 : function(form) {
		var result = true;
		$(form).find('input').each(
				function() {
					field = $(this);
					var elementId = $(field).attr("data-alert");
					var classRegExp = /(^|\b)(\S+)(\b|$)/g; // 匹配类
					var className = $(field).attr("class");
					var classResult;
					while (classResult = classRegExp.exec(className)) {
						var ruleClass = classResult[2]; // 这里之所以取[2]，是因为[0]是完整匹配userEmail
						var rule = FieldValidation.rules[ruleClass];
						if (typeof rule != "undefined") { // 命中验证规则class
							if (!rule.test($(field).val())) {
								field.focus();
								asyncbox.error(elementId
										+ FieldValidation.errors[ruleClass],
										'提示');
								result = false;
								break;
							}
						}
					}
					return result;
				});
		return result;
	}
};