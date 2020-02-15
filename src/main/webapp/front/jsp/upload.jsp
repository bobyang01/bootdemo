<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/12/25
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String cssPath = application.getContextPath()+"/front/css/";
    String jsPath = application.getContextPath()+"/front/js/";
    String path = application.getContextPath();
    String jspPath =application.getContextPath()+"/front/jsp/";
%>
<html>
<head>
    <title>文件上传</title>
    <script type="text/javascript" src=<%=jsPath + "jquery-3.4.1.js"%>></script>
    <script type="text/javascript" src=<%=jsPath + "layui/layui.js"%>></script>
    <script type="text/javascript" src="<%=jsPath+"json2.js"%>"></script>
    <script type="text/javascript" src="<%=jsPath+"util.js"%>"></script>

    <link type="text/css" rel="stylesheet" href=<%=jsPath+"layui/css/layui.css"%>>
</head>
<body>
<button type="button" class="layui-btn" id="test1">
    <i class="layui-icon">&#xe67c;</i>上传图片
</button>
<script>
    layui.use('upload', function(){
        var upload = layui.upload;

        //执行实例
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            ,url: 'UserServlet?methodName=upload' //上传接口
            ,multiple:true
            ,done: function(res){
                //上传完毕回调
                alert(res.code);
            }
            ,error: function(){
                //请求异常回调
            }
            ,accept: 'file' //允许上传的文件类型
        });
    });
</script>
</body>
</html>
