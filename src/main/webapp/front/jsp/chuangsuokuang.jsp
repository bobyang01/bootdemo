<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/9
  Time: 16:33
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
	<title>穿梭框组件</title>
	<link type="text/css" rel="stylesheet" href=<%=jsPath+"layui/css/layui.css"%>>
</head>
<body>
<div id="test1" ></div>
<script type="text/javascript" src=<%=jsPath + "layui/layui.js"%>></script>
<script>
	layui.use(['transfer', 'layer', 'util'], function(){
		var $ = layui.$
			,transfer = layui.transfer
			,layer = layui.layer
			,util = layui.util;

		//模拟数据
		var data1 = [
			{"value": "1", "title": "李白"}
			,{"value": "2", "title": "杜甫"}
			,{"value": "3", "title": "苏轼"}
			,{"value": "4", "title": "李清照"}
			,{"value": "5", "title": "鲁迅", "disabled": true}
			,{"value": "6", "title": "巴金"}
			,{"value": "7", "title": "冰心"}
			,{"value": "8", "title": "矛盾"}
			,{"value": "9", "title": "贤心"}
		]
		//渲染
		transfer.render({
			elem: '#test1'  //绑定元素
			,data:data1
			,id: 'demo1' //定义索引
		});
		//批量办法定事件
		util.event('lay-demoTransferActive', {
			getData: function(othis){
				var getData = transfer.getData('demo1'); //获取右侧数据
				layer.alert(JSON.stringify(getData));
			}
			,reload:function(){
				//实例重载
				transfer.reload('demo1', {
					title: ['列表一', '列表二']
					 // ,value: ['1', '2', '3','4', '5', '6','7', '8', '9']
					,value: []//列表二显示数据的value
					 ,showSearch: true//是否开启搜索框
				})
			}
		});
	});
</script>
<div class="layui-btn-container">
	<button class="layui-btn" type="button" lay-demotransferactive="getData">获取右侧数据</button>
	<button class="layui-btn" type="button" lay-demotransferactive="reload">重载实例</button>
</div>
</body>
</html>
