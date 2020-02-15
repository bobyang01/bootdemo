var basepath = $('#basepath').val();


layui.use(['form', 'layer', 'jquery'], function () {
    var layer = layui.layer;
    var form = layui.form;
    var $ = layui.jquery;

    $('#login').click(function () {
        var index = layer.open({
            type: 1,
            content: $('#loginface').html(),
            area: ['500px'],
            title: '前台登录页面',
            btn:['取消'],
	        success:function () {
		        form.render();
	        }
        });
	    form.on('submit(login)',function () {
		    // console.log(data.field);//获取提交的全部数据
		    if (true) {

			    var account = $('#login_account').val();
			    var password = $('#login_password').val();

			    $.ajax(
				    {
					    type: "POST",
					    url: basepath + "/user/dologin",
					    dataType: "json",
					    //发送的数据（同时也将数据发送出去）
					    data: {account: account,password:password},
					    success: function (msg) {
						    var res = msg.toString();
						    if (res == 'true'){
							   alert('登录成功');
							    window.location.href=basepath+"/jump/front/back";
						    }
						    if(res == 'nopwd'){
							    layer.msg('密码错误');
						    }
						    if(res == 'noname'){
							    layer.msg('用户名错误');
						    }
						    if(res == 'nostate'){
							    layer.msg('账户被禁用,请联系管理员');
						    }
						    if(res == 'del'){
							    layer.msg('账户被删除，请重新注册');
						    }
					    },
					    error: function (msg) {
						    alert("服务器正忙。。。。"+msg);
					    }
				    }
			    );
			    return false;
		    }})

    });
    $('#register').click(function () {
        layer.open({
            type: 1,
            content: $('#registerface').html(),
            area: ['500px'],
            title: '前台注册页面',
            btn:['取消'],
            success:function () {
                form.render();
            }
        });
	    //监听提交
	    form.on('submit(reg)',function (data) {
		    console.log(data.field);//获取提交的全部数据
		    $.ajax(
			    {
				    type:"POST",
				    url:basepath + "/user/doReg",
				    dataType:"text",
				    data:data.field,
				    success:function (msg) {
					    if (msg==="success"){
						    alert("注册成功");
						    console.log("success");
						    window.location.href=basepath+"/jump/front/welcome";
					    } else{
						    alert("账号已存在");
						    // console.log("登入失败，账号或者密码不正确");
					    }
				    },
				    error:function (msg) {
					    alert(msg);
				    }
			    }
		    );
			return false;
	    })

    });



});




function clientlogin() {
    var account = $("#loginAccount").val();
    var password = $("#loginPassword").val();
    $.post("/WDFXPT/ClientServlet?methodName=dologin", {
        loginAccount: account,
        loginPassword: password
    }, function (msg) {
        if (msg === "success") {
            alert("登录成功")
            // window.location.href = path;
        } else {
            alert("登录失败")
        }
    })
}
function clientreg() {
    var username = $("#account").val();
    var password = $("#password").val();
    var phone = $("#phone").val();
    var sexy = $("input[name='sexy']:checked").val();
    var education=request.getParameter("education");
    // var profession=request.getParameter("profession");

    alert(username+password+phone+sexy);
        // $.post("/WDFXPT/ClientServlet?methodName=doregister", {
        //     registerAccount: username,
        //     registerPassword: registerPassword,
        //     sexy: registersexy,
        //     registerPhone: registerPhone,
        // }, function (msg) {
        //     if (msg === "success") {
        //         alert("注册成功")
        //     } else if (msg === "cannot"){
        //         alert("该账户已被注册")
        //     } else {
        //         alert("注册失败")
        //     }
        // })
}

