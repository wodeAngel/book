<%@ page import="com.oraclewdp.ddbookmaket.model.Admin" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- jsp翻译，Servlet运行 -->
<html>
<head>
<meta charset="UTF-8">
<title>登陆页面</title>
<!-- 1告诉浏览器不要缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 2css -->
<!--<link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />-->
<link href="bower_components/bootswatch/dist/united/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container-fluid" style="width: 60%">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<%
							Map<String,String> errors= (Map<String, String>) request.getAttribute("errors");
//							if (errors!=null){
//									Set<String> keySet=errors.keySet();
//									for (String key:
//											keySet) {
//										out.print(key+"---------"+errors.get(key));
//									}
//							}
						%>
						<form method="post" autocomplete="off" action="login" id="loginFrom">
							<%
								Admin admin = (Admin) request.getAttribute("admin");
								if (admin != null) {
							%>
							<div class="form-group row">

								<label for="inputName" class="col-sm-2 col-form-label text-right">用户名</label>
								<div class="col-sm-10">
									<%
										if (errors!=null&&errors.get("name")!=null){

										   %>
									<input type="text" class="form-control is-invalid" id="inputName" placeholder="用户名" name="name" value="<%=admin.getName()%>">
									<div class="invalid-feedback">
										<%=errors.get("name")%>
									</div>
									<%
										}else{
									%>
									<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name" value="<%=admin.getName()%>">
									<%
										}
									%>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
								<div class="col-sm-10">
									<%
										if (errors!=null&&errors.get("pwd")!=null){

									%>
									<input type="password" class="form-control is-invalid" id="inputPwd" placeholder="密码" name="pwd">
									<div class="invalid-feedback">
										<%=errors.get("pwd")%>
									</div>
									<%
									}else{
									%>
									<input type="password" class="form-control" id="inputPwd" placeholder="密码" name="pwd">
									<%
										}
									%>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码</label>
								<div class="col-sm-5">
									<%
										if(errors!=null&&errors.get("vcode")!=null){
										    %>
									<input class="form-control is-invalid" id="inputVcode" placeholder="验证码" name="vcode">
									<div class="invalid-feedback">
										<%=errors.get("vcode")%>
									<%
										}else{
										    %>
										<input class="form-control" id="inputVcode" placeholder="验证码" name="vcode">
									<%
										}
									%>
									</div>
								</div>
								<div class="col-5">
									<img src="vcode.png" id="vcodeImg">
								</div>
									<div class="valid-feedback">
										<%
											if(request.getAttribute("msg")!=null){
										%>
										<%=request.getAttribute("msg")%>
										<%
											}
										%>
									</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登陆</button>
								</div>
							</div>

							<%
								} else {
							%>
							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPwd" placeholder="密码" name="pwd">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码</label>
								<div class="col-sm-5">
									<input class="form-control" id="inputVcode" placeholder="验证码" name="vcode">
								</div>
								<div class="col-5">
									<img src="vcode.png" id="vcodeImg">
								</div>
								<div class="valid-feedback">
									<%
										if(request.getAttribute("msg")!=null){
									%>
									<%=request.getAttribute("msg")%>
									<%
										}
									%>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登陆</button>
								</div>
							</div>
						</form>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function () {
			$("#vcodeImg").click(function () {
				$(this).attr("src","vcode.png?t="+Math.random());
            });
        });
	</script>
	<script type="text/javascript" src="bower_components/jquery-validation/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="bower_components/jquery-validation/src/localization/messages_zh.js"></script>
	<script type="text/javascript">
        $(function () {
            $("#loginFrom").validate({
                rules: {//添加规则
                    name: {
                        required: true,
                        maxlength: 20,
                        minlength: 2
                    },
                    pwd: {
                        required: true,
                        maxlength: 20,
                        minlength: 2
                    },
                    vcode: {
                        required: true,
                        maxlength: 4,
                        minlength:4
                    },
                },
                messages: {//错误提示信息

                },
                errorElement: "div",//修改元素
                errorClass: "invalid-feedback",//修改成无效的
                highlight: function (element, errorClass, validClass) {//设置高亮
                    $(element).addClass("is-invalid").removeClass(validClass);
                    //$(element.form).find("label[for=" + element.id + "]")
                    //   .addClass(errorClass);
                },
                unhighlight: function (element, errorClass, validClass) {//取消高亮
                    $(element).removeClass("is-invalid").addClass(validClass);
                    // $(element.form).find("label[for=" + element.id + "]")
                    //  	.removeClass(errorClass);
                },
                validClass:"is-valid"//修改成有效的
            });
        });
	</script>
</body>
</html>