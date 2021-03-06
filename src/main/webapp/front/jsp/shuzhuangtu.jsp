<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/9
  Time: 17:06
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
	<title>Layui</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link type="text/css" rel="stylesheet" href=<%=jsPath+"layui/css/layui.css"%>  media="all">
	<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
	<legend>基本演示</legend>
</fieldset>
<div class="layui-btn-container">
	<button class="layui-btn layui-btn-sm" type="button" lay-demo="getChecked">获取选中节点数据</button>
	<button class="layui-btn layui-btn-sm" type="button" lay-demo="setChecked">勾选指定节点</button>
	<button class="layui-btn layui-btn-sm" type="button" lay-demo="reload">重载实例</button>
</div>

<div class="demo-tree-more" id="test12"></div>

<script type="text/javascript" src=<%=jsPath + "layui/layui.js"%>></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
	layui.use(['tree', 'util'], function(){
		var tree = layui.tree
			,layer = layui.layer
			,util = layui.util

			//模拟数据
			,data = [{
				title: '一级1'
				,id: 1
				,field: 'name1'
				,checked: true
				,spread: true
				,children: [{
					title: '二级1-1 可允许跳转'
					,id: 3
					,field: 'name11'
					,href: 'https://www.layui.com/'
					,children: [{
						title: '三级1-1-3'
						,id: 23
						,field: ''
						,children: [{
							title: '四级1-1-3-1'
							,id: 24
							,field: ''
							,children: [{
								title: '五级1-1-3-1-1'
								,id: 30
								,field: ''
							},{
								title: '五级1-1-3-1-2'
								,id: 31
								,field: ''
							}]
						}]
					},{
						title: '三级1-1-1'
						,id: 7
						,field: ''
						,children: [{
							title: '四级1-1-1-1 可允许跳转'
							,id: 15
							,field: ''
							,href: 'https://www.layui.com/doc/'
						}]
					},{
						title: '三级1-1-2'
						,id: 8
						,field: ''
						,children: [{
							title: '四级1-1-2-1'
							,id: 32
							,field: ''
						}]
					}]
				},{
					title: '二级1-2'
					,id: 4
					,spread: true
					,children: [{
						title: '三级1-2-1'
						,id: 9
						,field: ''
						,disabled: true
					},{
						title: '三级1-2-2'
						,id: 10
						,field: ''
					}]
				},{
					title: '二级1-3'
					,id: 20
					,field: ''
					,children: [{
						title: '三级1-3-1'
						,id: 21
						,field: ''
					},{
						title: '三级1-3-2'
						,id: 22
						,field: ''
					}]
				}]
			},{
				title: '一级2'
				,id: 2
				,field: ''
				,spread: true
				,children: [{
					title: '二级2-1'
					,id: 5
					,field: ''
					,spread: true
					,children: [{
						title: '三级2-1-1'
						,id: 11
						,field: ''
					},{
						title: '三级2-1-2'
						,id: 12
						,field: ''
					}]
				},{
					title: '二级2-2'
					,id: 6
					,field: ''
					,children: [{
						title: '三级2-2-1'
						,id: 13
						,field: ''
					},{
						title: '三级2-2-2'
						,id: 14
						,field: ''
						,disabled: true
					}]
				}]
			},{
				title: '一级3'
				,id: 16
				,field: ''
				,children: [{
					title: '二级3-1'
					,id: 17
					,field: ''
					,fixed: true
					,children: [{
						title: '三级3-1-1'
						,id: 18
						,field: ''
					},{
						title: '三级3-1-2'
						,id: 19
						,field: ''
					}]
				},{
					title: '二级3-2'
					,id: 27
					,field: ''
					,children: [{
						title: '三级3-2-1'
						,id: 28
						,field: ''
					},{
						title: '三级3-2-2'
						,id: 29
						,field: ''
					}]
				}]
			}]
		//基本演示
		tree.render({
			elem: '#test12'
			,data: data
			,showCheckbox: true  //是否显示复选框
			,id: 'demoId1'
			,isJump: true //是否允许点击节点时弹出新窗口跳转
			,click: function(obj){
				var data = obj.data;  //获取当前点击的节点数据
				layer.msg('状态：'+ obj.state + '<br>节点数据：' + JSON.stringify(data));
			}
		});

		//按钮事件
		util.event('lay-demo', {
			getChecked: function(othis){
				var checkedData = tree.getChecked('demoId1'); //获取选中节点的数据

				layer.alert(JSON.stringify(checkedData), {shade:0});
				console.log(checkedData);
			}
			,setChecked: function(){
				tree.setChecked('demoId1', [12, 16]); //勾选指定节点
			}
			,reload: function(){
				//重载实例
				tree.reload('demoId1', {

				});

			}
		});

	});

</script>

</body>
</html>