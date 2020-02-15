
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = application.getContextPath();
	String  cssPath = application.getContextPath()+ "/front/css/";
	String  jsPath = application.getContextPath()+ "/front/js/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>上传文档</title>
	<link rel="stylesheet" href=<%=jsPath+"layui/css/layui.css"%> >
	<script type="text/javascript" src="<%=jsPath+"jquery-3.4.1.js"%>"></script>
	<script src=<%=jsPath+"layui/layui.js"%> charset="utf-8"></script>
</head>
<body>
<form class="layui-form" method="post">
	<div class="layui-form-item">
		<label class="layui-form-label" style="margin-top: -4%;margin-left: 21%;font-size: 17px;">文档标题</label>
		<div class="layui-input-block" style="margin-left: 30%;margin-top: -4%;position: absolute;width: 21.6%;">
			<input type="text" name="document_title" id="document_title" required="" lay-verify="required" placeholder="请输入文档标题" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item layui-form-text" style="position: absolute;margin-left: 21.7%;">
		<label class="layui-form-label" style="font-size: 17px;margin-left: -3%;">文档简介</label>
		<div class="layui-input-block" style="width: 98%;">
			<textarea name="description" id="description" placeholder="请输入内容" class="layui-textarea"></textarea>
		</div>
	</div>

	<div style="margin-left: 12%;margin-top: 12%;">
		<table id="demo" lay-filter="test"></table>
	</div>
	<button type="button" class="layui-btn" id="test2" style="position: absolute;margin-left: 45%;margin-top: 9%;">
		<i class="layui-icon"></i>浏览文档
	</button><input class="layui-upload-file" type="file" accept="" name="file">
	<div class="layui-form-item">
		<label class="layui-form-label" style="margin-top: 9%;margin-left: 17%;font-size: 17px;width: 10%;">请选择上传文档</label>
		<div class="layui-input-block" style="margin-left: 30%;margin-top: 9%;position: absolute;width: 12%;">
			<input type="text" name="file"  required="" lay-verify="required" placeholder="文档名称" readonly="" id="filename" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-input-block" style="margin-top: 1%;margin-left: 21%;font-size: 17px;">下载积分</label>
		<div class="layui-input-inline" style="margin-left: 4%;position: absolute;width: 21.6%;">
			<select name="download_integral" id="download_integral" lay-verify="required" lay-filter="test">
				<option value="">请选择</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
			</select><div class="layui-unselect layui-form-select"><div class="layui-select-title"><input type="text" placeholder="请选择" value="" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div><dl class="layui-anim layui-anim-upbit"><dd lay-value="" class="layui-select-tips">请选择</dd><dd lay-value="无" class="">无</dd><dd lay-value="在校" class="">在校</dd><dd lay-value="教师" class="">教师</dd><dd lay-value="警察" class="">警察</dd><dd lay-value="工人" class="">工人</dd><dd lay-value="商人" class="">商人</dd><dd lay-value="其他" class="">其他</dd></dl></div>
		</div>
	</div>
	<button type="button" class="layui-btn" style="margin-left: 30%;margin-top: 3%;position: absolute;" id="bb">提交</button>
	<button type="button" class="layui-btn" style="position: absolute;visibility: hidden" id="btn">提交</button>
	<button type="button" class="layui-btn" style="position: absolute;margin-top: 3%;margin-left: 45%;" id="return">返回</button>
	<script>
		layui.use(['form','layer','jquery','upload'], function(){
			var upload = layui.upload;
			var form = layui.form;
			var $ = layui.jquery;
			var layer  = layui.layer;
			//执行实例
			upload.render({
				elem: '#test2' //绑定元素
				,url: '<%=path+"/user/uploadfile"%>' //上传接口
				,multiple:false //设置是否多文件上传
				,auto: false  //取消自动上传，并指定提交按钮进行上传
				,bindAction: '#btn' //这个绑定id为btn的按钮触发这个提交
				,accept: 'file' //允许上传的文件类型
				,before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
					this.data = {
						downloadIntegral: $("#download_integral").val(),
						documentTitle: $("#document_title").val(),
						description: $("#description").val()
					}
				}
				,choose: function (obj) {
					var files = this.files = obj.pushFile();//需要上传的这个文档对象
					obj.preview(function (index, file, result) {
						$("#filename").val(file.name);　
					})
				}
				,done: function(res){
					if (res==0) {
						$("#description").val("");
						$("#document_title").val("");
						$("#filename").val("");
						layer.msg("成功上传");
					}else if(res==1){
						layer.msg("上传失败，该文档标题已经存在");
					}
				}
				,error: function(){
					//请求异常回调
				}
			});
		});
		// 点击返回按钮操作
		$('#return').click(
			function () {
				var returnpmain = document.createElement("a");
				returnpmain.href='<%=path+"/jump/front/back"%>';
				returnpmain.click();
			}
		);
		$('#bb').click(
			function () {
				var filetitle=document.getElementById("document_title").value;
				var file=document.getElementById("filename").value;
				var description=document.getElementById("description").value;
				var integral=document.getElementById("download_integral").value;
				if(filetitle==""||file==""||description==""||integral==""){
					layer.alert("尊敬的用户，请填写完整内容", { icon: 2, offset: "right", time:30000 });
				}else{
					var a=document.getElementById("btn");
					a.click();
				}
			}
		);
	</script>
</form>

</body>
</html>