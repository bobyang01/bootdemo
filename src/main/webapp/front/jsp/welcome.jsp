<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/12/29
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String cssPath = application.getContextPath()+"/front/css/";
	String jsPath = application.getContextPath()+"/front/js/";
	String path = application.getContextPath();
	String jspPath =application.getContextPath()+"/front/jsp/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>layui在线调试</title>
	<link type="text/css" rel="stylesheet" href=<%=jsPath+"layui/css/layui.css"%>>
	<style>
		body {
			width: 100%;
			height: 500px;
		}

		#layout {
			width: 40%;
			height: 350px;
			margin: auto;
			margin-top: 100px;
			border: #9F9F9F solid 1px;
		}

		#info {
			height: 70px;
			border: #9F9F9F solid 1px;
		}

		#btgroup {
			margin-top: 20px;
			margin-left: 370px;

		}
		#search{
			margin-top: 40px;
			margin-left: 120px;
		}
		#layout1,#layout2{
			padding-right: 30px;
		}
		#btgrouplogin,#btgroupreg{
			margin-left: 180px;
		}
	</style>

</head>
<body>
<input type="hidden" value="<%=path%>" id="basepath">
<div id="layout">
	<div class="layui-form-item" id="info">
		<div class="layui-input-block" id="btgroup">
			<button class="layui-btn layui-btn-radius layui-btn-normal" id="login">登录</button>
			<button  class="layui-btn layui-btn-radius layui-btn-normal" id="register">注册</button>
		</div>
	</div>
	<div class="layui-form-item" id="search">
		<div class="layui-input-inline">
			<input type="text" name="title" required lay-verify="required" placeholder="请输入文档名" autocomplete="off"
			       class="layui-input">
		</div>
		<div>
			<button class="layui-btn layui-btn-radius  layui-btn-primary">搜索文档</button>
		</div>
	</div>
</div>
<script type="text/html" id="loginface">
	<div id="layout1">
		<form class="layui-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名:</label>
				<div class="layui-input-block">
					<input type="text" id="login_account" name="account" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
					       class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码:</label>
				<div class="layui-input-block">
					<input type="password" id="login_password" name="password" required lay-verify="required" placeholder="请输入密码"
					       autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">验证码:</label>
				<div class="layui-input-inline">
					<input type="password" name="" required lay-verify="required" placeholder="请输入密码"
					       autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid">
					<img src="" alt="" style="width:70px;height: 30px;  border: #4E5465 solid 1px">
					<a href="javascript:void(0);">点击刷新</a>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block" id="btgrouplogin">
					<button class="layui-btn" lay-submit lay-filter="login">登录</button>
					<button type="reset" class="layui-btn layui-btn-primary">返回</button>
				</div>
			</div>
		</form>
	</div>
</script>
<script type="text/html" id="registerface">
	<div id="layout2">
		<form class="layui-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名:</label>
				<div class="layui-input-block">
					<input id="account" type="text" name="account" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
					       class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码:</label>
				<div class="layui-input-block">
					<input id="password" type="password" name="password" required lay-verify="required" placeholder="请输入密码"
					       autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">重复输入:</label>
				<div class="layui-input-block">
					<input id="password2" type="password" name="password2" required lay-verify="required" placeholder="请输入密码"
					       autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别:</label>
				<div class="layui-input-block">
					<input type="radio" name="sexy" value="男" title="男">
					<input type="radio" name="sexy" value="女" title="女" checked>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">学历:</label>
				<div class="layui-input-block">
					<select  name="education" lay-verify="required">
						<!--                    <option value=""></option>-->
						<option value="博士">博士</option>
						<option value="硕士">硕士</option>
						<option value="本科">本科</option>
						<option value="大专">大专</option>
						<option value="高中">高中</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">职业:</label>
				<div class="layui-input-block">
					<select name="profession" lay-verify="required">
						<option value="工人">工人</option>
						<option value="农民">农民</option>
						<option value="商人">商人</option>
						<option value="自由职业">自由职业</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机:</label>
				<div class="layui-input-block">
					<input id="phone" type="tel" name="phone" required lay-verify="phone" placeholder="请输入手机"
					       autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">E-mail:</label>
				<div class="layui-input-block">
					<input type="email" name="email" required lay-verify="email" placeholder="请输入邮箱"
					       autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block" id="btgroupreg">
					<button class="layui-btn" lay-submit lay-filter="reg">注册</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>
</script>

<script src=<%=jsPath + "jquery-3.4.1.js"%>></script>
<script src=<%=jsPath + "layui/layui.js"%>></script>
<script src="<%=jsPath+"json2.js"%>"></script>
<script src="<%=jsPath+"Front_WelcomeFace.js"%>"></script>
<script>
	var basePath = "<%=jsPath%>";
</script>
</body>
</html>
