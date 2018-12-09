<%--
	if(!(Boolean) session.getAttribute("haslogined")){
		response.sendRedirect("login.jsp");
		return;
	}
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加书籍</title>
    <!-- 1告诉浏览器不要缩放 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 2css -->
    <!--<link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />-->
    <link href="bower_components/bootswatch/dist/united/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet"
          type="text/css"/>
    <style type="text/css">
        .custom-file-label::after {
            content: "浏览"
        }
    </style>
</head>
<body>
<div class="container-fluid" style="width: 80%">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <form method="post" autocomplete="off" action="bookAdd" enctype="multipart/form-data"
                          id="bookAddForm">
                        <div class="form-group row">
                            <label for="inputBid" class="col-sm-2 col-form-label text-right">大类</label>
                            <div class="col-sm-10">
                                <select name="bid" class="form-control" id="inputBid">
                                    <option>---请选择大类---</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputSid" class="col-sm-2 col-form-label text-right">小类</label>
                            <div class="col-sm-10">
                                <select name="sid" class="form-control" id="inputSid">

                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputName" class="col-sm-2 col-form-label text-right">书名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputName" placeholder="书名" name="name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputPrice" class="col-sm-2 col-form-label text-right">价格</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputPrice" placeholder="价格" name="price">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputAuthor" class="col-sm-2 col-form-label text-right">作者</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputAuthor" placeholder="作者" name="author">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputCbs" class="col-sm-2 col-form-label text-right">出版社</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputCbs" placeholder="出版社" name="cbs">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputCbDate" class="col-sm-2 col-form-label text-right">出版日期</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputCbDate" placeholder="出版日期"
                                       name="cbDate" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputDescri" class="col-sm-2 col-form-label text-right">内容简介</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" id="inputDescri" placeholder="内容简介"
                                          name="descri"></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputPhoto" class="col-sm-2 col-form-label text-right">封面图片</label>
                            <div class="col-sm-10">
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="inputPhoto"
                                           aria-describedby="inputGroupFileAddon04" name="photo"> <label
                                        class="custom-file-label" for="inputPhoto">请选择文件</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">添加</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript">
    /*var xhr=new XMLHttpRequest();
    xhr.open("GET","findAllBigType");//开始报号
    xhr.send();//
    xhr.onreadystatechange=function(){
            if (xhr.readyState==4) {//请求完全收到了
                if (xhr.status==200) {//请求成功了
                    //console.dir(xhr.responseText);
                    //让字符串中JavaScript代码执行
                    eval(xhr.responseText);
                }
            }
        }*/
    function fillSel(types) {
        for (var i = 0; i < types.length; i++) {
            var op = new Option(types[i].name, types[i].id);
            document.getElementById("inputBid").appendChild(op);
        }
    }

    function fillSmallSel(types) {
        document.getElementById("inputSid").innerHTML = "";
        for (var i = 0; i < types.length; i++) {
            var op = new Option(types[i].name, types[i].id);
            document.getElementById("inputSid").appendChild(op);
        }
    }

    /*var script=document.createElement("script");
    script.src="findAllBigType";
    document.body.appendChild(script);*/
    $.ajax({
        url: "findAllBigType",
        dataType: "jsonp",
        jsonpCallback: "fillSel"
    });
    //给大类change
    $("#inputBid").change(function () {
        $.ajax({
            url: "findAllSmallType",
            dataType: "jsonp",
            data: "bid=" + $(this).val(),
            jsonpCallback: "fillSmallSel"
        });
    });

</script>
<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
        src="bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
    $('#inputCbDate').datepicker({
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        autoclose: true,
        defaultViewDate: {
            year: new Date().getFullYear() - 18
        }
    });
</script>
<!-- <script type="text/javascript" src="findAllBigType"></script>	 -->
<script type="text/javascript" src="bower_components/jquery-validation/dist/jquery.validate.js"></script>
<script type="text/javascript" src="bower_components/jquery-validation/dist/additional-methods.js"></script>
<script type="text/javascript" src="bower_components/jquery-validation/src/localization/messages_zh.js"></script>
<script type="text/javascript">
    $(function () {
        $("#bookAddForm").validate({
            rules: {//添加规则
                price: {
                    required: true,//required必须的
                    number: true    //只能写数字
                },
                descri: {
                    required: true,
                    maxlength: 100  //长度为100
                },
                photo:{
                    required: true,
                    accept: "image/*" //类型只能为图片
                }
            },
            messages: {//错误提示信息
                price: {
                    required: "价格必填",
                    number: "必须是数字"
                },
                photo:{
                    accept:"必须是图片"
                }
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