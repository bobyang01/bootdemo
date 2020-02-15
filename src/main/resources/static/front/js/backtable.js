layui.use(['form', 'layer', 'jquery'], function () {
	var layer = layui.layer;
	var form = layui.form;
	var $ = layui.jquery;

	form.on('submit(search)', function (data) {
		console.log(data.field);

		return false;
	});
})