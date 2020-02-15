function btnSubmit() {
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	// var code=document.getElementById("code").value;
	// var codeid=document.getElementById("codeID").value;
	if (username.length>0&&password.length>0){
		$.ajax(
			{
				type:"POST",
				url:"UserServlet?methodName=queryAccount",
				dataType:"text",
				data:{account:username,password:password},
				success:function (msg) {
					if (msg==="success"){
						alert("成功");
						console.log("success");
						window.location.href="/FourDemo/UserServlet?methodName=returnMain";
					} else{
						alert("登入失败，账号或者密码不正确");
						console.log("登入失败，账号或者密码不正确");
					}
				},
				error:function (msg) {
					alert(msg);
				}
			}
		);
	}else{
		alert("该账号已被禁用或删除，无法登录")
	}
}

// 生成验证码
function createCode(codeID) {
	var code = "";
	// 验证码长度
	var codeLength = 4;
	// 验证码dom元素
	var checkCode = $('#codeID');
	// 验证码随机数
	var random = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
		'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
	for (var i = 0; i < codeLength; i++) {
		// 随机数索引
		var index = Math.floor(Math.random() * 36);
		code += random[index];
	}
	// 将生成的随机验证码赋值
	checkCode.val(code);
}

function searchStateCallBack(msg) {
	var userMsg=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	if(msg==="启用"){
		$.ajax(
			{
				type:"POST",
				url:"RegServlet?methodName=queryaccount",
				dataType:"text",
				data:{account:userMsg,password:password},
				success:function (msg) {
					// alert(msg);
					if (msg==="success"){
						alert("登入成功");
						window.location.href="/PsychologyPlatform/LoginServlet?methodName=returnMain";
					} else{
						alert("登入失败，账号或者密码不正确");
					}
				},
				error:function (msg) {
					alert(msg);
				}
			}
		);
	}else{
		alert("该账号已被禁用或删除，无法登录")
	}
}