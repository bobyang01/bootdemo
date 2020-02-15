<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/12/24
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String cssPath = application.getContextPath()+"/front/css/";
	String jsPath = application.getContextPath()+"/front/js/";
	String path = application.getContextPath();
	String jspPath =application.getContextPath()+"/front/jsp/";
%>
<html>
<head>
	<title>Title</title>
	<link type="text/css" rel="stylesheet" href=<%=jsPath+"layui/css/layui.css"%>>
	<link href ="favicon.ico" rel="shortcut icon">
</head>
<body>
<form class="layui-form" lay-filter="component-form-group" id="search_submits" onsubmit="return false">
	<div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="layadmin-useradmin-formlist">
		<div class="layui-inline">
			<label class="layui-form-label">账号：</label>
			<div class="layui-input-inline">
			<input type="text" class="layui-input" id="account" name="account" placeholder="用户名称"  width="80px">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">学历</label>
			<div class="layui-input-block">
				<select name="education" id="education" lay-filter="" lay-search>
					<option value="">选择</option>
					<option value="博士">博士</option>
					<option value="硕士">硕士</option>
					<option value="本科">本科</option>
					<option value="大专">大专</option>
					<option value="高中">高中</option>
				</select>
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">职业:</label>
			<div class="layui-input-block">
				<select name="profession" id="profession" lay-filter="" lay-search>
					<option value="">选择</option>
					<option value="工人">工人</option>
					<option value="农民">农民</option>
					<option value="商人">商人</option>
					<option value="自由职业">自由职业</option>
				</select>
			</div>
		</div>
		<div class="layui-inline">
			<button class="layui-btn" lay-submit="search_submits" lay-filter="search">查询</button>
		</div>
	</div>
</form>
<table id="demo" lay-filter="test"></table>
<script type="text/javascript" src=<%=jsPath + "jquery-3.4.1.js"%>></script>
<script type="text/javascript" src=<%=jsPath + "layui/layui.js"%>></script>
<%--<script type="text/javascript" src=<%=jsPath+"backtable.js"%>></script>--%>
<script type="text/javascript" src="<%=jsPath+"json2.js"%>"></script>
<script src=<%=jsPath + "layui/layui.js"%>></script>
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
	layui.use(['form', 'layer', 'jquery','table'], function(){
		var table = layui.table;
		var layer = layui.layer;
		var form = layui.form;
		var $ = layui.jquery;
		//第一个实例
		table.render({
			elem: '#demo'
			,height: 300
			,url: "<%=path+"/user/doSearch"%>" //数据接口
			,page: true //开启分页
			,limit:5
			,limits:[5,10,20,50,100]
			,cols: [[ //表头
				{field: 'clientid', title: '序号', width:100, sort: true, fixed: 'left'}
				,{field: 'account', title: '账号', width:100}
				,{field: 'sexy', title: '性别', width:100}
				,{field: 'education', title: '学历', width:100}
				,{field: 'profession', title: '职业', width: 100}
				,{field: 'phone', title: '手机号码', width: 200, sort: true}
				,{field: 'email', title: '邮箱', width: 300, sort: true}
				,{field: 'regtime', title: '注册时间', width: 300,sort: true}
				,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
			]]
			//设置查询刷新的ID
			,id:'table1'
		});

		form.on('submit(search)', function (data) {
			var account = $('#account').val();
			var education = $('#education').val();
			var profession = $('#profession').val();
			alert(account+education+profession);

			table.reload('table1',{
				url:"<%=path+"/user/doSearch"%>"
				,where: { //设定异步数据接口的额外参数，任意设
					account:account,
					education:education,
					profession:profession
				}
				,page: {
					curr: 1 //重新从第 1 页开始
				}
			});
		});
		//监听头工具栏事件
		table.on('toolbar(test)', function(obj){
			var checkStatus = table.checkStatus(obj.config.id)
				,data = checkStatus.data; //获取选中的数据
			switch(obj.event){
				case 'add':
					layer.msg('添加');
					break;
				case 'update':
					if(data.length === 0){
						layer.msg('请选择一行');
					} else if(data.length > 1){
						layer.msg('只能同时编辑一个');
					} else {
						layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
					}
					break;
				case 'delete':
					if(data.length === 0){
						layer.msg('请选择一行');
					} else {
						layer.msg('删除');
					}
					break;
			};
		});

		//监听行工具事件
		table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
				,layEvent = obj.event; //获得 lay-event 对应的值
			if(layEvent === 'detail'){
				layer.msg('查看操作');
			} else if(layEvent === 'del'){
				layer.confirm('真的删除行么', function(index){

					var account =data.account;//data.XXX 后缀直接写需要取值的名称与表头给的field一致
					alert(account);
					$.ajax({
						type:"post",
						url:"<%=path+"/user/doDelete"%>",
						//预期服务器返回的数据类型;
						datatype:"text",
						//从该js会发出到服务器的数据
						data:{account:account},
						//从servlet接收的数据
						success:function (msg) {
							if (msg === 'success') {
								alert("删除成功！");
								window.location.reload();
							} else {
								layer.msg("删除失败！")
							}
						}
						,error:function () {
							alert("服务器正忙.....");
						}
					});
					layer.close(index);
				});
			} else if(layEvent === 'edit'){
				layer.msg('编辑操作');
			}
		});
	});
</script>
</body>
</html>

